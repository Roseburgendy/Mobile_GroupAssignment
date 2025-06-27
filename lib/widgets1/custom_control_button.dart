import 'package:flutter/material.dart';

import '../core1/app_export.dart';
import './custom_image_view.dart';

/// A customizable control button widget that displays an image centered within a container.
/// This widget is commonly used for media controls, action buttons, and other interactive elements.
class CustomControlButton extends StatelessWidget {
  const CustomControlButton({
    Key? key,
    this.onTap,
    this.height,
    this.width,
    this.imagePath,
    this.imageHeight,
    this.imageWidth,
    this.decoration,
    this.margin,
    this.padding,
    this.alignment,
  }) : super(key: key);

  /// Called when the button is tapped.
  final VoidCallback? onTap;

  /// Height of the button container.
  final double? height;

  /// Width of the button container.
  final double? width;

  /// Path to the image asset displayed in the button.
  final String? imagePath;

  /// Height of the image.
  final double? imageHeight;

  /// Width of the image.
  final double? imageWidth;

  /// Decoration of the button container.
  final BoxDecoration? decoration;

  /// Margin around the button.
  final EdgeInsetsGeometry? margin;

  /// Padding inside the button.
  final EdgeInsetsGeometry? padding;

  /// Alignment of the button's content.
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? 60.h;
    final buttonWidth = width ?? 60.h;
    final imgHeight = imageHeight ?? 44.h;
    final imgWidth = imageWidth ?? 44.h;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        margin: margin,
        padding: padding,
        alignment: alignment ?? Alignment.center,
        decoration:
            decoration ??
            BoxDecoration(
              color: appTheme.transparentCustom,
              borderRadius: BorderRadius.circular(8.h),
            ),
        child:
            imagePath != null
                ? CustomImageView(
                  imagePath: imagePath,
                  height: imgHeight,
                  width: imgWidth,
                )
                : null,
      ),
    );
  }
}