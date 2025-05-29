import 'package:assignment1/EditProfilePage.dart';
import 'package:assignment1/screens/login.dart';
import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:assignment1/src/widgets/achievement_item.dart';
import 'package:assignment1/src/widgets/setting_item.dart';
import 'package:assignment1/src/widgets/box_button.dart';
import "package:flutter/material.dart";
import 'package:assignment1/box_ui.dart';
import 'package:assignment1/src/shared/app_effects.dart';

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
                title: const Text(
                    "My Profile",
                    style: Headline4Style
                ),
                centerTitle: true
            ),
            body: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                children: [
                    Info(),
                    TabMenu()
                ]
            )
        );
        // TODO: implement build
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

    @override
    Widget build(BuildContext context)
    {
        double width = MediaQuery.of(context).size.width;

        return Column(

            children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                        SizedBox(width: 80),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.all(10),
                            decoration: ShapeDecoration(
                                color: AppColors.primarySolid60,
                                shape: OvalBorder(
                                    side: BorderSide(width: 1, color: AppColors.black100)
                                ),
                                shadows: [AppEffectStyles.itemShadowEffect]
                            ),
                            child: Image.asset(
                                'assets/image/profile.png',
                                width: width * 0.4,
                                fit: BoxFit.fitWidth
                            )
                        ),
                        SizedBox(width: 10),

                        Container(
                            child: BoxButton(
                                icon: Icon(Icons.edit_rounded, size: 20, color: AppColors.black100),
                                iconRight: true,
                                style: ButtonStyleType.secondary,
                                onTap: () async {
                                  final result = await Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) =>
                                          EditProfilePage(name: profileName, bio: profileBio),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        const begin = Offset(1.0, 0.0);
                                        const end = Offset.zero;
                                        const curve = Curves.ease;

                                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                        return SlideTransition(position: animation.drive(tween), child: child);
                                      },
                                      transitionDuration: Duration(milliseconds: 300),
                                    ),
                                  );

                                  if (result != null && result is Map<String, String>) {
                                    setState(() {
                                      profileName = result['name']!;
                                      profileBio = result['bio']!;
                                    });
                                  }
                                }

                            )
                        )

                    ]
                // Edit Button
                ),

                SizedBox(height: 20),

                // Profile Card
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.black100, width: 2),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [AppEffectStyles.cardShadowEffect]
                    ),
                    child: Column(
                        children: [
                            Column(
                                children: [
                                    // Name
                                    BoxText.Headline4(profileName),
                                    SizedBox(height: 5),
                                    // Bio
                                    BoxText.Subtitle("Bio: $profileBio", color: AppColors.black60),
                                    SizedBox(height: 20)
                                ]
                            ),

                            SizedBox(height: 5),
                            // Progress Bar
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                    LinearProgressIndicator(
                                        value: 0.8,
                                        minHeight: 16,
                                        backgroundColor: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(10),
                                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondarySolid60)
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                            Text('LV 6', style: OverlineStyle),
                                            Text('LV 7', style: OverlineStyle)
                                        ]
                                    )
                                ]
                            )
                        ]
                    )

                )

            ]
        );
    }
}

class TabMenu extends StatefulWidget
{
    @override
    _TabMenuState createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> with SingleTickerProviderStateMixin
{
    late TabController _tabController;

    @override
    void initState()
    {
        super.initState();
        _tabController = TabController(length: 2, vsync: this);
        _tabController.addListener(()
            {
                setState(()
                    {
                    }
                ); // 切换 tab 时重建界面
            }
        );
    }

    @override
    void dispose()
    {
        _tabController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context)
    {
        /// Change color of tab & bg
        Color backgroundColor =
            _tabController.index == 1 ? AppColors.secondarySolid10 : AppColors.primarySolid10;

        Color indicatorColor =
            _tabController.index == 1 ? AppColors.secondarySolid10 : AppColors.primarySolid10;

        return Column(
            children: [
                Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    ///TAB BAR
                    child: TabBar(
                        controller: _tabController,
                        /// INDICATOR STYLING
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)
                            ),
                            color: indicatorColor,
                            boxShadow: [AppEffectStyles.cardShadowEffect],
                            border: Border(
                                top: BorderSide(width: 2, color: AppColors.black100),
                                left: BorderSide(width: 2, color: AppColors.black100),
                                right: BorderSide(width: 2, color: AppColors.black100),
                                bottom: BorderSide.none
                            )
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding: EdgeInsets.only(top: -8),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        /// TABS
                        tabs: [
                            Tab(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Icon(Icons.emoji_events_outlined),
                                        SizedBox(width: 5),
                                        Text(
                                            "Medals",
                                            style: TitleStyle
                                        )
                                    ]
                                )
                            ),
                            Tab(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Icon(Icons.settings_outlined),
                                      SizedBox(width: 5),
                                      Text(
                                          "Settings",
                                          style: TitleStyle
                                      )
                                    ]
                                )
                            )
                        ]
                    )
                ),
                // CONTAINER PANEL
                AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 400,
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        border: Border.all(color: AppColors.black100, width: 2),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [AppEffectStyles.cardShadowEffect]
                    ),
                    child: TabBarView(
                        controller: _tabController,
                        children: [
                            MedalsPage(),
                            SettingsPage()
                        ]
                    )
                )
            ]
        );
    }
}

class MedalsPage extends StatelessWidget
{
    @override
    Widget build(BuildContext context)
    {
        return Column(
            children: [
                Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    children: [
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
                            description: 'Workout more than 30 minutes a day for 7 day streak '
                        ),
                        AchievementItem(
                            imagePath: 'assets/image/Achievement_Page/Achievement_New Start.png',
                            text: 'New Start',
                            description: '"This is the begining!"'
                        )
                    ]
                )
            ]
        );
    }
}
class SettingsPage extends StatelessWidget
{
    @override
    Widget build(BuildContext context)
    {
        return Column(
            children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                    child: Column(
                        spacing: 20,
                        children: [
                            SettingsItem(
                                text: 'Password Settings',
                                bgColor: AppColors.secondarySolid50,
                                textColor: AppColors.black100
                            ),
                            SettingsItem(
                                text: 'Notification Settings',
                                bgColor: AppColors.secondarySolid50,
                                textColor: AppColors.black100
                            ),
                            SettingsItem(
                                text: 'Privacy Settings',
                                bgColor: AppColors.secondarySolid50,
                                textColor: AppColors.black100
                            ),
                            SettingsItem(
                                text: 'Log out',
                                bgColor: AppColors.communicationSolidError,
                                textColor: AppColors.white100,
                                onTap: ()
                                {
                                    LoginScreen();
                                    Navigator.push(context, 
                                        MaterialPageRoute(builder: (context) => LoginScreen())
                                    );
                                }
                            )
                        ]
                    )
                )
            ]
        );
    }
}

