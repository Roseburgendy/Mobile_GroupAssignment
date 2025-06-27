import 'package:flutter/material.dart';
import '../core3/app_export.dart';

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

  TextStyle get display36Bold => TextStyle(
    fontSize: 36.fSize,
    fontWeight: FontWeight.bold,
    color: appTheme.whiteCustom,
  );

  // Headline Styles
  // Medium-large text styles for section headers

  TextStyle get headline32Bold => TextStyle(
    fontSize: 32.fSize,
    fontWeight: FontWeight.bold,
    color: appTheme.colorFF003D,
  );

  TextStyle get headline24Bold => TextStyle(
    fontSize: 24.fSize,
    fontWeight: FontWeight.bold,
    color: appTheme.colorFF0014,
  );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
  );

  TextStyle get title16 =>
      TextStyle(fontSize: 16.fSize, color: appTheme.colorFF0014);
}
