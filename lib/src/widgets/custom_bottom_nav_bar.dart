import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  static const Color greenBg = Color.fromARGB(255, 40, 120, 43);
  static const Color activeColor = Colors.orange;
  static const Color inactiveColor = Color.fromARGB(255, 200, 200, 200);
  static const Color activeBgCircle = Color.fromARGB(
    255,
    255,
    255,
    180,
  ); // 浅黄色背景

  final List<_NavItemData> items = const [
    _NavItemData('assets/icon/homepage_icon_home_active.svg', 'Home'),
    _NavItemData('assets/icon/icon_chart.svg', 'Chart'),
    _NavItemData('assets/icon/icon_exercise.svg', 'Exercise'),
    _NavItemData('assets/icon/icon_pet.svg', 'Pet'),
    _NavItemData('assets/icon/icon_profile.svg', 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: greenBg,
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isActive = index == currentIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isActive)
                  Container(
                    padding: const EdgeInsets.all(12), // 比原来的8更大
                    decoration: BoxDecoration(
                      color: activeBgCircle,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 41, 7), // 描边颜色
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(
                            255,
                            0,
                            41,
                            7,
                          ).withOpacity(0.8),
                          blurRadius: 0,
                          spreadRadius: 0,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      items[index].iconPath,
                      height: 28, // 图标略微放大
                      color: activeColor,
                    ),
                  )
                else
                  SvgPicture.asset(
                    items[index].iconPath,
                    height: 24,
                    color: inactiveColor,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _NavItemData {
  final String iconPath;
  final String label;

  const _NavItemData(this.iconPath, this.label);
}
