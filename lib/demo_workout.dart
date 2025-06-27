import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/widgets/achievement_item.dart';
import 'package:assignment1/src/widgets/box_button.dart';
import "package:flutter/material.dart";
import 'package:assignment1/box_ui.dart';
import 'package:assignment1/src/shared/app_effects.dart';
import '../src/widgets/custom_bottom_nav_bar.dart';
class DemoWorkout extends StatefulWidget {
  const DemoWorkout({super.key});

  @override
  State<DemoWorkout> createState() => _DemoWorkoutState();
}
class _DemoWorkoutState extends State<DemoWorkout>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BoxText.ExtraBigHeadline("Workout")
    );
  }
}
