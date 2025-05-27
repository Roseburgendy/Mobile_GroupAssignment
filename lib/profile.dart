import 'package:assignment1/generated/assets.dart';
import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/widgets/achievement_item.dart';
import 'package:assignment1/src/widgets/box_button.dart';
import "package:flutter/material.dart";
import 'package:assignment1/box_ui.dart';
import 'package:assignment1/src/shared/app_effects.dart';
import '../src/widgets/custom_bottom_nav_bar.dart';

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
            body: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                children: [
                    TabMenu()
                ]
            )
        );
        // TODO: implement build
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
                        indicatorPadding: EdgeInsets.only(top: -5),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        /// TABS
                        tabs: [
                            Tab(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Icon(Icons.emoji_events_outlined),
                                        Text(
                                            "Medals",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat'
                                            )
                                        )
                                    ]
                                )
                            ),
                            Tab(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Icon(Icons.settings_outlined),
                                        Text(
                                            "Settings",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat'
                                            )
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
                            Center(child: Text("Settings Page"))
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
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                        AchievementItem(
                            imagePath: 'assets/image/Achievement_Page/Achievement_Animal Lover.png',
                            text: 'Animal Lover'
                        ),
                        AchievementItem(
                            imagePath: 'assets/image/Achievement_Page/Achievement_Drinker.png',
                            text: 'Drinker'
                        ),
                        AchievementItem(
                            imagePath: 'assets/image/Achievement_Page/Achievement_Energetic.png',
                            text: 'Energetic'
                        ),
                        AchievementItem(
                            imagePath: 'assets/image/Achievement_Page/Achievement_New Start.png',
                            text: 'New Start'
                        )
                    ]
                )
            ]
        );
    }
}
