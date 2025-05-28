import 'dart:async';
import 'package:flutter/material.dart';
import '../../core1/app_export.dart';
import '../../widgets1/custom_control_button.dart';
import '../../widgets1/custom_image_view.dart';

class WorkoutTimerScreen extends StatefulWidget {
  const WorkoutTimerScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutTimerScreen> createState() => _WorkoutTimerScreenState();
}

class _WorkoutTimerScreenState extends State<WorkoutTimerScreen> {
  @override
  void initState() {
    super.initState();

    // 设置20秒后自动跳转
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, AppRoutes.workoutCompletionScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: appTheme.colorFFFEFD,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: 375.h,
                  padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
                  decoration: BoxDecoration(
                    color: appTheme.colorFFFEFD,
                    border: Border.all(color: appTheme.blackCustom, width: 3.h),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          _buildWorkoutCard(),
                          Positioned(
                            bottom: -82.h,
                            child: _buildTimerCircle(),
                          ),
                        ],
                      ),
                      SizedBox(height: 82.h),
                      _buildControlButtons(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWorkoutCard() {
    return Container(
      width: 327.h,
      height: 440.h,
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
            style: TextStyleHelper.instance.title20BoldMontserrat,
          ),
          SizedBox(height: 69.h),
          CustomImageView(
            imagePath: ImageConstant.imgDuolingo,
            height: 200.h,
            width: 200.h,
          ),
        ],
      ),
    );
  }

  Widget _buildTimerCircle() {
    return Container(
      width: 165.h,
      height: 165.h,
      decoration: BoxDecoration(
        color: appTheme.colorFFFFF8,
        borderRadius: BorderRadius.circular(82.h),
        border: Border.all(color: appTheme.colorFF009D, width: 6.h),
        boxShadow: [
          BoxShadow(color: appTheme.colorFF0014, offset: Offset(1.h, 2.h)),
        ],
      ),
      child: Center(
        child: Text(
          '5:00',
          style: TextStyleHelper.instance.display48SemiBoldMontserrat,
        ),
      ),
    );
  }

  Widget _buildControlButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 52.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomControlButton(
            height: 60.h,
            width: 60.h,
            imagePath: ImageConstant.imgPause,
            imageHeight: 44.h,
            imageWidth: 44.h,
            decoration: BoxDecoration(
              color: appTheme.colorFFFFDD,
              borderRadius: BorderRadius.circular(16.h),
              border: Border.all(color: appTheme.colorFF0014, width: 2.h),
              boxShadow: [
                BoxShadow(
                  color: appTheme.colorFF0014,
                  offset: Offset(1.h, 2.h),
                ),
              ],
            ),
            onTap: () {
              // Pause action
            },
          ),
          CustomControlButton(
            height: 60.h,
            width: 60.h,
            imagePath: ImageConstant.imgIcon,
            imageHeight: 32.h,
            imageWidth: 32.h,
            decoration: BoxDecoration(
              color: appTheme.colorFFFFDD,
              borderRadius: BorderRadius.circular(16.h),
              border: Border.all(color: appTheme.colorFF0014, width: 2.h),
              boxShadow: [
                BoxShadow(
                  color: appTheme.colorFF0014,
                  offset: Offset(1.h, 2.h),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.workoutStartScreen,
                    (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
