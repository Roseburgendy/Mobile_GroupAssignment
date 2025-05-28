import 'package:flutter/material.dart';
import '../presentation/1st_workout_start_screen/workout_start_screen.dart';
import '../presentation/2nd_workout_timer_screen/workout_timer_screen.dart';
import '../presentation/3rd_workout_completion_screen/workout_completion_screen.dart';
import '../presentation/4th_workout_empty_state_screen/workout_empty_state_screen.dart';
import '../presentation/5th_card_collection_success_screen/card_collection_success_screen.dart';

class AppRoutes {
  // 🟢 页面路径常量
  static const String workoutStartScreen = '/1st_workout_start_screen';
  static const String workoutTimerScreen = '/2nd_workout_timer_screen';
  static const String workoutCompletionScreen = '/3rd_workout_completion_screen';
  static const String workoutEmptyStateScreen = '/4th_workout_empty_state_screen';
  static const String cardCollectionSuccessScreen = '/5th_card_collection_success_screen';

  // 🟡 交接给主项目时再决定初始页面，这里可暂保留一个
  static const String initialRoute = workoutStartScreen;

  // 🔵 所有页面的路由表
  static Map<String, WidgetBuilder> get routes => {
    workoutStartScreen: (context) => const WorkoutStartScreen(),
    workoutTimerScreen: (context) => const WorkoutTimerScreen(),
    workoutCompletionScreen: (context) => const WorkoutCompletionScreen(),
    workoutEmptyStateScreen: (context) => const WorkoutEmptyStateScreen(),
    cardCollectionSuccessScreen: (context) => const CardCollectionSuccessScreen(),
  };
}
