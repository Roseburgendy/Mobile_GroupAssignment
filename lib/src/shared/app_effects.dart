import 'package:assignment1/src/shared/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppEffectStyles {
  static const BoxShadow itemShadowEffect = BoxShadow(
    color: AppColors.black100,
    offset: Offset(2, 4),
    blurRadius: 0,
    spreadRadius: 0,
  );

  static const BoxShadow buttonShadowEffect = BoxShadow(
    color:  AppColors.black100,
    offset: Offset(1, 2),
    blurRadius: 0,
    spreadRadius: 0,
  );

  static const BoxShadow cardShadowEffect = BoxShadow(
    color: Color(0xffa2d2ff),
    offset: Offset(2, 4),
    blurRadius: 0,
    spreadRadius: 0,
  );

  static const BoxShadow naviItemShadowEffect = BoxShadow(
    color:  AppColors.black100,
    offset: Offset(0, 3),
    blurRadius: 0,
    spreadRadius: 0,
  );

  static const BoxShadow accentshadowEffect = BoxShadow(
    color: Color(0xffa2d2ff),
    offset: Offset(3, 8),
    blurRadius: 0,
    spreadRadius: 0,
  );

}