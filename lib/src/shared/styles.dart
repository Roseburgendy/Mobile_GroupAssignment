import 'package:assignment1/src/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TEXT STYLES
// ExtraBigHeadline
TextStyle ExtraBigHeadlineStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 48.sp,
    fontWeight: FontWeight.w700
);

//Headline 1
TextStyle Headline1Style = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 40.sp,
    fontWeight: FontWeight.w700
);

//Headline 2
TextStyle Headline2Style = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 36.sp,
    fontWeight: FontWeight.w700
);

//Headline 3
TextStyle Headline3Style = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 32.sp,
    fontWeight: FontWeight.w700
);

//Headline 4
TextStyle Headline4Style = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24.sp,
    fontWeight: FontWeight.w700
);

//Title
TextStyle TitleStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.sp,
    fontWeight: FontWeight.w700
);

//Subtitle
TextStyle SubtitleStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.sp,
    fontWeight: FontWeight.w600
);

//Input
 TextStyle InputStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.sp,
    fontWeight: FontWeight.w500
);

//Body
 TextStyle BodyStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.sp,
    fontWeight: FontWeight.w400
);

//Number
 TextStyle NumberStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.sp,
    fontWeight: FontWeight.w700
);

//Button
 TextStyle myButtonStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18.sp,
    fontWeight: FontWeight.w600
);

//Overline
TextStyle OverlineStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12.sp,
    fontWeight: FontWeight.w600
);

//Caption
 TextStyle CaptionStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12.sp,
    fontWeight: FontWeight.w400
);
InputDecoration buildInputDecoration(String label, String suffix) {
 return InputDecoration(
  labelText: label,
  suffixText: suffix,
  labelStyle: OverlineStyle,
  suffixStyle: OverlineStyle,
  enabledBorder: OutlineInputBorder(
   borderRadius: BorderRadius.circular(12),
   borderSide: const BorderSide(color: AppColors.primarySolid60,width: 1),
  ),
  focusedBorder: OutlineInputBorder(
   borderRadius: BorderRadius.circular(12),
   borderSide: const BorderSide(color: AppColors.primarySolid90, width: 2),
  ),
  filled: true,
  fillColor: AppColors.primarySolid10,
 );
}
