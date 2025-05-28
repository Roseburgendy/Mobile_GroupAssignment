import 'package:flutter/material.dart';
import '../../src/widgets/input_field.dart';
import '../../src/widgets/login_button.dart';
import '../../src/widgets/text_link_button.dart';
import '../../src/widgets/login_image.dart';
import '../homepage.dart';

class LoginScreen extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 375,
        height: 812,
        clipBehavior: Clip.antiAlias,
        decoration: const ShapeDecoration(
          color: Color(0xFFFEFDFA),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 3),
          ),
        ),
        child: Stack(
          children: [
            // 顶部图片
            Positioned(
              left: 1,
              top: 125,
              child: LoginImage(
                width: 374,
                height: 187,
                imagePath: "assets/images/login_banner.png",
              ),
            ),

            // 登录表单区域
            Positioned(
              left: 0,
              top: 320,
              child: SizedBox(
                width: 375,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InputField(
                      hintText: 'Email/ID',
                      width: 250,
                      controller: emailController,
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      hintText: 'Password',
                      width: 250,
                      isPassword: true,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 15),
                    TextLinkButton(
                      text: 'FORGOT PASSWORD?',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 25),
                    loginButton(
                      text: 'LOG IN',
                      onPressed: () => _handleLogin(context),
                      trailingIcon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('No Account ? '),
                        TextLinkButton(
                          text: 'SIGN UP',
                          onPressed: () {},
                          decoration: TextDecoration.underline,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
