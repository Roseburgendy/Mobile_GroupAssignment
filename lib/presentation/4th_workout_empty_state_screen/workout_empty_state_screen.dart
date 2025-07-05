import 'package:flutter/material.dart';
import '../../core3/app_export.dart';
import '../../widgets3/custom_image_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class WorkoutEmptyStateScreen extends StatelessWidget {
  const WorkoutEmptyStateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  // 返回按钮
                  Positioned(top: 60.h, left: 12.h, child: _buildBackButton(context)),

                  // 主卡片部分，滚动
                  Positioned.fill(
                    top: 108.h,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 12.h),
                      child: Column(
                        children: [
                          _buildMainCard(context),
                          SizedBox(height: 100.h), // 保证底部留白
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
          context,
            '/', // 回到 MainPage
            (route) => false,
          arguments: {'initialIndex': 2}, // 回到 WorkoutStartScreen
        );
      },
      child: Container(
        width: 40.h,
        height: 40.h,
        decoration: BoxDecoration(
          color: appTheme.colorFFF8C1,
          shape: BoxShape.circle,
          border: Border.all(color: appTheme.blackCustom),
        ),
        child: Center(
          child: CustomImageView(
            imagePath: ImageConstant.img,
            height: 24.h,
            width: 24.h,
          ),
        ),
      ),
    );
  }

  Widget _buildMainCard(BuildContext context) {
    return Container(
      width: 350.h,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 32.h),
      decoration: BoxDecoration(
        color: appTheme.whiteCustom,
        borderRadius: BorderRadius.circular(10.h),
        border: Border.all(color: appTheme.blackCustom, width: 3.h),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.emptyYeah, style: TextStyleHelper.instance.headline32Bold),
          SizedBox(height: 24.h),
          _buildStackedCards(),
          SizedBox(height: 44.h),
          Text(
    (AppLocalizations.of(context)!.emptyGotPoints),
            textAlign: TextAlign.center,
            style: TextStyleHelper.instance.headline24Bold,
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

Widget _buildStackedCards() {
  return SizedBox(
    width: 133.h * 1.5,  // 变为 199.5.h
    height: 104.h * 1.5, // 变为 156.h
    child: Stack(
      children: [
        Positioned.fill(
          child: CustomImageView(
            imagePath: ImageConstant.imgRectangle3081,
            width: 133.h * 1.5,
            height: 104.h * 1.5,
          ),
        ),
        Positioned.fill(
          child: CustomImageView(
            imagePath: ImageConstant.imgRectangle3080,
            width: 133.h * 1.5,
            height: 104.h * 1.5,
          ),
        ),
        Positioned(
          top: 20.h * 1.5,  // 30.h
          left: 6.h * 1.5,  // 9.h
          child: CustomImageView(
            imagePath: ImageConstant.imgDuolingo,
            width: 92.h * 1.5,  // 138.h
            height: 92.h * 1.5, // 138.h
          ),
        ),
      ],
    ),
  );
}


  Widget _buildKeepGoingButton(BuildContext context) {
    return Container(
      width: 300.h,
      height: 61.h,
      decoration: BoxDecoration(
        color: appTheme.colorFF009D,
        borderRadius: BorderRadius.circular(10.h),
        border: Border.all(color: appTheme.colorFF0014, width: 2.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.colorFF0014,
            offset: Offset(1, 2),
            blurRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          AppLocalizations.of(context)!.keepGoing,
          style: TextStyleHelper.instance.display36Bold,
        ),
      ),
    );
  }
}
