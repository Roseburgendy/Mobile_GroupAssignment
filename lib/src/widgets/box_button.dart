import 'package:assignment1/src/shared/app_effects.dart';
import 'package:flutter/material.dart';
import '../../box_ui.dart';
import '../shared/app_colors.dart';
//import '../shared/styles.dart';

enum ButtonStyleType { primary, secondary }

class BoxButton extends StatefulWidget {
  ///SETTINGS
  final bool disabled; // Disabled?
  final VoidCallback? onTap; // 回调
  final double height; //Fixed Height(can customize)
  final String? title; // Text
  final Widget? icon; //Icon
  final bool iconRight; // Icon position
  final ButtonStyleType style; // Color style

  const BoxButton({
    Key? key,
    this.title,
    this.disabled = false,
    this.onTap,
    this.height = 48,
    this.icon,
    this.iconRight = false, // Icon position
    this.style = ButtonStyleType.primary,
  }) : super(key: key);

  @override
  State<BoxButton> createState() => _BoxButtonState();
}

///ACTIONS
class _BoxButtonState extends State<BoxButton> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    if (!widget.disabled) setState(() => _isPressed = true);
  }

  void _handleTapUp(TapUpDetails details) {
    if (!widget.disabled) setState(() => _isPressed = false);
  }

  void _handleTapCancel() {
    if (!widget.disabled) setState(() => _isPressed = false);
  }

  // Change button color style
  Color _getBaseColor(bool pressed) {
    if (widget.style == ButtonStyleType.primary) {
      return widget.disabled
          ? AppColors.primaryOpacity40
          : pressed
          ? AppColors.primarySolid60
          : AppColors.primarySolid50;
    } else {
      return widget.disabled
          ? AppColors.secondaryOpacity40
          : pressed
          ? AppColors.secondarySolid60
          : AppColors.secondarySolid50;
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _getBaseColor(_isPressed);
    final hasText = widget.title?.isNotEmpty ?? false;
    final hasIcon = widget.icon != null;

    return IntrinsicWidth(
      child: GestureDetector(
        onTap: widget.disabled ? null : widget.onTap,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,

        child: AnimatedContainer(
          // Animation duration
          duration: const Duration(milliseconds: 120),
          // Transform animation when pressed
          transform:
              _isPressed
                  ? Matrix4.translationValues(0, 2, 0)
                  : Matrix4.identity(),
          height: widget.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          //Outline
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(9999),
            border: Border.all(color: AppColors.black100, width: 2),
            boxShadow: _isPressed ? [] : [AppEffectStyles.buttonShadowEffect],
          ),
          // Content
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (hasIcon && !widget.iconRight) ...[
                widget.icon!,
                if (hasText) const SizedBox(width: 8),
              ],
              if (hasText)
                BoxText.Button(widget.title!, color: AppColors.black100),
              if (hasIcon && widget.iconRight) ...[
                if (hasText) const SizedBox(width: 8),
                widget.icon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
