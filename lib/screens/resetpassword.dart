import 'package:flutter/material.dart';
import '../../src/widgets/input_field.dart';
import '../src/shared/styles.dart';
import '../src/widgets/box_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:assignment1/screens/login.dart';
import 'package:assignment1/main.dart'; // 全局 db
import 'package:assignment1/services/database_service.dart';
import 'package:sqflite/sqflite.dart';


class ResetScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _handleReset(BuildContext context) async {
    final email = emailController.text.trim();
    final newPassword = passwordController.text.trim();

    if (email.isEmpty || newPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both email and new password'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final dbService = DatabaseService(db);
    final user = await dbService.getUserByUsername(email);

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No user found with this email.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final success = await dbService.updatePassword(email, newPassword);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset successful.'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to reset password.'),
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
        title: Text(AppLocalizations.of(context)!.resetPassword, style: Headline4Style),
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
                title: AppLocalizations.of(context)!.resetButton,
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
