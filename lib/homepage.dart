import 'package:assignment1/petpage_xjq.dart';
import 'package:assignment1/presentation/1st_workout_start_screen/workout_start_screen.dart';
import 'package:assignment1/profile.dart';
import 'package:assignment1/screens/MyLog.dart';
import 'package:assignment1/screens/daily_details.dart';
import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/widgets/box_button.dart';
import 'package:assignment1/src/widgets/custom_bottom_nav_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../box_ui.dart';
import '../src/shared/styles.dart';

class HomePage extends StatefulWidget
{

    const HomePage({
      super.key});

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{

    double _currentWeight = 60.2;
    double _initialWeight = 68;
    double _goalWeight = 55;
    double _waterIntake = 0;



    //编辑饮水量弹窗
    void _showAddWaterDialog() async
    {
        double tempIntake = 0;

        double? newIntake = await showDialog<double>(
            context: context,
            builder: (context)
            {
                return AlertDialog(
                    title: const Text('Add Water Intake'),
                    content: Row(
                        children: [
                            Expanded(
                                child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        labelText: 'Amount',
                                        suffixText: 'mL'
                                    ),
                                    onChanged: (value)
                                    {
                                        tempIntake = double.tryParse(value) ?? 0;
                                    }
                                )
                            )
                        ]
                    ),
                    actions: [
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(null),
                            child: const Text('Cancel')
                        ),
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(tempIntake),
                            child: const Text('OK')
                        )
                    ]
                );
            }
        );

        if (newIntake != null && newIntake > 0)
        {
            setState(()
                {
                    _waterIntake += newIntake;
                }
            );
        }
    }

    //编辑体重弹窗
    void _toggleWeightPopup() async
    {
        double tempInitial = _initialWeight;
        double tempCurrent = _currentWeight;
        double tempGoal = _goalWeight;

        await showDialog<void>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: BoxText.Headline4('Edit Weights'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        label: BoxText.Title('Initial Weight', color: AppColors.black60),
                        hintStyle: Headline4Style,
                      ),
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(text: tempInitial.toString()),
                      onChanged: (value) {
                        tempInitial = double.tryParse(value) ?? tempInitial;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        label: BoxText.Title('Current Weight', color: AppColors.black60),
                        hintStyle: Headline4Style,
                      ),
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(text: tempCurrent.toString()),
                      onChanged: (value) {
                        tempCurrent = double.tryParse(value) ?? tempCurrent;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        label: BoxText.Title('Target Weight', color: AppColors.black60),
                        hintStyle: Headline4Style,
                      ),
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(text: tempGoal.toString()),
                      onChanged: (value) {
                        tempGoal = double.tryParse(value) ?? tempGoal;
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _initialWeight = tempInitial;
                        _currentWeight = tempCurrent;
                        _goalWeight = tempGoal;
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            }

        );
    }

    //确认是否清除饮水记录弹窗
    void _showClearConfirmDialog() async
    {
        bool? confirm = await showDialog<bool>(
            context: context,
            builder: (context)
            {
                return AlertDialog(

                    title: const Text('Clear Water Intake?'),
                    content: const Text(
                        'This will reset your recorded intake. Are you sure?'
                    ),
                    actions: [
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('Cancel')
                        ),
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text('OK')
                        )
                    ]
                );
            }
        );

        if (confirm == true)
        {
            setState(()
                {
                    _waterIntake = 0;
                }
            );
        }
    }
    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            //backgroundColor: Colors.grey[200],
            body: Stack(
                children: [
                    SafeArea(
                        child: ListView(
                            children: [
                                // 顶部绿色区域
                                Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 40, 120, 43),
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                            color: const Color.fromARGB(255, 0, 41, 7),
                                            width: 2
                                        ),
                                        boxShadow: [
                                            BoxShadow(
                                                color: const Color.fromARGB(
                                                    255,
                                                    0,
                                                    41,
                                                    7
                                                ).withOpacity(0.8),
                                                blurRadius: 0,
                                                spreadRadius: 0,
                                                offset: Offset(1, 1)
                                            )
                                        ]
                                    ),
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            // 顶部行：Logo + 太阳图标
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                    Image.asset(
                                                        'assets/image/homepage_logo_ruleyou.png',
                                                        height: 60
                                                    ),
                                                    SvgPicture.asset(
                                                        'assets/icon/homepage_icon_sun.svg',
                                                        height: 24,
                                                        colorFilter: const ColorFilter.mode(
                                                            Colors.white,
                                                            BlendMode.srcIn
                                                        )
                                                    )
                                                ]
                                            ),
                                            const SizedBox(height: 20),
                                            // 中间圆形进度条 + 体重数字 + 编辑图标
                                            Center(
                                                child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                        SizedBox(
                                                            width: 180,
                                                            height: 180,
                                                            child: CircularProgressIndicator(
                                                                value: ((_initialWeight - _currentWeight) /
                                                                    (_initialWeight - _goalWeight == 0
                                                                        ? 1
                                                                        : _initialWeight - _goalWeight))
                                                                    .clamp(0.0, 1.0),
                                                                strokeWidth: 35,
                                                                backgroundColor: Colors.white.withOpacity(0.3),
                                                                valueColor: const AlwaysStoppedAnimation<Color>(
                                                                    Colors.yellowAccent
                                                                )
                                                            )
                                                        ),
                                                        Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: [
                                                                BoxText.Headline4(
                                                                    '${_currentWeight.toStringAsFixed(1)}kg',
                                                                    color: Colors.white
                                                                ),
                                                                const SizedBox(height: 4),
                                                                GestureDetector(
                                                                    onTap: _toggleWeightPopup,
                                                                    child: SvgPicture.asset(
                                                                        'assets/icon/homepage_icon_edit_weight.svg',
                                                                        height: 26,
                                                                        colorFilter: const ColorFilter.mode(
                                                                            Colors.white,
                                                                            BlendMode.srcIn
                                                                        )
                                                                    )
                                                                )
                                                            ]
                                                        )

                                                    ]
                                                )
                                            ),
                                            const SizedBox(height: 20),
                                            // 底部左右文字：初始体重 & 目标体重
                                            const SizedBox(height: 20),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                    BoxText.Subtitle(
                                                        'INITIAL\n${_initialWeight.toStringAsFixed(1)}kg',
                                                        color: Colors.white
                                                    ),
                                                    BoxText.Subtitle(
                                                        'GOAL\n${_goalWeight.toStringAsFixed(1)}kg',
                                                        color: Colors.white
                                                    )
                                                ]
                                            )
                                        ]
                                    )
                                ),

                                // 中间内容区域
                                Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                        children: [
                                            // Daily Exercise 卡片
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.yellow[100],
                                                    borderRadius: BorderRadius.circular(16),
                                                    border: Border.all(
                                                        color: const Color.fromARGB(255, 0, 41, 7),
                                                        width: 2
                                                    ),
                                                    boxShadow: [
                                                        BoxShadow(
                                                            color: const Color.fromARGB(
                                                                255,
                                                                0,
                                                                41,
                                                                7
                                                            ).withOpacity(0.8),
                                                            blurRadius: 0,
                                                            spreadRadius: 0,
                                                            offset: Offset(1, 1)
                                                        )
                                                    ]
                                                ),

                                                padding: const EdgeInsets.all(16),
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                        const Text(
                                                            'Daily Exercise',
                                                            style: Headline3Style
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Row(
                                                            children: [
                                                                SvgPicture.asset(
                                                                    'assets/icon/homepage_icon_calories.svg',
                                                                    height: 20
                                                                ),
                                                                const SizedBox(width: 8),
                                                                BoxText.Subtitle(
                                                                    'Activity calories: 100 kcal',
                                                                    color: Colors.green
                                                                )
                                                            ]
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Row(
                                                            children: [
                                                                SvgPicture.asset(
                                                                    'assets/icon/homepage_icon_timer.svg',
                                                                    height: 20
                                                                ),
                                                                const SizedBox(width: 8),
                                                                BoxText.Subtitle(
                                                                    'Activity hours: 2 hours',
                                                                    color: Colors.green
                                                                )
                                                            ]
                                                        ),
                                                        const SizedBox(height: 12),
                                                        Align(
                                                            alignment: Alignment.centerRight,
                                                            child:
                                                            BoxButton(
                                                                title: "Start",
                                                                style: ButtonStyleType.secondary,
                                                                iconRight: true,
                                                                icon: Icon(Icons.arrow_right_alt_rounded, size: 30, color: AppColors.black100),
                                                                onTap: () => {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(builder: (context) => WorkoutStartScreen())
                                                                  )

                                                                }
                                                            )    

                                                        )
                                                    ]
                                                )
                                            ),
                                            const SizedBox(height: 20),

                                            // 今日饮水 & 今日步数卡片
                                            Row(
                                                children: [
                                                    // water卡片
                                                    Expanded(
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors.yellow[100],
                                                                borderRadius: BorderRadius.circular(16),
                                                                border: Border.all(
                                                                    color: const Color.fromARGB(255, 0, 41, 7),
                                                                    width: 2
                                                                ),
                                                                boxShadow: [
                                                                    BoxShadow(
                                                                        color: const Color.fromARGB(
                                                                            255,
                                                                            0,
                                                                            41,
                                                                            7
                                                                        ).withOpacity(0.8),
                                                                        blurRadius: 0,
                                                                        spreadRadius: 0,
                                                                        offset: Offset(1, 1)
                                                                    )
                                                                ]
                                                            ),
                                                            padding: const EdgeInsets.fromLTRB(
                                                                16,
                                                                16,
                                                                16,
                                                                16
                                                            ),
                                                            child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: [
                                                                    // 标题
                                                                    const Text(
                                                                        "Today's\nWater Intake",
                                                                        style: TitleStyle
                                                                    ),
                                                                    const SizedBox(height: 8),
                                                                    // 饮水数值
                                                                    Text(
                                                                        '${_waterIntake.toStringAsFixed(0)} mL',
                                                                        style: const TextStyle(
                                                                            color: Colors.green,
                                                                            fontWeight: FontWeight.w600,
                                                                            fontSize: 22
                                                                        )
                                                                    ),

                                                                    const SizedBox(height: 18),
                                                                    // 左右两个按钮：Clear 和 +
                                                                    Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          BoxButton(
                                                                              icon: Icon(Icons.replay_sharp, size: 30, color: AppColors.black100),
                                                                              style: ButtonStyleType.secondary,
                                                                            onTap: () {
                                                                              _showClearConfirmDialog();
                                                                            },
                                                                          ),
                                                                          BoxButton(
                                                                              icon: Icon(Icons.add, size: 30, color: AppColors.black100),
                                                                              style: ButtonStyleType.secondary,
                                                                            onTap: () {
                                                                              _showAddWaterDialog();
                                                                            },
                                                                          ),

                                                                        ]
                                                                    )
                                                                ]
                                                            )
                                                        )
                                                    ),
                                                    const SizedBox(width: 16),
                                                    // 右边的“步数”卡片
                                                    Expanded(
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors.yellow[100],
                                                                borderRadius: BorderRadius.circular(16),
                                                                border: Border.all(
                                                                    color: const Color.fromARGB(255, 0, 41, 7),
                                                                    width: 2
                                                                ),
                                                                boxShadow: [
                                                                    BoxShadow(
                                                                        color: const Color.fromARGB(
                                                                            255,
                                                                            0,
                                                                            41,
                                                                            7
                                                                        ).withOpacity(0.8),
                                                                        blurRadius: 1,
                                                                        spreadRadius: 1,
                                                                        offset: Offset(1, 1)
                                                                    )
                                                                ]
                                                            ),
                                                            padding: const EdgeInsets.fromLTRB(
                                                                16,
                                                                16,
                                                                16,
                                                                16
                                                            ),
                                                            child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: [
                                                                    // 标题
                                                                    const Text(
                                                                        "Today's\nSteps",
                                                                        style: TitleStyle
                                                                    ),
                                                                    const SizedBox(height: 18),
                                                                    // 步数数值
                                                                    const Text(
                                                                        '12000',
                                                                        style: TextStyle(
                                                                            color: Colors.green,
                                                                            fontWeight: FontWeight.w600,
                                                                            fontSize: 22
                                                                        )
                                                                    ),
                                                                    const SizedBox(height: 8),
                                                                    // 右下角按钮（箭头）
                                                                    Align(
                                                                        alignment: Alignment.centerRight,
                                                                        child:
                                                                        BoxButton(
                                                                            style: ButtonStyleType.secondary,
                                                                            iconRight: true,
                                                                            icon: Icon(Icons.arrow_right_alt_rounded, size: 30, color: AppColors.black100),
                                                                            onTap: () => {
                                                                              Navigator.push(
                                                                                  context,
                                                                                  MaterialPageRoute(builder: (context) => DailyDetailsScreen(selectedDate: DateTime.now()))
                                                                              )
                                              
                                                                            }
                                                                        )
                                                                    )
                                                                ]
                                                            )
                                                        )
                                                    )
                                                ]
                                            )
                                        ]
                                    )
                                )
                            ]
                        )
                    )
                ]
            )
        );
    }
}

