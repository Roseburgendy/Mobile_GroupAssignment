import 'package:flutter/material.dart';
import '../../core4/app_export.dart';
import '../../widgets4/custom_image_view.dart';

class CardCollectionSuccessScreen extends StatelessWidget {
  const CardCollectionSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: appTheme.colorFF6B72,
          body: SafeArea(
            child: Stack(
              children: [
                // 返回按钮
                Positioned(
                  top: 6.h,
                  left: 4.h,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.workoutStartScreen,
                            (route) => false,
                      );
                    },
                    child: Container(
                      width: 40.h,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: appTheme.colorFFFFAA,
                        borderRadius: BorderRadius.circular(10.h),
                        border: Border.all(color: appTheme.blackCustom, width: 2.h),
                      ),
                      child: Center(
                        child: CustomImageView(
                          imagePath: ImageConstant.img,
                          height: 24.h,
                          width: 24.h,
                        ),
                      ),
                    ),
                  ),
                ),

                // 滚动内容卡片
                Positioned.fill(
                  top: 60.h,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      top: 48.h,
                      left: 12.h,
                      right: 12.h,
                      bottom: 40.h, // 原来 100.h，这里略微缩小留底边距
                    ),
                    child: Center(
                      child: _buildMainCard(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMainCard(BuildContext context) {
    return Container(
      width: 350.h,
      padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 6.h),
      decoration: BoxDecoration(
        color: appTheme.whiteCustom,
        borderRadius: BorderRadius.circular(10.h),
        border: Border.all(color: appTheme.blackCustom, width: 3.h),
      ),
      child: Column(
        children: [
          SizedBox(height: 31.h),
          Text('Awesome!', style: TextStyleHelper.instance.headline32Bold),
          SizedBox(height: 14.h),
          CustomImageView(
            imagePath: ImageConstant.imgRectangle3041,
            height: 122.h,
            width: 143.h,
            radius: BorderRadius.circular(24.h),
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: 263.h,
            child: Text(
              'You got a brand new card!',
              style: TextStyleHelper.instance.headline24Bold,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10.h),
          Text('Collected: 1/5', style: TextStyleHelper.instance.title16),
          SizedBox(height: 32.h),

          // 返回按钮
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 220.h,
              height: 61.h,
              padding: EdgeInsets.symmetric(horizontal: 4.h),
              decoration: BoxDecoration(
                color: appTheme.colorFF009D,
                borderRadius: BorderRadius.circular(10.h),
                border: Border.all(color: appTheme.colorFF0014, width: 2.h),
                boxShadow: [
                  BoxShadow(
                    color: appTheme.colorFF0014,
                    offset: Offset(1.h, 2.h),
                    blurRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Back',
                    style: TextStyleHelper.instance.headline32Bold.copyWith(
                      color: appTheme.whiteCustom,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgIcarrowright,
                    height: 40.h,
                    width: 40.h,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
