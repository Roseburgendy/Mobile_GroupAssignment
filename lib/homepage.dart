import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../box_ui.dart';
import '../src/shared/styles.dart';

class HomePage extends StatefulWidget
{
  const HomePage({super.key});

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
        builder: (context)
        {
          return AlertDialog(
              title: const Text('Edit Weights'),
              content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Initial Weight'),
                        controller: TextEditingController(text: tempInitial.toString()),
                        onChanged: (value)
                        {
                          tempInitial = double.tryParse(value) ?? tempInitial;
                        }
                    ),
                    TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Current Weight'),
                        controller: TextEditingController(text: tempCurrent.toString()),
                        onChanged: (value)
                        {
                          tempCurrent = double.tryParse(value) ?? tempCurrent;
                        }
                    ),
                    TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Goal Weight'),
                        controller: TextEditingController(text: tempGoal.toString()),
                        onChanged: (value)
                        {
                          tempGoal = double.tryParse(value) ?? tempGoal;
                        }
                    )
                  ]
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel')
                ),
                TextButton(
                    onPressed: ()
                    {
                      setState(()
                      {
                        _initialWeight = tempInitial;
                        _currentWeight = tempCurrent;
                        _goalWeight = tempGoal;
                      }
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK')
                )
              ]
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
                                                width: 140,
                                                height: 140,
                                                child: CircularProgressIndicator(
                                                    value: ((_initialWeight - _currentWeight) /
                                                        (_initialWeight - _goalWeight == 0
                                                            ? 1
                                                            : _initialWeight - _goalWeight))
                                                        .clamp(0.0, 1.0),
                                                    strokeWidth: 25,
                                                    backgroundColor: Colors.white.withOpacity(0.3),
                                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                                        Colors.yellowAccent
                                                    )
                                                )
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                BoxText.Title(
                                                  '${_currentWeight.toStringAsFixed(1)}kg',
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(height: 4),
                                                GestureDetector(
                                                  onTap: _toggleWeightPopup,
                                                  child: SvgPicture.asset(
                                                    'assets/icon/homepage_icon_edit_weight.svg',
                                                    height: 16,
                                                    colorFilter: const ColorFilter.mode(
                                                      Colors.white,
                                                      BlendMode.srcIn,
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                                        BoxText.Caption(
                                            'INITIAL\n${_initialWeight.toStringAsFixed(1)}kg',
                                            color: Colors.white
                                        ),
                                        BoxText.Caption(
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
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black
                                                )
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icon/homepage_icon_calories.svg',
                                                      height: 20
                                                  ),
                                                  const SizedBox(width: 8),
                                                  BoxText.Caption(
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
                                                  BoxText.Caption(
                                                      'Activity hours: 2 hours',
                                                      color: Colors.green
                                                  )
                                                ]
                                            ),
                                            const SizedBox(height: 12),
                                            Align(
                                                alignment: Alignment.centerRight,
                                                child: ElevatedButton.icon(
                                                  //press START
                                                    onPressed: ()
                                                    {
                                                      print('Start pressed');
                                                    },
                                                    icon: SvgPicture.asset(
                                                        'assets/icon/homepage_icon_arrow_right.svg',
                                                        height: 16
                                                    ),
                                                    label: const Text(
                                                        'START',
                                                        style: myButtonStyle
                                                    ),
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.yellow,
                                                        foregroundColor: Colors.black,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(20)
                                                        )
                                                    )
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
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.black
                                                          )
                                                      ),
                                                      const SizedBox(height: 8),
                                                      // 饮水数值
                                                      Text(
                                                          '${_waterIntake.toStringAsFixed(0)} mL',
                                                          style: const TextStyle(
                                                              color: Colors.green,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16
                                                          )
                                                      ),

                                                      const SizedBox(height: 8),
                                                      // 左右两个按钮：Clear 和 +
                                                      Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            // 左下角 Clear 按钮
                                                            ElevatedButton(
                                                                onPressed: _showClearConfirmDialog,
                                                                style: ElevatedButton.styleFrom(
                                                                    backgroundColor: Colors.yellow,
                                                                    foregroundColor: Colors.black,
                                                                    padding: const EdgeInsets.symmetric(
                                                                        horizontal: 12,
                                                                        vertical: 8
                                                                    ),
                                                                    minimumSize: const Size(40, 36),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(20)
                                                                    ),
                                                                    elevation: 2
                                                                ),
                                                                child: const Text(
                                                                    'Clean',
                                                                    style: TextStyle(
                                                                        fontSize: 12,
                                                                        fontWeight: FontWeight.bold
                                                                    )
                                                                )
                                                            ),
                                                            // 右下角加号按钮
                                                            ElevatedButton.icon(
                                                                onPressed: _showAddWaterDialog,
                                                                icon: SvgPicture.asset(
                                                                    'assets/icon/homepage_icon_add.svg',
                                                                    height: 16
                                                                ),
                                                                label: const Text(''),
                                                                style: ElevatedButton.styleFrom(
                                                                    backgroundColor: Colors.yellow,
                                                                    foregroundColor: Colors.black,
                                                                    padding: const EdgeInsets.symmetric(
                                                                        horizontal: 12,
                                                                        vertical: 8
                                                                    ),
                                                                    minimumSize: const Size(40, 36),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(20)
                                                                    ),
                                                                    elevation: 2
                                                                )
                                                            )
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
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.black
                                                          )
                                                      ),
                                                      const SizedBox(height: 8),
                                                      // 步数数值
                                                      const Text(
                                                          '12000',
                                                          style: TextStyle(
                                                              color: Colors.green,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16
                                                          )
                                                      ),
                                                      const SizedBox(height: 8),
                                                      // 右下角按钮（箭头）
                                                      Align(
                                                          alignment: Alignment.centerRight,
                                                          child: ElevatedButton.icon(
                                                              onPressed: ()
                                                              {
                                                                print("Steps clicked");
                                                              },
                                                              icon: SvgPicture.asset(
                                                                  'assets/icon/homepage_icon_arrow_right.svg',
                                                                  height: 16
                                                              ),
                                                              label: const Text(''),
                                                              style: ElevatedButton.styleFrom(
                                                                  backgroundColor: Colors.yellow,
                                                                  foregroundColor: Colors.black,
                                                                  padding: const EdgeInsets.symmetric(
                                                                      horizontal: 12,
                                                                      vertical: 8
                                                                  ),
                                                                  minimumSize: const Size(40, 36),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(
                                                                          20
                                                                      )
                                                                  ),
                                                                  elevation: 2
                                                              )
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

      // 底部导航栏

      // 底部导航栏
    );
  }
}
