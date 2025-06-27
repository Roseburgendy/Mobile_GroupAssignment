import 'package:assignment1/src/shared/app_effects.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:flutter/material.dart';
import '../../box_ui.dart';
import '../shared/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsItem extends StatefulWidget
{
    final Icon itemIcon;
    final String text;
    final bgColor;
    final textColor;
    final VoidCallback? onTap; // 回调

    const SettingsItem({
        Key? key,
        this.onTap,
        required this.itemIcon,
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
                width: 350.w,
                padding: EdgeInsets.all(20.w),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: widget.bgColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.black100, width: 2)
                ),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center, // 建议用 center 更自然
                    children: [
                        Icon(widget.itemIcon.icon, color: widget.textColor, size: 24.w),

                        SizedBox(width: 20.w),

                        BoxText.Subtitle(widget.text, color: widget.textColor),

                        Spacer(),

                        Icon(Icons.keyboard_arrow_right_sharp, color: widget.textColor, size: 24.w),
                    ],
                ),

            )
        );
    }

}
