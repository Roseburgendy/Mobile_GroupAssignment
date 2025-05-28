import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final double width;
  final bool isPassword;
  final TextEditingController? controller;

  const InputField({
    Key? key,
    required this.hintText,
    this.width = 250,
    this.isPassword = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 2,
            color: Color(0x99001428),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0x99001428),
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none, 
        ),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
