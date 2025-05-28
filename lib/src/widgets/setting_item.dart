import 'package:assignment1/src/shared/app_effects.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:flutter/material.dart';
import '../../box_ui.dart';
import '../shared/app_colors.dart';

class SettingsItem extends StatelessWidget
{
  final String text;
  final bgColor;
  final textColor;

  const SettingsItem({
    Key? key,
    required this.text,
    required this.bgColor,
    required this.textColor
  }) : super(key: key);

    @override
    Widget build(BuildContext context) 
    {
        return Column(
            children: [
                Container(
                    width: 298,
                    padding: const EdgeInsets.all(20),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.black100, width: 2)
                    ),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 40,
                        children: [
                            BoxText.Subtitle(text, color: textColor),
                            Icon(Icons.arrow_right_alt_rounded, color: textColor)
                        ]
                    )
                )
            ]
        );
    }
}
