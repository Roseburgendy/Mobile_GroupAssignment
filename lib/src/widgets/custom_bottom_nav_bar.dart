import 'package:assignment1/demo_analytics.dart';
import 'package:assignment1/demo_workout.dart';
import 'package:assignment1/demo_pet.dart';
import 'package:assignment1/homepage.dart';
import 'package:assignment1/profile.dart';
import 'package:assignment1/src/shared/app_colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatefulWidget {
  // Currently selected index
  final int currentIndex;

  // Callback function when a navigation item is tapped
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  static const Color greenBg = AppColors.primarySolid60;
  static const Color activeColor = AppColors.secondarySolid90;
  static const Color inactiveColor = AppColors.white100;
  static const Color activeBgCircle = AppColors.secondarySolid20;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late int _selectedIndex;

// Define navigation items with their SVG icons and labels
  final List<_NavItemData> navItems = const [
    _NavItemData('assets/icon/homepage_icon_home_active.svg', 'Home'),
    _NavItemData('assets/icon/icon_chart.svg', 'Chart'),
    _NavItemData('assets/icon/icon_exercise.svg', 'Exercise'),
    _NavItemData('assets/icon/icon_pet.svg', 'Pet'),
    _NavItemData('assets/icon/icon_profile.svg', 'Profile'),
  ];

  final screens= [
    HomePage(),
    DemoAnalytics(),
    DemoWorkout(),
    DemoPet(),
    Profile()
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }
//State class
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        /// bg color
        backgroundColor: Colors.transparent,
        /// app bar color
        color: CustomBottomNavBar.greenBg,
        height: 70,

        /// Animation
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),

        /// list of icon widgets
        items: navItems.map((item) {
          int index = navItems.indexOf(item);
          final isActive = index == _selectedIndex;

          return Container(
            padding: const EdgeInsets.all(8),
            decoration: isActive
                ? BoxDecoration(
              shape: BoxShape.circle,
              color: CustomBottomNavBar.activeBgCircle,
              border: Border.all(color: Colors.black, width: 2),
            ) : null,

            child: SvgPicture.asset(
              item.iconPath,
              color: isActive
                  ? CustomBottomNavBar.activeColor
                  : CustomBottomNavBar.inactiveColor,
              // Active icon is slightly larger
              height: isActive ? 30 : 24,
            ),
          );
        }).toList(),


        /// Handle tap event
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
// Private data class to store icon path and label for each navigation item
class _NavItemData {
  final String iconPath;
  final String label;

  const _NavItemData(this.iconPath, this.label);
}