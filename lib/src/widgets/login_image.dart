import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  final double width;
  final double height;
  final String? imagePath;
  final BoxFit fit;
  final double borderRadius;

  const LoginImage({
    Key? key,
    required this.width,
    required this.height,
    this.imagePath,
    this.fit = BoxFit.cover,
    this.borderRadius = 0,
  }) : assert(imagePath != null, 'none'),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: _getDecorationImage(),
      ),
    );
  }

  DecorationImage? _getDecorationImage() {
    if (imagePath != null) {
      return DecorationImage(
        image: AssetImage(imagePath!), 
        fit: fit,
      );
    } 
    return null;
  }
}