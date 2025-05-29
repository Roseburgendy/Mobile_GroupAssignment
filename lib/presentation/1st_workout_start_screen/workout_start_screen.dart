import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../src/shared/app_colors.dart';
import '../../src/widgets/box_text.dart';
import '../../widgets/custom_image_view.dart';

class WorkoutStartScreen extends StatefulWidget {
  const WorkoutStartScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutStartScreen> createState() => _WorkoutStartScreenState();
}

class _WorkoutStartScreenState extends State<WorkoutStartScreen> {
  bool _hasHandledRedirect = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (!_hasHandledRedirect && (args?['fromCompletion'] ?? false)) {
      _hasHandledRedirect = true;
      Future.microtask(_triggerRandomRedirect);
    }
  }

  void _triggerRandomRedirect() {
    final isA = Random().nextBool();
    Navigator.pushNamed(
      context,
      isA
          ? AppRoutes.cardCollectionSuccessScreen
          : AppRoutes.workoutEmptyStateScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, ori, _) {
        return Scaffold(

          backgroundColor: appTheme.colorFFFEFD,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                children: [
                  _buildNavigationWithIndicator(),
                  SizedBox(height: 40.h),
                  _buildMainCardWithGoButton(context),
                  SizedBox(height: 60.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMainCardWithGoButton(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 65.h),
          width: 327.h,
          height: 420.h,
          decoration: BoxDecoration(
            color: appTheme.colorFFFFF8,
            borderRadius: BorderRadius.circular(32.h),
            border: Border.all(color: appTheme.blackCustom, width: 3.h),
          ),
          child: Column(
            children: [
              SizedBox(height: 23.h),
              Text(
                'Start Workout',
                style: TextStyleHelper.instance.title20Bold,
              ),
              SizedBox(height: 64.h),
              CustomImageView(
                imagePath: ImageConstant.imgDuolingo,
                height: 200.h,
                width: 200.h,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -65.h / 6, // 让按钮一半插入底部
          child: _buildGoButton(context),
        ),
      ],
    );
  }

  Widget _buildGoButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
              blurRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Text('GO', style: TextStyleHelper.instance.display48SemiBold),
        ),
      ),
    );
  }

  Widget _buildNavigationWithIndicator() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        _buildBottomNavigationBar(),
        Positioned(
          bottom: -16.h,
          child: Transform.rotate(
            angle: pi,
            child: _buildSelectionIndicator(),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
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
            blurRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgVolleyball,
              height: 42.h,
              width: 42.h,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgBike,
              height: 42.h,
              width: 42.h,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgBaseball,
              height: 42.h,
              width: 42.h,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgRun,
              height: 42.h,
              width: 42.h,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgTennisball,
              height: 42.h,
              width: 42.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionIndicator() {
    return CustomImageView(
      imagePath: ImageConstant.imgTriangle,
      height: 32.h,
      width: 31.h,
    );
  }
}
