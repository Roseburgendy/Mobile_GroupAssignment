import 'package:flutter/material.dart';
import 'package:assignment1/services/database_service.dart';
import 'package:assignment1/main.dart'; 
import '../../src/widgets/input_field.dart';
import '../src/widgets/box_button.dart';
import '../../src/widgets/back_button.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _handleSignUp(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    print('尝试注册: $email');

    if (email.isNotEmpty && password.isNotEmpty) {
      final dbService = DatabaseService(db);
      final passwordHash = password; 

      final userId = await dbService.registerUser(
        email: email,
        passwordHash: passwordHash,
      );

      if (userId != null) {
        debugPrint('signed up');
        debugPrint('ID: $userId');
        debugPrint('Email: $email');

        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email already registered or registration failed'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
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
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 150),
              InputField(
                hintText: 'Email',
                width: double.infinity,
                controller: emailController,
              ),
              const SizedBox(height: 30),
              InputField(
                hintText: 'Password',
                isPassword: true,
                width: double.infinity,
                controller: passwordController,
              ),
              const SizedBox(height: 60),
              BoxButton(
                title: 'Sign Up',
                style: ButtonStyleType.primary,
                iconRight: true,
                onTap: () => _handleSignUp(context),
                icon: const Icon(Icons.arrow_forward, size: 20, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
