import 'package:assignment1/src/shared/app_effects.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:flutter/material.dart';
import '../../box_ui.dart';
import '../shared/app_colors.dart';

class SettingsItem extends StatefulWidget
{
    final String text;
    final bgColor;
    final textColor;
    final VoidCallback? onTap; // 回调

    const SettingsItem({
        Key? key,
        this.onTap,
        required this.text,
        required this.bgColor,
        required this.textColor
    }) : super(key: key);

    @override
    State<SettingsItem> createState() => _SettingItemState();

}

class _SettingItemState extends State<SettingsItem>
{

    @override
    Widget build(BuildContext context)
    {
        return GestureDetector(
            onTap: widget.onTap,
            child:
            Container(
                width: 298,
                padding: const EdgeInsets.all(20),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: widget.bgColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.black100, width: 2)
                ),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 40,
                    children: [
                        BoxText.Subtitle(widget.text, color: widget.textColor),
                        Icon(Icons.arrow_right_alt_rounded, color: widget.textColor)
                    ]
                )
            )
        );
    }

}
