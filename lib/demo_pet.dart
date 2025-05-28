import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/widgets/achievement_item.dart';
import 'package:assignment1/src/widgets/box_button.dart';
import "package:flutter/material.dart";
import 'package:assignment1/box_ui.dart';
import 'package:assignment1/src/shared/app_effects.dart';
import '../src/widgets/custom_bottom_nav_bar.dart';
class DemoPet extends StatefulWidget {
  const DemoPet({super.key});

  @override
  State<DemoPet> createState() => _DemoPetState();
}
class _DemoPetState extends State<DemoPet>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BoxText.ExtraBigHeadline("PetHouse")
    );
  }
}
