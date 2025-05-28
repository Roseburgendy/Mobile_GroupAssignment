import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';

class WorkoutStartScreen extends StatefulWidget
{
    const WorkoutStartScreen({Key? key}) : super(key: key);

    @override
    State<WorkoutStartScreen> createState() => _WorkoutStartScreenState();
}

class _WorkoutStartScreenState extends State<WorkoutStartScreen>
{
    bool _hasHandledRedirect = false;

    @override
    void didChangeDependencies() 
    {
        super.didChangeDependencies();

        final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

        if (!_hasHandledRedirect && args?['fromCompletion'] == true) 
        {
            _hasHandledRedirect = true;
            Future.microtask(_triggerRandomRedirect);
        }
    }

    void _triggerRandomRedirect() 
    {
        final isA = Random().nextBool();
        Navigator.pushNamed(
            context,
            isA
                ? AppRoutes.cardCollectionSuccessScreen
                : AppRoutes.workoutEmptyStateScreen
        );
    }

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            backgroundColor: appTheme.colorFFFEFD,
            body: Stack(
                children: [
                    /// 🟢 可滚动部分（主内容）
                    SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: 160.h),
                        child: Column(
                            children: [
                                SizedBox(height: 50.h),
                                _buildBackButton(),
                                SizedBox(height: 50.h),

                                SizedBox(
                                    height: 420.h + 65.h, // 卡片高度 + GO 按钮一半高度（确保容纳按钮）
                                    child: Stack(
                                        alignment: Alignment.topCenter,
                                        clipBehavior: Clip.none, // 👈 关键点：允许超出部分显示
                                        children: [
                                            _buildMainWorkoutCard(),
                                            Positioned(
                                                top: 420.h - 65.h,
                                                child: _buildGoButton(context)
                                            )
                                        ]
                                    )
                                ),

                                SizedBox(height: 80.h)
                            ]
                        )
                    ),

                    /// 🟡 固定底部导航栏
                    Positioned(
                        bottom: 400.h,
                        left: 169.h,
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 100.h),
                            child: _buildBottomNavigationBar()
                        )
                    ),

                    /// 🔺 固定的三角指示器
                    Positioned(
                        bottom: 140.h,
                        left: 169.h,
                        child: _buildSelectionIndicator()
                    )
                ]
            )
        );
    }

    Widget _buildBackButton() 
    {
        return Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 33.h),
                child: Container(
                    width: 32.h,
                    height: 32.h,
                    decoration: BoxDecoration(
                        color: appTheme.colorFFFFAA,
                        borderRadius: BorderRadius.circular(16.h),
                        border: Border.all(color: appTheme.colorFF0014, width: 2.h),
                        boxShadow: [
                            BoxShadow(
                                color: appTheme.colorFF0014,
                                offset: Offset(1.h, 2.h),
                                blurRadius: 0
                            )
                        ]
                    ),
                    child: Center(
                        child: CustomImageView(
                            imagePath: ImageConstant.imgIcarrowright,
                            height: 24.h,
                            width: 24.h
                        )
                    )
                )
            )
        );
    }

    Widget _buildMainWorkoutCard() 
    {
        return Container(
            width: 327.h,
            height: 420.h,
            decoration: BoxDecoration(
                color: appTheme.colorFFFFF8,
                borderRadius: BorderRadius.circular(32.h),
                border: Border.all(color: appTheme.blackCustom, width: 3.h)
            ),
            child: Stack(
                children: [
                    Positioned(
                        top: 23.h,
                        left: 88.h,
                        child: Text(
                            'Start Workout',
                            style: TextStyleHelper.instance.title20Bold
                        )
                    ),
                    Positioned(
                        top: 110.h,
                        left: 63.h,
                        child: CustomImageView(
                            imagePath: ImageConstant.imgDuolingo,
                            height: 200.h,
                            width: 200.h
                        )
                    )
                ]
            )
        );
    }

    Widget _buildGoButton(BuildContext context) 
    {
        return GestureDetector(
            onTap: ()
            {
                Navigator.pushNamed(context, AppRoutes.workoutTimerScreen);
            },
            child: Container(
                width: 130.h,
                height: 130.h,
                decoration: BoxDecoration(
                    color: appTheme.colorFF009D,
                    borderRadius: BorderRadius.circular(65.h),
                    border: Border.all(color: appTheme.colorFF0014, width: 2.h),
                    boxShadow: [
                        BoxShadow(
                            color: appTheme.colorFF0014,
                            offset: Offset(1.h, 2.h),
                            blurRadius: 0
                        )
                    ]
                ),
                child: Center(
                    child: Text('GO', style: TextStyleHelper.instance.display48SemiBold)
                )
            )
        );
    }

    Widget _buildBottomNavigationBar() 
    {
        return Container(
            width: 364.h,
            height: 79.h,
            decoration: BoxDecoration(
                color: appTheme.colorFFFFF8,
                borderRadius: BorderRadius.circular(25.h),
                border: Border.all(color: appTheme.colorFF009D, width: 2.h),
                boxShadow: [
                    BoxShadow(
                        color: appTheme.colorFFA2D2,
                        offset: Offset(3.h, 8.h),
                        blurRadius: 0
                    )
                ]
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.h),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgVolleyball,
                            height: 42.h,
                            width: 42.h
                        ),
                        CustomImageView(
                            imagePath: ImageConstant.imgBike,
                            height: 42.h,
                            width: 42.h
                        ),
                        CustomImageView(
                            imagePath: ImageConstant.imgBaseball,
                            height: 42.h,
                            width: 42.h
                        ),
                        CustomImageView(
                            imagePath: ImageConstant.imgRun,
                            height: 42.h,
                            width: 42.h
                        ),
                        CustomImageView(
                            imagePath: ImageConstant.imgTennisball,
                            height: 42.h,
                            width: 42.h
                        )
                    ]
                )
            )
        );
    }

    Widget _buildSelectionIndicator() 
    {
        return CustomImageView(
            imagePath: ImageConstant.imgTriangle,
            height: 32.h,
            width: 31.h
        );
    }
}
