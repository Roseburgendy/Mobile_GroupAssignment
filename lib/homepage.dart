import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../box_ui.dart';
import '../src/shared/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            // 顶部绿色区域
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 40, 120, 43),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
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
                        height: 30,
                      ),
                      SvgPicture.asset(
                        'assets/icon/homepage_icon_sun.svg',
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // 中间圆形进度条 + 体重数字 + 编辑图标
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 130,
                          height: 130,
                          child: CircularProgressIndicator(
                            value: 0.5,
                            strokeWidth: 10,
                            backgroundColor: Colors.white.withOpacity(0.3),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.yellowAccent,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            BoxText.Title('60.2kg', color: Colors.white),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: () {
                                print("点击了编辑体重按钮");
                              },
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 底部左右文字：初始体重 & 目标体重
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoxText.Caption('INITIAL\n68kg', color: Colors.white),
                      BoxText.Caption('GOAL\n55kg', color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),

            // 中间内容区域
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    // Daily Exercise 卡片
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow[100],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 标题字体缩小
                          const Text(
                            'Daily Exercise',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icon/homepage_icon_calories.svg',
                                height: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Activity calories: 100 kcal',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icon/homepage_icon_timer.svg',
                                height: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Activity hours: 2 hours',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                print('Start pressed');
                              },
                              icon: SvgPicture.asset(
                                'assets/icon/homepage_icon_arrow_right.svg',
                                height: 16,
                              ),
                              label: const Text('START', style: myButtonStyle),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 今日饮水 & 今日步数卡片
                    Row(
                      children: [
                        // 左边的“饮水”卡片
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // 饮水数值
                                const Text(
                                  '1000 mL',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // 右下角按钮（加号）
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      print("Add Water Intake clicked");
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/icon/homepage_icon_add.svg',
                                      height: 16,
                                    ),
                                    label: const Text(''), // 文字为空，仅显示图标
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.yellow, // 背景色
                                      foregroundColor: Colors.black, // 图标颜色
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      minimumSize: const Size(40, 36),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      elevation: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // 右边的“步数”卡片
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // 步数数值
                                const Text(
                                  '12000',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // 右下角按钮（箭头）
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      print("Steps clicked");
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/icon/homepage_icon_arrow_right.svg',
                                      height: 16,
                                    ),
                                    label: const Text(''),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.yellow,
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      minimumSize: const Size(40, 36),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      elevation: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 40, 120, 43),
        currentIndex: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 200, 200, 200),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icon/homepage_icon_home_active.svg',
              height: 24,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icon/icon_chart.svg',
              height: 24,
              color: Colors.white,
            ),
            label: 'Chart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icon/icon_exercise.svg',
              height: 24,
              color: Colors.white,
            ),
            label: 'Exercise',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icon/icon_pet.svg',
              height: 24,
              color: Colors.white,
            ),
            label: 'Pet',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icon/icon_profile.svg',
              height: 24,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
