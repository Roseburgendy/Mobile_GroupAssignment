import 'package:assignment1/src/shared/app_effects.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:flutter/material.dart';
import '../../box_ui.dart';
import '../shared/app_colors.dart';

class AchievementItem extends StatelessWidget
{
    final String imagePath;
    final String text;

    const AchievementItem({
        Key? key,
        required this.imagePath,
        required this.text
    }) : super(key: key);

    @override
    Widget build(BuildContext context) 
    {
        return SizedBox(
            width: 135,
            height: 150,
            child: Stack(
                alignment: Alignment.topCenter,
                children: [
                    Positioned(
                        top: 60,
                        // Card
                        child: Container(
                            width: 119,
                            height: 89,
                            decoration: BoxDecoration(
                                color: AppColors.secondarySolid50,
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(width: 2, color: Colors.black),
                                boxShadow: [AppEffectStyles.itemShadowEffect]
                            ),
                          // Text
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Text(
                                  '"$text"',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: OverlineStyle,
                                ),
                              ),
                            ],
                          ),
                        )
                    ),

                    // Medal
                    Positioned(
                        top: 30,
                        child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    image: AssetImage(imagePath),
                                    fit: BoxFit.contain
                                )
                            )
                        )
                    )
                ]
            )
        );
    }
}
