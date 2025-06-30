import 'package:assignment1/screens/resetpassword.dart';
import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/shared/app_effects.dart';
import 'package:flutter/material.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:assignment1/src/widgets/box_button.dart';
import 'package:assignment1/l10n/app_localizations.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final oldPwdController = TextEditingController();
  final newPwdController = TextEditingController();
  final confirmPwdController = TextEditingController();

  bool isLoading = false;

  bool showPassword = false;

  void resetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    // 模拟连接数据库验证旧密码和更新密码
    await Future.delayed(Duration(seconds: 2));
    bool success = true; // 实际应该调用你的后端 API

    setState(() => isLoading = false);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.passwordResetSuccess)),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.passwordResetFail)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.changePassword, style: Headline4Style),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 80,horizontal: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(AppLocalizations.of(context)!.oldPassword, oldPwdController, true),
              _buildTextField(AppLocalizations.of(context)!.newPassword, newPwdController, true),
              _buildTextField(AppLocalizations.of(context)!.confirmPassword, confirmPwdController, true),
              SizedBox(height: 20),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : BoxButton(
                title: AppLocalizations.of(context)!.confirmed,
                style: ButtonStyleType.primary,
                onTap: resetPassword,
              ),
              SizedBox(height: 10),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primarySolid90,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResetScreen()),
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.forgotPassword,style: OverlineStyle,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, bool isPasswordTextField)
  {
    return Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            decoration: BoxDecoration(
                color: AppColors.secondarySolid20,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.black, width: 1.5),
                boxShadow: [AppEffectStyles.buttonShadowEffect]
            ),
            child: TextFormField(
                controller: controller,
                obscureText: isPasswordTextField ? showPassword : false,
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "Montserrat",
                    color: AppColors.black100,
                    fontWeight: FontWeight.w600
                ),
                decoration: InputDecoration(
                    labelText: label,
                    labelStyle: TextStyle(
                        fontSize: 18,
                        fontFamily: "Montserrat",
                        color: AppColors.black60,
                        fontWeight: FontWeight.w500
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none
                ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.fieldRequired;
                }
                if (label == AppLocalizations.of(context)!.confirmPassword &&
                    value != newPwdController.text) {
                  return AppLocalizations.of(context)!.passwordMismatch;
                }
                return null;
              },
            )
        )
    );
  }
}
