import 'package:flutter/material.dart';
import 'package:assignment1/routes/app_routes.dart';
import 'package:assignment1/screens/login.dart';
import 'package:assignment1/MainNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:assignment1/dbzzq/openLocalDatabase.dart';
import 'package:assignment1/services/database_service.dart';

late Database db; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  db = await openLocalDatabase();

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
