import 'package:flutter/material.dart';

class TextLinkButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration decoration;

  const TextLinkButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xFF001428), // 深蓝色
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.decoration = TextDecoration.underline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'Montserrat',
          fontWeight: fontWeight,
          decoration: decoration,
        ),
      ),
    );
  }
}


//login page slogan
class loginImage extends StatelessWidget {
  final double width;
  final double height;
  final String? imageUrl;
  final ImageProvider? imageProvider;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  const loginImage({
    Key? key,
    this.width = 374,
    this.height = 187,
    this.imageUrl,
    this.imageProvider,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: _getDecorationImage(),
      ),
    );
  }

  DecorationImage? _getDecorationImage() {
    if (imageProvider != null) {
      return DecorationImage(
        image: imageProvider!,
        fit: fit,
      );
    } else if (imageUrl != null) {
      return DecorationImage(
        image: NetworkImage(imageUrl!),
        fit: fit,
      );
    }
    return null;
  }
}

class WeekdayHeaderRow extends StatelessWidget {

  final List<String> weekdays;
  final Color textColor;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final double spacing;
  final double itemHeight;

  const WeekdayHeaderRow({
    Key? key,
    this.weekdays = const ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
    this.textColor = Colors.black,
    this.fontSize = 12,
    this.fontFamily = 'Montserrat',
    this.fontWeight = FontWeight.w500,
    this.spacing = 21,
    this.itemHeight = 21,
  }) : super(key: key);

  double _calculateWidth(String text) {
    switch (text) {
      case 'MON':
      case 'WED':
        return 35.50;
      case 'TUE':
        return 27.89;
      case 'THU':
      case 'SUN':
        return 30.43;
      case 'FRI':
        return 22.82;
      case 'SAT':
        return 27.05;
      default:
        return 30.0; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: weekdays.map((day) {
        return SizedBox(
          width: _calculateWidth(day),
          height: itemHeight,
          child: Text(
            day,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
            ),
          ),
        );
      }).toList(),
    );
  }
}
