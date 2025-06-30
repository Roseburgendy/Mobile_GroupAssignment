import 'package:flutter/material.dart';
import 'package:assignment1/services/database_service.dart';
import 'package:assignment1/main.dart';
import '../../src/widgets/input_field.dart';
import '../../src/widgets/box_button.dart';
import '../../src/widgets/login_button.dart';
import '../../src/widgets/text_link_button.dart';
import '../../src/widgets/login_image.dart';
import '../src/shared/styles.dart';
import '../src/widgets/box_button.dart';
import '../../src/widgets/back_button.dart';
import 'package:assignment1/l10n/app_localizations.dart';

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
      final passwordHash = password; // 如需加密可替换此处

      final userId = await dbService.registerUser(
        email: email,
        passwordHash: passwordHash,
      );

      if (userId != null) {
        debugPrint('注册成功，ID: $userId, 用户名: $email');

        // 注册成功后返回登录页
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email 已被注册或注册失败'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('请输入邮箱和密码'),
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
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signUpTitle, style: Headline4Style),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 150),
              InputField(
                hintText: AppLocalizations.of(context)!.loginEmailHint,
                width: double.infinity,
                controller: emailController,
              ),
              const SizedBox(height: 30),
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
                icon: const Icon(Icons.arrow_forward, size: 20, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
