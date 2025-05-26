import 'package:flutter/material.dart';
import '../presentation/workout_start_screen/workout_start_screen.dart';


class AppRoutes {
  // ✅ 你自己的页面路由
  static const String workoutStartScreen = '/workout_start_screen';

  // ✅ 主导航页面（组员负责）
  static const String appNavigationScreen = '/app_navigation_screen';

  // ✅ 设置主项目初始页面（交接时用）
  static const String initialRoute = appNavigationScreen;

  // ✅ 所有路由注册表
  static Map<String, WidgetBuilder> get routes => {
    workoutStartScreen: (context) => const WorkoutStartScreen(),
  };
}
