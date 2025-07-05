import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:assignment1/routes/app_routes.dart';
import 'package:assignment1/screens/login.dart';
import 'package:assignment1/MainNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:assignment1/dbzzq/openLocalDatabase.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'l10n/l10n.dart';

late Database db;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await deleteOldDatabase(); // <- 需要时取消注释

  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getInt('userId');
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  db = await openLocalDatabase();

  runApp(MyApp(isLoggedIn: userId != null));
}

class MyApp extends StatefulWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  static void setLocale(BuildContext context, Locale newLocale) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: _locale,
            home: widget.isLoggedIn ? MainNavigationBar() : LoginScreen(),
            routes: AppRoutes.routes,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}

Future<void> deleteOldDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = '$dbPath/healthapp.db';

  await deleteDatabase(path);
  print('✅ 数据库已删除');
}