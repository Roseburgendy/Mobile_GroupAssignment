import 'package:flutter/material.dart';
import '../../src/widgets/input_field.dart';
import '../../src/widgets/login_button.dart';
import '../../src/widgets/text_link_button.dart';
import '../../src/widgets/login_image.dart';
import '../src/widgets/box_button.dart';
import '../../src/widgets/back_button.dart';

class ResetScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _handleReset(BuildContext context) {
  final email = emailController.text.trim();
  final password = passwordController.text.trim();

  if (email.isNotEmpty && password.isNotEmpty) {
    Navigator.pop(context); 
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter both email and password'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              Row(
              children: [
              AnalysisIconButton(
              imagePath: 'assets/icon/arrow-left.svg',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

                const SizedBox(width: 20),

                Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

              ]
              ),

              const SizedBox(height: 150),

              // Email 输入框
              InputField(
                hintText: 'Email/ID',
                width: double.infinity,
                controller: emailController,
              ),

              const SizedBox(height: 30),

              // 密码输入框
              InputField(
                hintText: 'Password',
                isPassword: true,
                width: double.infinity,
                controller: passwordController,
              ),

              const SizedBox(height: 60),

              BoxButton(
                title: 'Reset',
                style: ButtonStyleType.primary,
                iconRight: true,
                onTap: () => _handleReset(context),
                  icon: Icon(Icons.arrow_forward, size: 20, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
