import 'package:flutter/material.dart';

class CalendarTitle extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final double lineHeight;
  final double width;
  final double? height;
  final bool centerAlign; 

  const CalendarTitle({
    Key? key,
    required this.title,
    this.color = const Color(0xFF001428),
    this.fontSize = 20,
    this.fontFamily = 'Montserrat',
    this.fontWeight = FontWeight.w700,
    this.lineHeight = 1.7,
    this.width = 327,
    this.height,
    this.centerAlign = false, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          height: lineHeight,
        ),
        textAlign: centerAlign ? TextAlign.center : TextAlign.left,
        overflow: TextOverflow.ellipsis, 
        maxLines: 1,
      ),
    );
  }
}