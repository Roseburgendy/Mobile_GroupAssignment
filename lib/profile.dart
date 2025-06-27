import 'dart:io';
import 'dart:async';
import 'package:assignment1/EditProfilePage.dart';
import 'package:assignment1/helpscreen.dart';
import 'package:assignment1/password_settings.dart';

import 'package:assignment1/screens/login.dart';
import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:assignment1/src/widgets/achievement_item.dart';
import 'package:assignment1/src/widgets/setting_item.dart';
import 'package:assignment1/src/widgets/box_button.dart';
import "package:flutter/material.dart";
import 'package:assignment1/box_ui.dart';
import 'package:assignment1/src/shared/app_effects.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'main.dart';
class Profile extends StatefulWidget
{
    const Profile({super.key});

    @override
    State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile>
{

    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    AppLocalizations.of(context)!.myProfile,
                    style: Headline4Style
                ),
                centerTitle: true
            ),
            body: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                children: [
                    Info(),
                    SizedBox(height: 30.h),
                    BoxText.Title(AppLocalizations.of(context)!.yourMedals),
                    SizedBox(height: 10.h),
                    MedalsHorizontalList(),
                    SizedBox(height: 30.h),
                    BoxText.Title(AppLocalizations.of(context)!.settings),
                    SizedBox(height: 10.h),
                    SettingsPage()
                ]
            )

        );
    }
}

class MedalsHorizontalList extends StatefulWidget
{
    const MedalsHorizontalList({super.key});

    @override
    _MedalsHorizontalListState createState() => _MedalsHorizontalListState();
}

class _MedalsHorizontalListState extends State<MedalsHorizontalList>
{
    final PageController _pageController = PageController(viewportFraction: 0.8);
    Timer? _timer;
    int _currentPage = 0;

    @override
    void initState() 
    {
        super.initState();
        _timer = Timer.periodic(Duration(seconds: 3), (_)
            {
                if (_pageController.hasClients) 
                {
                    _currentPage = (_currentPage + 1) % 4;
                    _pageController.animateToPage(
                        _currentPage,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut
                    );
                }
            }
        );
    }

    @override
    void dispose() 
    {
        _timer?.cancel();
        _pageController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) 
    {
        final items = [
            AchievementItem(
                imagePath: 'assets/image/Achievement_Page/Achievement_Animal Lover.png',
                text: AppLocalizations.of(context)!.animalLover,
                description: AppLocalizations.of(context)!.animalLoverDesc
            ),
            AchievementItem(
                imagePath: 'assets/image/Achievement_Page/Achievement_Drinker.png',
                text: AppLocalizations.of(context)!.drinker,
                description: AppLocalizations.of(context)!.drinkerDesc
            ),
            AchievementItem(
                imagePath: 'assets/image/Achievement_Page/Achievement_Energetic.png',
                text: AppLocalizations.of(context)!.energetic,
                description: AppLocalizations.of(context)!.energeticDesc
            ),
            AchievementItem(
                imagePath: 'assets/image/Achievement_Page/Achievement_New Start.png',
                text: AppLocalizations.of(context)!.newStart,
                description: AppLocalizations.of(context)!.newStartDesc
            )
        ];

        return SizedBox(
            height: 200.h,
            child: PageView.builder(
                controller: _pageController,
                itemCount: items.length,
                itemBuilder: (context, index)
                {
                    return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: items[index]
                    );
                }
            )
        );
    }
}

class Info extends StatefulWidget
{
    const Info({super.key});

    @override
    State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info>
{
    String profileName = "MIMI";
    String profileBio = "I love exercise!";
    String currentWeight = "80kg";
    String targetWeight = "50kg";

    final ImagePicker _picker = ImagePicker();
    XFile? _imageFile;

    @override
    Widget build(BuildContext context)
    {
        return Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.black100, width: 2),
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [AppEffectStyles.cardShadowEffect]
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    // 头像
                    Center(child: imageProfile(context)),
                    SizedBox(height: 15.h),

                    // 名字 & Bio
                    BoxText.Headline4(profileName),
                    SizedBox(height: 5.h),
                    BoxText.Subtitle("Bio: $profileBio", color: AppColors.black60),
                    SizedBox(height: 20.h),

                    // 进度条
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            LinearProgressIndicator(
                                value: 0.8,
                                minHeight: 16,
                                backgroundColor: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10.r),
                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondarySolid60)
                            ),
                            SizedBox(height: 8.h),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text('LV 6', style: OverlineStyle),
                                    Text('LV 7', style: OverlineStyle)
                                ]
                            )
                        ]
                    ),

                    SizedBox(height: 25.h),

                    //Text(AppLocalizations.of(context)!.editProfile, style: OverlineStyle),

                    // 编辑按钮
                    BoxButton(
                        title: AppLocalizations.of(context)!.editProfile,
                        icon: Icon(Icons.edit),
                        style: ButtonStyleType.secondary,
                        onTap: () async
                        {
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfilePage(
                                        name: profileName,
                                        bio: profileBio,
                                      avatar: _imageFile?.path,
                                      currentWeight: currentWeight,
                                      targetWeight: targetWeight,
                                    )
                                )
                            );

                            if (result != null && mounted)
                            {
                                setState(()
                                    {
                                        profileName = result['name'] ?? profileName;
                                        profileBio = result['bio'] ?? profileBio;
                                        currentWeight = result['currentWeight'] ?? currentWeight;
                                        targetWeight = result['targetWeight'] ?? targetWeight;

                                        if (result['avatar'] != null) 
                                        {
                                            _imageFile = XFile(result['avatar']);
                                        }
                                    }
                                );
                            }

                        }

                    )
                ]
            )
        );
    }

    void TakePhoto(ImageSource source) async
    {
        final pickedFile = await _picker.pickImage(source: source);
        if (pickedFile != null)
        {
            setState(()
                {
                    _imageFile = pickedFile;
                    print("image selected.");
                }
            );
            //Navigator.pop(); // 选完自动关闭 bottom sheet
        }
    }

    Widget bottomSheet()
    {
        return Container(
            height: 130.w,
            margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20
            ),
            child: Column(children: <Widget>[
                    BoxText.Title(AppLocalizations.of(context)!.chooseProfilePicture),
                    SizedBox(height: 40),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            BoxButton(
                                icon: Icon(Icons.camera_alt),
                                style: ButtonStyleType.secondary,
                                title: AppLocalizations.of(context)!.camera,
                                onTap: ()
                                {
                                    TakePhoto(ImageSource.camera);
                                }
                            ),
                            SizedBox(width: 20),
                            BoxButton(
                                icon: Icon(Icons.photo_library),
                                style: ButtonStyleType.secondary,
                                title: 	AppLocalizations.of(context)!.gallery,
                                onTap: ()
                                {
                                    TakePhoto(ImageSource.gallery);
                                }
                            )
                        ]
                    )
                ]
            )

        );
    }

    Widget imageProfile(BuildContext context)
    {
        return Stack(
            children: <Widget>[
                Container(
                    width: 120.w,
                    height: 120.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle
                    ),
                    padding: EdgeInsets.all(4), // 边框宽度
                    child: CircleAvatar(
                        radius: 76.0,
                        backgroundImage: _imageFile != null
                            ? FileImage(File(_imageFile!.path))
                            : AssetImage('assets/image/profile.png') as ImageProvider
                    )
                ),

            ]
        );
    }

}

class MedalsPage extends StatelessWidget
{
    @override
    Widget build(BuildContext context)
    {
        return SingleChildScrollView(
            padding: EdgeInsets.all(20.w),
            child: Wrap(
                spacing: 20.w,
                runSpacing: 10.h,
                children: const[
                    AchievementItem(
                        imagePath: 'assets/image/Achievement_Page/Achievement_Animal Lover.png',
                        text: 'Animal Lover',
                        description: 'Own 5 pets in your pet house.'
                    ),
                    AchievementItem(
                        imagePath: 'assets/image/Achievement_Page/Achievement_Drinker.png',
                        text: 'Drinker',
                        description: 'Be an active drinker(drink 1000ml water) for 7 day streak'
                    ),
                    AchievementItem(
                        imagePath: 'assets/image/Achievement_Page/Achievement_Energetic.png',
                        text: 'Energetic',
                        description: 'Workout more than 30 minutes a day for 7 day streak'
                    ),
                    AchievementItem(
                        imagePath: 'assets/image/Achievement_Page/Achievement_New Start.png',
                        text: 'New Start',
                        description: '"This is the begining!"'
                    )
                ]
            )
        );
    }
}
class LanguageBottomSheet extends StatelessWidget
{
    @override
    Widget build(BuildContext context) 
    {
        Locale current = Localizations.localeOf(context);

        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Container(
                constraints: BoxConstraints(maxWidth: 500.w),
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))
                ),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch, // 让按钮宽度撑满
                    children: [
                        Center(
                            child: Text(
                                AppLocalizations.of(context)!.languageSettings,
                                style: Headline4Style
                            )
                        ),
                        SizedBox(height: 20.h),
                        BoxButton(
                            title: "English",
                            style: ButtonStyleType.secondary,
                            onTap: ()
                            {
                                MyApp.setLocale(context, Locale('en'));
                                Navigator.pop(context);
                            }
                        ),
                        SizedBox(height: 10.h),
                        BoxButton(
                            title: "简体中文",
                            style: ButtonStyleType.secondary,
                            onTap: ()
                            {
                                MyApp.setLocale(context, Locale('zh'));
                                Navigator.pop(context);
                            }
                        )
                    ]
                )
            )
        );
    }
}

class SettingsPage extends StatelessWidget
{
    @override
    Widget build(BuildContext context)
    {
        return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                    SettingsItem(
                        itemIcon: Icon(Icons.password_sharp),
                        text: AppLocalizations.of(context)!.changePassword,
                        bgColor: AppColors.secondarySolid50,
                        textColor: AppColors.black100,
                        onTap: ()
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ResetPasswordPage())
                          );
                        }
                    ),

                    SizedBox(height: 20.h),
                  /*
                    SettingsItem(
                        itemIcon: Icon(Icons.notifications),
                        text: AppLocalizations.of(context)!.notification,
                        bgColor: AppColors.secondarySolid50,
                        textColor: AppColors.black100
                    ),
                    SizedBox(height: 20.h),

                   */
                    SettingsItem(
                        itemIcon: Icon(Icons.language),
                        text: AppLocalizations.of(context)!.languageSettings,
                        bgColor: AppColors.secondarySolid50,
                        textColor: AppColors.black100,
                        onTap: ()
                        {
                            showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                                ),
                                builder: (context) => LanguageBottomSheet()
                            );
                        }

                    ),
                    SizedBox(height: 20.h),
                    SettingsItem(
                        itemIcon: Icon(Icons.help),
                        text: AppLocalizations.of(context)!.helpSupport,
                        bgColor: AppColors.secondarySolid50,
                        textColor: AppColors.black100,
                        onTap: ()
                        {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HelpSupportScreen())
                            );
                        }
                    ),
                    SizedBox(height: 20.h),
                    SettingsItem(
                        itemIcon: Icon(Icons.logout),
                        text: AppLocalizations.of(context)!.logout,
                        bgColor: AppColors.communicationSolidError,
                        textColor: AppColors.white100,
                        onTap: ()
                        {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen())
                            );
                        }
                    )
                ]
            )
        );
    }
}

