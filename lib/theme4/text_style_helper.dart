import 'package:flutter/material.dart';
import '../core4/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Headline Styles
  // Medium-large text styles for section headers

  TextStyle get headline32Bold => TextStyle(
    fontSize: 32.fSize,
    fontWeight: FontWeight.bold,
    color: appTheme.colorFFFFAA,
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
