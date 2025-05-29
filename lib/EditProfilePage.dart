import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:assignment1/src/widgets/box_button.dart';
import "package:flutter/material.dart";
import 'package:assignment1/box_ui.dart';
import 'package:assignment1/src/shared/app_effects.dart';


class EditProfilePage extends StatefulWidget
{
  final String name;
  final String bio;
  const EditProfilePage({super.key, required this.name, required this.bio});
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>
{
  bool showPassword = false;

  late TextEditingController _nameController;
  late TextEditingController _bioController;

  @override
  void initState()
  {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _bioController = TextEditingController(text: widget.bio);
  }

  void resetToOriginal()
  {
    _nameController.text = widget.name;
    _bioController.text = widget.bio;
  }

  void saveAndReturn()
  {
    Navigator.pop(context,
        {
          'name': _nameController.text,
          'bio': _bioController.text
        }
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            //elevation: 1,
            title: BoxText.Headline4("Edit Profile"),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: AppColors.black100
                ),
                onPressed: ()
                {
                  Navigator.of(context).pop();
                }
            )
        ),
        body: Container(
            padding: EdgeInsets.only(left: 16, top: 25, right: 16),
            child: GestureDetector(
                onTap: ()
                {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                    children: [
                      SizedBox(
                          height: 15
                      ),
                      /// PROFILE
                      Center(
                          child: Stack(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(10),
                                    child: Image.asset('assets/image/profile.png',
                                        width: 100,
                                        fit: BoxFit.fitWidth
                                    ),
                                    decoration: ShapeDecoration(
                                        color: AppColors.primarySolid60,
                                        shape: OvalBorder(
                                            side: BorderSide(
                                                width: 1,
                                                color: AppColors.black100
                                            )
                                        ),
                                        shadows: [AppEffectStyles.itemShadowEffect]
                                    )
                                ),

                              ]
                          )
                      ),
                      SizedBox(
                          height: 35
                      ),
                      /// INPUT BOXES
                      buildTextField("Full Name", _nameController, false),
                      buildTextField("Bios", _bioController, false),
                      // buildTextField("Date of Birth", "2008-5-23", false),
                      // buildTextField("Current Height", "180 cm", false),
                      // buildTextField("Current Weight", "70 kg", false),
                      //
                      // buildTextField("E-mail", "alexd@gmail.com", false),
                      // buildTextField("Password", "*****", true),
                      // buildTextField("Location", "Kuala Lumpur, Malaysia", false),
                      SizedBox(
                          height: 15
                      ),
                      /// BUTTON ACTIONS
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BoxButton(
                                style: ButtonStyleType.secondary,
                                iconRight: true,
                                icon: Icon(Icons.cancel),
                                title: "Cancel",
                                onTap: ()
                                {
                                  resetToOriginal();
                                }
                            ),
                            BoxButton(
                                style: ButtonStyleType.primary,
                                iconRight: true,
                                icon: Icon(Icons.save_alt),
                                title: "Save",
                                onTap: ()
                                {
                                  saveAndReturn();
                                }
                            )
                          ]
                      )

                    ]
                )
            )
        )
    );
  }

  Widget buildTextField(
      String labelText, TextEditingController controller, bool isPasswordTextField)
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
            child:
            TextField(
              controller: controller,
              obscureText: isPasswordTextField ? showPassword : false,
              style: const TextStyle(  // 这里是控制输入文字的大小
                  fontSize: 20,
                  fontFamily: "Montserrat",
                  color: AppColors.black100,
                  fontWeight: FontWeight.w600
              ),
              decoration: InputDecoration(
                labelText: labelText, // 使用 labelText 而非 label（Widget）
                labelStyle: TextStyle( // 控制 label 的样式
                  fontSize: 18,
                  fontFamily: "Montserrat",
                  color: AppColors.black60,
                  fontWeight: FontWeight.w500
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: '',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
            )

        )
    );
  }
}
