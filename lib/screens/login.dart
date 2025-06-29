import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assignment1/services/database_service.dart';
import 'package:assignment1/main.dart';
import '../../src/widgets/input_field.dart';
import '../../src/widgets/text_link_button.dart';
import '../../src/widgets/login_image.dart';
import '../MainNavigation.dart';
import '../src/widgets/box_button.dart';
import '../screens/signup.dart';
import '../screens/resetpassword.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});
  int userId = 5;


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
              const SizedBox(height: 40),

              // 顶部图片
              Center(
                child: LoginImage(
                  width: size.width * 0.8,
                  height: 187,
                  imagePath: "assets/image/login_banner.png",
                ),
              ),

              const SizedBox(height: 40),

              // Email 输入框
              InputField(
                hintText: AppLocalizations.of(context)!.loginEmailHint,
                width: double.infinity,
                controller: emailController,
              ),

              const SizedBox(height: 20),

              // 密码输入框
              InputField(
                hintText: AppLocalizations.of(context)!.loginPassword,
                isPassword: true,
                width: double.infinity,
                controller: passwordController,
              ),

              const SizedBox(height: 15),

              // 忘记密码
              Align(
                alignment: Alignment.centerRight,
                child: TextLinkButton(
                    text: AppLocalizations.of(context)!.loginForgotPassword,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResetScreen()),
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),

              BoxButton(
                title: AppLocalizations.of(context)!.loginButton,
                style: ButtonStyleType.primary,
                iconRight: true,
                onTap: () => _handleLogin(context),
                icon: const Icon(Icons.arrow_forward, size: 20, color: Colors.black),
              ),

              const SizedBox(height: 40),

              // 注册链接
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.loginNoAccountText),
                  TextLinkButton(
                    text: AppLocalizations.of(context)!.loginSignUp,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    decoration: TextDecoration.underline,
                  )
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) async {
    final username = emailController.text.trim();
    final password = passwordController.text.trim();

    if (username.isNotEmpty && password.isNotEmpty) {
      final dbService = DatabaseService(db);
      final success = await dbService.validateLogin(username, password);

      if (success) {
        debugPrint('登录成功: $username');

        await dbService.insertDefaultHealthDataIfNeeded(username);

        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('username', username);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainNavigationBar()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wrong user name or password'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text(AppLocalizations.of(context)!.loginMissingFieldsMessage),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}
