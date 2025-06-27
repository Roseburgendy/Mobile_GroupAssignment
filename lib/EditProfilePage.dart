import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:assignment1/src/widgets/box_button.dart';
import 'package:assignment1/box_ui.dart';
import 'package:assignment1/src/shared/app_effects.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:assignment1/database/db_helper_healthdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget
{
    final String name;
    final String bio;
    final String currentWeight;
    final String targetWeight;
    //int? userId;
    final String? avatar;


    EditProfilePage({
      super.key,
      required this.name,
      required this.bio,
      required this.currentWeight,
      required this.targetWeight,
      this.avatar,

    });


    @override
    _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>
{
    bool showPassword = false;

    late TextEditingController _nameController;
    late TextEditingController _bioController;
    late TextEditingController _currentWeightController;
    late TextEditingController _targetWeightController;

    final ImagePicker _picker = ImagePicker();
    XFile? _imageFile;
    //int? userId;

    @override
    void initState() 
    {
        super.initState();
       // _loadUserId();

        _nameController = TextEditingController(text: widget.name);
        _bioController = TextEditingController(text: widget.bio);
        _currentWeightController = TextEditingController(text: widget.currentWeight);
        _targetWeightController = TextEditingController(text: widget.targetWeight);

        if (widget.avatar != null && widget.avatar!.isNotEmpty) {
          _imageFile = XFile(widget.avatar!);
        }
    }

   /* void _loadUserId() async {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        userId = prefs.getInt('userId');
      });
    }*/

    void resetToOriginal() 
    {
        _nameController.text = widget.name;
        _bioController.text = widget.bio;
        _targetWeightController.text = widget.targetWeight;
        _currentWeightController.text = widget.currentWeight;

        setState(() => _imageFile = null); // 重置头像
    }

    void saveAndReturn() {
      String currentWeightText = _currentWeightController.text.trim();
      String targetWeightText = _targetWeightController.text.trim();

      // 判断是否输入了体重
      double? current;
      double? goal;


      // 允许保存，即使体重为空
      Navigator.pop(context, {
        'name': _nameController.text,
        'bio': _bioController.text,
        'currentWeight': _currentWeightController.text,
        'targetWeight': _targetWeightController.text,
        'avatar': _imageFile?.path,
      });
    }


    Future<void> pickImage(ImageSource source) async
    {
        final picked = await _picker.pickImage(source: source);
        if (picked != null) 
        {
            setState(() => _imageFile = picked);
            Navigator.pop(context);
        }
    }

    Widget bottomSheet(BuildContext context) 
    {
        return Container(
            padding: EdgeInsets.all(20),
            height: 150,
            child: Column(
                children: [
                    Text(AppLocalizations.of(context)!.chooseProfilePicture, style: Headline4Style),
                    const SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            BoxButton(
                                title: AppLocalizations.of(context)!.camera,
                                icon: Icon(Icons.camera_alt),
                                style: ButtonStyleType.secondary,
                                onTap: () => pickImage(ImageSource.camera)
                            ),
                            BoxButton(
                                title: AppLocalizations.of(context)!.gallery,
                                icon: Icon(Icons.photo_library),
                                style: ButtonStyleType.secondary,
                                onTap: () => pickImage(ImageSource.gallery)
                            )
                        ]
                    )
                ]
            )
        );
    }

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: BoxText.Headline4(AppLocalizations.of(context)!.editProfile),
                centerTitle: true,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios_sharp, color: AppColors.black100),
                    onPressed: () => Navigator.of(context).pop()
                )
            ),
            body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                    children: [
                        Center(
                            child: Stack(
                                children: [
                                    CircleAvatar(
                                        radius: 50,
                                        backgroundImage: _imageFile != null
                                            ? FileImage(File(_imageFile!.path))
                                            : AssetImage('assets/image/profile.png') as ImageProvider
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: InkWell(
                                            onTap: ()
                                            {
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: (_) => bottomSheet(context)
                                                );
                                            },
                                            child: Container(
                                                padding: EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors.secondarySolid60,
                                                    border: Border.all(color: Colors.white, width: 2)
                                                ),
                                                child: Icon(Icons.camera_alt, color: Colors.white, size: 20)
                                            )
                                        )
                                    )
                                ]
                            )
                        ),
                        const SizedBox(height: 35),
                        buildTextField(AppLocalizations.of(context)!.fullName, _nameController, false),
                        buildTextField(AppLocalizations.of(context)!.bio, _bioController, false),
                     // buildTextField(AppLocalizations.of(context)!.currentWeight, _currentWeightController, false),
                    //  buildTextField(AppLocalizations.of(context)!.targetWeight, _targetWeightController, false),

                        const SizedBox(height: 15),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                BoxButton(
                                    style: ButtonStyleType.secondary,
                                    iconRight: true,
                                    icon: Icon(Icons.cancel),
                                    title: AppLocalizations.of(context)!.cancel,
                                    onTap: resetToOriginal
                                ),
                                BoxButton(
                                    style: ButtonStyleType.primary,
                                    iconRight: true,
                                    icon: Icon(Icons.save_alt),
                                    title: AppLocalizations.of(context)!.save,
                                    onTap: saveAndReturn
                                )
                            ]
                        )
                    ]
                )
            )
        );
    }

    Widget buildTextField(String labelText, TextEditingController controller, bool isPasswordTextField) 
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
                child: TextField(
                    controller: controller,
                    obscureText: isPasswordTextField ? showPassword : false,
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        color: AppColors.black100,
                        fontWeight: FontWeight.w600
                    ),
                    decoration: InputDecoration(
                        labelText: labelText,
                        labelStyle: TextStyle(
                            fontSize: 18,
                            fontFamily: "Montserrat",
                            color: AppColors.black60,
                            fontWeight: FontWeight.w500
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: InputBorder.none
                    )
                )
            )
        );
    }
}
