import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final String text;
  final bool isNextButton;
  final VoidCallback? onPressed;
  
  const NavigationButton({
    super.key,
    required this.text,
    this.isNextButton = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: isNextButton
            ? const EdgeInsets.only(top: 12, left: 16, right: 12, bottom: 12)
            : const EdgeInsets.only(top: 12, left: 12, right: 16, bottom: 12),
        decoration: ShapeDecoration(
          color: const Color(0xFF009D0A),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 2,
              color: Color(0xFF001428),
            ),
            borderRadius: BorderRadius.circular(9999),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0xFF001428),
              blurRadius: 0,
              offset: Offset(1, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!isNextButton) ...[
              const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              text.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            if (isNextButton) ...[
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 24,
              ),
            ],
          ],
        ),
      ),
    );
  }
}