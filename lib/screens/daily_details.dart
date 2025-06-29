import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/shared/app_effects.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../src/widgets/back_button.dart';
import '../../src/widgets/details_block.dart';
import '../../src/widgets/last_next_button.dart';
import 'package:assignment1/database/db_helper_healthdata.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../box_ui.dart';

class DailyDetailsScreen extends StatefulWidget {
  final DateTime selectedDate;

  const DailyDetailsScreen({super.key, required this.selectedDate});

  @override
  State<DailyDetailsScreen> createState() => _DailyDetailsScreenState();
}

class _DailyDetailsScreenState extends State<DailyDetailsScreen> {
  late DateTime currentDate;

  String currentWeight = '60.2kg';
  String weightLost = '20kg';
  String caloriesBurned = '1000kcal';
  String waterIntake = '1000';
  String stepsCount = '12000';

  @override
  void initState() {
    super.initState();
    currentDate = widget.selectedDate;
    _loadDataForDate(currentDate);
  }

  void _loadDataForDate(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('userID');

    if (userId == null) return;

    final String today = date.toIso8601String().substring(0, 10);
    final data = await DBHelper.getDataForDate(userId, today);

    if (data != null) {
      setState(() {
        double weight = data['currentWeight'] ?? 0.0;
        double iniWeight = data['iniWeight'] ?? 0.0;
        int cal = data['cal'] ?? 0;
        int water = data['water'] ?? 0;
        int step = data['step'] ?? 0;

        currentWeight = '${weight.toStringAsFixed(1)}kg';
        weightLost = '${(iniWeight - weight).toStringAsFixed(1)}kg';
        caloriesBurned = '${cal}kcal';
        waterIntake = '$water';
        stepsCount = '$step';
      });
    } else {
      setState(() {
        currentWeight = '--';
        weightLost = '--';
        caloriesBurned = '--';
        waterIntake = '--';
        stepsCount = '--';
      });
    }
  }

  void _goToPreviousDay() {
    setState(() {
      currentDate = currentDate.subtract(const Duration(days: 1));
      _loadDataForDate(currentDate);
    });
  }

  void _goToNextDay() {
    setState(() {
      currentDate = currentDate.add(const Duration(days: 1));
      _loadDataForDate(currentDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    final formattedDate = DateFormat.yMMMd(locale).format(currentDate);

    return Scaffold(
      backgroundColor: const Color(0xFFFEFDFA),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primarySolid60,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: const Color(0xFF001428), width: 2),
                boxShadow: [
                  AppEffectStyles.cardShadowEffect
                ],
              ),
              child: Column(
                children: [
                  // 返回+日期
                  Row(
                    children: [
                      AnalysisIconButton(
                        imagePath: 'assets/icon/arrow-left.svg',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.secondarySolid50,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFF001428), width: 1.5),
                        ),
                        child: Text(
                          formattedDate,
                          style: TitleStyle,
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // 体重圆形展示
                  Center(
                    child: Container(
                      width: 128,
                      height: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFFEE99),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF001428),
                            offset: Offset(2, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          currentWeight,
                          style: TitleStyle,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 体重变化和卡路里
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            BoxText.Title(AppLocalizations.of(context)!.lostWeight, color: AppColors.white100),
                            const SizedBox(height: 8),
                            BoxText.Body(weightLost, color: AppColors.white100),
                          ],
                        ),
                        Column(
                          children: [
                            BoxText.Title(AppLocalizations.of(context)!.burnedCalories, color: AppColors.white100),
                            const SizedBox(height: 8),
                            BoxText.Body(caloriesBurned, color: AppColors.white100),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FitnessStatsContainer(
                activityCalories: caloriesBurned,
                activityHours: '2',
                waterIntake: waterIntake,
                stepsCount: stepsCount,
              ),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavigationButton(
                    text: AppLocalizations.of(context)!.previousDay,
                    isNextButton: false,
                    onPressed: _goToPreviousDay,
                  ),
                  NavigationButton(
                    text: AppLocalizations.of(context)!.nextDay,
                    isNextButton: true,
                    onPressed: _goToNextDay,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
