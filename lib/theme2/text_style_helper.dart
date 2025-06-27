import 'package:flutter/material.dart';
import '../core2/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Display Styles
  // Large text styles typically used for headers and hero elements

  TextStyle get display38SemiBoldMontserrat => TextStyle(
    fontSize: 38.fSize,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    color: appTheme.colorFF003D,
  );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
  );

  TextStyle get title20BoldMontserrat => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    color: appTheme.colorFF0014,
  );

  TextStyle get title16SemiBoldMontserrat => TextStyle(
    fontSize: 16.fSize,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    color: appTheme.colorFF0014,
  );
}
