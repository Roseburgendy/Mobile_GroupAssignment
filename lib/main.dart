import 'package:flutter/material.dart';
import 'package:assignment1/routes/app_routes.dart';
import 'package:assignment1/screens/login.dart';
import 'package:assignment1/MainNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:assignment1/dbzzq/openLocalDatabase.dart';
import 'package:assignment1/services/database_service.dart';
import 'package:path/path.dart'; // 为 deleteOldDatabase 加上 join

late Database db;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //清除旧数据库的function，如果需要就运行一下
  //await deleteOldDatabase();

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

// ✅ 删除旧数据库（建议只调用一次，之后注释掉即可）
Future<void> deleteOldDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'healthapp.db');
  await deleteDatabase(path);
  print('旧数据库已删除');
}
