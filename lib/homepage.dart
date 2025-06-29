import 'package:assignment1/src/shared/app_effects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assignment1/database/db_helper_healthdata.dart';
import 'package:assignment1/screens/daily_details.dart';
import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/widgets/box_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../box_ui.dart';
import '../src/shared/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentWeight = 60.2;
  double _initialWeight = 68;
  double _goalWeight = 55;
  double _waterIntake = 0;
  double _time = 0;
  double _calories = 0;
  int? _userId;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userId = prefs.getInt('userID');
    });
  }

  void _toggleWeightPopup() async {
    double tempInitial = _initialWeight;
    double tempCurrent = _currentWeight;
    double tempGoal = _goalWeight;

    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.secondarySolid10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Colors.black, // 边框颜色
              width: 2,            // 边框宽度
            ),
          ),
          title: BoxText.Headline4(AppLocalizations.of(context)!.editWeights),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildWeightInput(AppLocalizations.of(context)!.initialWeight, tempInitial, (val) {
                tempInitial = val;
              }),
              _buildWeightInput(AppLocalizations.of(context)!.currentWeight, tempCurrent, (val) {
                tempCurrent = val;
              }),
              _buildWeightInput(AppLocalizations.of(context)!.targetWeight, tempGoal, (val) {
                tempGoal = val;
              }),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
                child: BoxText.Button(AppLocalizations.of(context)!.cancel,color: AppColors.communicationSolidError,)

            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  _initialWeight = tempInitial;
                  _currentWeight = tempCurrent;
                  _goalWeight = tempGoal;
                });
                if (_userId != null) {
                  await DBHelper.updateWeight(_userId!, _currentWeight, _initialWeight, _goalWeight);
                }
                Navigator.of(context).pop();
              },
                child: BoxText.Button(AppLocalizations.of(context)!.ok,color: AppColors.communicationSolidSuccess,)
            ),
          ],
        );
      },
    );
  }

  Widget _buildWeightInput(String label, double initialValue, Function(double) onChanged) {
    final controller = TextEditingController(text: initialValue.toStringAsFixed(1));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: buildInputDecoration(label, "kg"),
        onChanged: (val) => onChanged(double.tryParse(val) ?? initialValue),
      ),
    );
  }

  Future<void> _showAddWaterDialog() async {
    double tempIntake = 0;
    final intake = await showDialog<double>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.secondarySolid10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Colors.black, // 边框颜色
              width: 2,            // 边框宽度
            ),
          ),
          title: BoxText.Headline4(AppLocalizations.of(context)!.addWaterIntake),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration: buildInputDecoration(
              AppLocalizations.of(context)!.amount,
              AppLocalizations.of(context)!.mlUnit,
            ),
            onChanged: (value) => tempIntake = double.tryParse(value) ?? 0,
          ),

          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(null),
                child: BoxText.Button(AppLocalizations.of(context)!.cancel,color: AppColors.communicationSolidError,)
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(tempIntake),
                child: BoxText.Button(AppLocalizations.of(context)!.ok,color: AppColors.communicationSolidSuccess,)
            ),
          ],
        );
      },
    );

    if (intake != null && intake > 0) {
      setState(() => _waterIntake += intake);
      if (_userId != null) {
        await DBHelper.updateWater(_userId!, _waterIntake.toInt());
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('shouldRefreshMyLog', true);
      }
    }
  }

  Future<void> _showClearConfirmDialog() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.secondarySolid10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: Colors.black, // 边框颜色
            width: 2,            // 边框宽度
          ),
        ),
        title: BoxText.Headline4(AppLocalizations.of(context)!.clearWaterIntakeTitle),
        content: BoxText.Body(AppLocalizations.of(context)!.clearWaterIntakeContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: BoxText.Button(AppLocalizations.of(context)!.cancel,color: AppColors.communicationSolidError,)
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
              child: BoxText.Button(AppLocalizations.of(context)!.ok,color: AppColors.communicationSolidSuccess,)
          ),
        ],
      ),
    );

    if (confirm == true) {
      setState(() => _waterIntake = 0);
      if (_userId != null) {
        await DBHelper.updateWater(_userId!, 0);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('shouldRefreshMyLog', true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 顶部体重进度
            _buildWeightCard(context),

            const SizedBox(height: 20),

            // Daily Exercise 卡片
            _buildExerciseCard(context),

            const SizedBox(height: 20),

            // 饮水与步数卡片
            Row(
              children: [
                Expanded(child: _buildWaterCard(context)),
                const SizedBox(width: 16),
                Expanded(child: _buildStepsCard(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 40, 120, 43),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color.fromARGB(255, 0, 41, 7), width: 2),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 41, 7).withOpacity(0.8),
            offset: const Offset(1, 1),
          )
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/image/homepage_logo_ruleyou.png', height: 60),
              SvgPicture.asset(
                'assets/icon/homepage_icon_sun.svg',
                height: 24,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 180,
                  height: 180,
                  child: CircularProgressIndicator(
                    value: ((_initialWeight - _currentWeight) /
                        ((_initialWeight - _goalWeight).abs() == 0 ? 1 : (_initialWeight - _goalWeight)))
                        .clamp(0.0, 1.0),
                    strokeWidth: 35,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.yellowAccent),
                  ),
                ),
                Column(
                  children: [
                    BoxText.Headline4('${_currentWeight.toStringAsFixed(1)}kg', color: Colors.white),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: _toggleWeightPopup,
                      child: SvgPicture.asset(
                        'assets/icon/homepage_icon_edit_weight.svg',
                        height: 26,
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BoxText.Subtitle(
                AppLocalizations.of(context)!.firstWeight(_initialWeight.toStringAsFixed(1)),
                color: Colors.white,
              ),
              BoxText.Subtitle(
                AppLocalizations.of(context)!.goalWeight(_goalWeight.toStringAsFixed(1)),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(BuildContext context) {
    return Container(
      decoration: _cardDecoration(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.dailyExercise, style: Headline3Style),
          const SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset('assets/icon/homepage_icon_calories.svg', height: 20),
              const SizedBox(width: 8),
              BoxText.Subtitle(AppLocalizations.of(context)!.activityCalories(_calories.toStringAsFixed(0)),
                  color: Colors.green),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset('assets/icon/homepage_icon_timer.svg', height: 20),
              const SizedBox(width: 8),
              BoxText.Subtitle(AppLocalizations.of(context)!.activityHours(_time.toStringAsFixed(1)),
                  color: Colors.green),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: BoxButton(
              title: AppLocalizations.of(context)!.start,
              style: ButtonStyleType.secondary,
              iconRight: true,
              icon: const Icon(Icons.arrow_right_alt_rounded, size: 30, color: AppColors.black100),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/main_navigation',
                  arguments: {'initialIndex': 2},
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWaterCard(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Container(
        decoration: _cardDecoration(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.todayWaterTitle, style: TitleStyle),
            const SizedBox(height: 9),
            BoxText.Title( '${_waterIntake.toStringAsFixed(0)} ${AppLocalizations.of(context)!.mlUnit}',
            color: AppColors.primarySolid50,),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoxButton(
                  icon: const Icon(Icons.replay_sharp, size: 20, color: AppColors.black100),
                  style: ButtonStyleType.secondary,
                  onTap: _showClearConfirmDialog,
                ),
                BoxButton(
                  icon: const Icon(Icons.add, size: 20, color: AppColors.black100),
                  style: ButtonStyleType.secondary,
                  onTap: _showAddWaterDialog,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepsCard(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Container(
        decoration: _cardDecoration(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.todayStepsTitle, style: TitleStyle),
            const SizedBox(height: 10),
            BoxText.Title('12000',
              color: AppColors.primarySolid50,),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: BoxButton(
                style: ButtonStyleType.secondary,
                iconRight: true,
                icon: const Icon(Icons.arrow_right_alt_rounded, size: 30, color: AppColors.black100),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailyDetailsScreen(selectedDate: DateTime.now()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: AppColors.secondarySolid10,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color.fromARGB(255, 0, 41, 7), width: 2),
      boxShadow: [
       AppEffectStyles.cardShadowEffect
      ],
    );
  }
}
