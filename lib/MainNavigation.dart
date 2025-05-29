import 'package:assignment1/petpage_xjq.dart';
import 'package:assignment1/presentation/1st_workout_start_screen/workout_start_screen.dart';
import 'package:assignment1/profile.dart';
import 'package:assignment1/screens/MyLog.dart';
import 'package:assignment1/src/widgets/custom_bottom_nav_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'homepage.dart';


class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({super.key});

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {

  final screens= [
    HomePage(),
    MyLogScreen(),
    WorkoutStartScreen(),
    PetPage(),
    Profile()
  ];

  //State class
  int _page = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null && args.containsKey('initialIndex')) {
      setState(() {
        _page = args['initialIndex'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<_NavItemData> navItems = const [
      _NavItemData('assets/icon/homepage_icon_home_active.svg', 'Home'),
      _NavItemData('assets/icon/icon_chart.svg', 'Chart'),
      _NavItemData('assets/icon/icon_exercise.svg', 'Exercise'),
      _NavItemData('assets/icon/icon_pet.svg', 'Pet'),
      _NavItemData('assets/icon/icon_profile.svg', 'Profile'),
    ];
    return Scaffold(
      body: IndexedStack(
        index: _page,
        children: screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
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
          final isActive = index == _page ;

          return Container(
            padding: const EdgeInsets.all(15),
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
              height: isActive ? 30 : 28,
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

class _NavItemData {
  final String iconPath;
  final String label;

  const _NavItemData(this.iconPath, this.label);
}