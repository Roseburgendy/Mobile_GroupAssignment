import 'package:flutter/material.dart';
import '../presentation/workout_start_screen/workout_start_screen.dart';
import '../presentation/workout_timer_screen/workout_timer_screen.dart';
import '../presentation/workout_completion_screen/workout_completion_screen.dart';

class AppRoutes {
  // 🟢 页面路径常量
  static const String workoutStartScreen = '/workout_start_screen';
  static const String workoutTimerScreen = '/workout_timer_screen';
  static const String workoutCompletionScreen = '/workout_completion_screen';

  // 🟡 交接给主项目时再决定初始页面，这里可暂保留一个
  static const String initialRoute = workoutStartScreen;

  // 🔵 所有页面的路由表
  static Map<String, WidgetBuilder> get routes => {
    workoutStartScreen: (context) => const WorkoutStartScreen(),
    workoutTimerScreen: (context) => const WorkoutTimerScreen(),
    workoutCompletionScreen: (context) => const WorkoutCompletionScreen(),
  };
}
