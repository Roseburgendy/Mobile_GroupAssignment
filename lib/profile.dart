import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/widgets/achievement_item.dart';
import 'package:assignment1/src/widgets/box_button.dart';
import "package:flutter/material.dart";
import 'package:assignment1/box_ui.dart';
import 'package:assignment1/src/shared/app_effects.dart';
import '../src/widgets/custom_bottom_nav_bar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile>{
    Widget build(BuildContext context)
    {
        return Scaffold(
            body: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                children: [
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 0,
                        children: [
                            Row(
                                children: [
                                    AchievementItem(
                                        imagePath: 'assets/image/Achievement_Page/Achievement_Animal Lover.png',
                                        text: 'Animal Lover'
                                    ),
                                    AchievementItem(
                                        imagePath: 'assets/image/Achievement_Page/Achievement_Drinker.png',
                                        text: 'Drinker'
                                    )

                                ]
                            ),
                            Row(
                                children: [
                                    AchievementItem(
                                        imagePath: 'assets/image/Achievement_Page/Achievement_Energetic.png',
                                        text: 'Energetic'
                                    ),
                                    AchievementItem(
                                        imagePath: 'assets/image/Achievement_Page/Achievement_New Start.png',
                                        text: 'New Start'
                                    )
                                ]
                            )
                        ]
                    )
                ]
            ),
        );
        // TODO: implement build
    }
}
