import 'package:flutter/material.dart';
import '../../core2/app_export.dart';
import '../../widgets2/custom_image_view.dart';

class WorkoutCompletionScreen extends StatelessWidget {
  const WorkoutCompletionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: appTheme.colorFFEEEE),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: 375.h,
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  decoration: BoxDecoration(
                    color: appTheme.colorFFFEFD,
                    border: Border.all(color: appTheme.blackCustom, width: 3.h),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 140.h),
                          _buildMainCard(),
                          SizedBox(height: 60.h), // 👈 卡片底部留白
                        ],
                      ),
                      _buildAvatarCircle(),
                      _buildCloseButton(context),
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

  Widget _buildCloseButton(BuildContext context) {
    return Positioned(
      right: 24.h,
      top: 24.h,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.workoutStartScreen,
                (route) => false,
            arguments: {'fromCompletion': true},
          );
        },
        child: Container(
          width: 30.h,
          height: 30.h,
          decoration: BoxDecoration(
            color: appTheme.colorFFFFDD,
            borderRadius: BorderRadius.circular(16.h),
            border: Border.all(color: appTheme.colorFF0014, width: 2.h),
            boxShadow: [
              BoxShadow(
                color: appTheme.colorFF0014,
                offset: Offset(1, 2),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgIcon,
                height: 8.h,
                width: 8.h,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgIcon,
                height: 8.h,
                width: 8.h,
                color: appTheme.colorFF0014,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarCircle() {
    return Positioned(
      top: 53.h,
      left: 50.h,
      right: 50.h,
      child: Container(
        width: 180.h,
        height: 180.h,
        decoration: BoxDecoration(
          color: appTheme.colorFF006B,
          shape: BoxShape.circle,
          border: Border.all(color: appTheme.colorFF0014, width: 1.h),
        ),
        child: Center(
          child: CustomImageView(
            imagePath: ImageConstant.imgDuolingo,
            height: 143.h,
            width: 143.h,
          ),
        ),
      ),
    );
  }

  Widget _buildMainCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      decoration: BoxDecoration(
        color: appTheme.colorFFFFF8,
        borderRadius: BorderRadius.circular(32.h),
        border: Border.all(color: appTheme.blackCustom, width: 3.h),
      ),
      padding: EdgeInsets.only(top: 90.h, bottom: 24.h, left: 24.h, right: 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'FANTASTIC！\nYou just finished another great workout.',
            textAlign: TextAlign.center,
            style: TextStyleHelper.instance.title20BoldMontserrat.copyWith(
              height: 1.7,
            ),
          ),
          SizedBox(height: 32.h),
          _buildTrophySection(),
          SizedBox(height: 24.h),
          _buildStatsSection(),
        ],
      ),
    );
  }

  Widget _buildTrophySection() {
    return SizedBox(
      width: 130.h,
      height: 130.h,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgIccup,
            height: 110.h,
            width: 115.h,
          ),
          Positioned(
            top: -10.h,
            right: 30.h,
            child: CustomImageView(
              imagePath: ImageConstant.imgLashes,
              height: 18.h,
              width: 66.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return SizedBox(
      height: 110.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.75,
              child: CustomImageView(
                imagePath: ImageConstant.imgMountains,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatItem("Duration (min)", "5:00"),
                _buildStatItem("Burn (Kcal)", "182"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyleHelper.instance.title16SemiBoldMontserrat.copyWith(
            height: 0.8,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          width: 104.h,
          height: 47.h,
          decoration: BoxDecoration(
            color: appTheme.colorFFFFF8,
            borderRadius: BorderRadius.circular(23.h),
            border: Border.all(color: appTheme.colorFFFFAA, width: 8.h),
            boxShadow: [
              BoxShadow(
                color: appTheme.colorFF0014,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyleHelper.instance.display38SemiBoldMontserrat.copyWith(height: 0.8),
            ),
          ),
        ),
      ],
    );
  }
}
