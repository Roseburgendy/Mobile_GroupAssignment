import 'package:flutter/material.dart';

//login button
class loginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final Color backgroundColor;
  final Color borderColor;
  final Color shadowColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Widget? trailingIcon;

  const loginButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 173,
    this.backgroundColor = const Color(0xFF006B07),
    this.borderColor = const Color(0xFF001428),
    this.shadowColor = const Color(0xFF001428),
    this.textColor = Colors.white,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        padding: const EdgeInsets.only(
          top: 12,
          left: 16,
          right: 12,
          bottom: 12,
        ),
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(9999),
          ),
          shadows: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 0,
              offset: const Offset(1, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontFamily: 'Montserrat',
                fontWeight: fontWeight,
              ),
            ),
            const SizedBox(width: 8),
            if (trailingIcon != null) trailingIcon!,
          ],
        ),
      ),
    );
  }
}