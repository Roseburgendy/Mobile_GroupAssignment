import 'package:assignment1/routes/app_routes.dart';
import 'package:assignment1/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';


import 'MainNavigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 需要初始化绑定
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}


class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: isLoggedIn ? MainNavigationBar() : LoginScreen(),
          routes: AppRoutes.routes,
        );
      },
    );
  }
}



