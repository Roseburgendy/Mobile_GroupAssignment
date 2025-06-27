import 'package:flutter/material.dart';
import '../../src/widgets/input_field.dart';
import '../../src/widgets/login_button.dart';
import '../../src/widgets/text_link_button.dart';
import '../../src/widgets/login_image.dart';
import '../src/shared/styles.dart';
import '../src/widgets/box_button.dart';
import '../../src/widgets/back_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _handleSignUp(BuildContext context) {
  final email = emailController.text.trim();
  final password = passwordController.text.trim();

  if (email.isNotEmpty && password.isNotEmpty) {
    Navigator.pop(context); 
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.commonMissingFieldsAlert),
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
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signUpTitle, style: Headline4Style),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 150),

              // Email 输入框
              InputField(
                hintText: AppLocalizations.of(context)!.loginEmailHint,
                width: double.infinity,
                controller: emailController,
              ),

              const SizedBox(height: 30),

              // 密码输入框
              InputField(
                hintText: AppLocalizations.of(context)!.loginPassword,
                isPassword: true,
                width: double.infinity,
                controller: passwordController,
              ),

              const SizedBox(height: 60),

              BoxButton(
                title: AppLocalizations.of(context)!.signUpButton,
                style: ButtonStyleType.primary,
                iconRight: true,
                onTap: () => _handleSignUp(context),
                  icon: Icon(Icons.arrow_forward, size: 20, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
