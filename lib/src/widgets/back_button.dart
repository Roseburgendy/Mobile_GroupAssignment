import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnalysisIconButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onPressed;

  const AnalysisIconButton({
    super.key,
    required this.imagePath,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => Navigator.pop(context), 
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: SvgPicture.asset(
            imagePath,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
