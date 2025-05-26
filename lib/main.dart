import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app_export.dart';
import 'presentation/workout_start_screen/workout_start_screen.dart'; // 👈 引入你的页面

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'lizijing_s_application',
          debugShowCheckedModeBanner: false,

          /// ✅ 临时调试页面：直接进入 WorkoutStartScreen
          home: const WorkoutStartScreen(),

          /// ❌ 注释掉主项目用的路由配置（等组内对接时再恢复）
          // initialRoute: AppRoutes.initialRoute,
          // routes: AppRoutes.routes,

          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(1.0),
              ),
              child: child!,
            );
          },
        );
      },
    );
  }
}
