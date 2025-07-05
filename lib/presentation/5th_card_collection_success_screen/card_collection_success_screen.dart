import 'package:flutter/material.dart';
import '../../core4/app_export.dart';
import '../../widgets4/custom_image_view.dart';
import 'package:assignment1/src/widgets/box_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CardCollectionSuccessScreen extends StatelessWidget {
  const CardCollectionSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Stack(
              children: [
                // 顶部返回按钮（跳转回 MainPage 并激活 WorkoutStartScreen）
                Positioned(
                  top: 6.h,
                  left: 4.h,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/', // MainPage 的路由名
                        (route) => false,
                        arguments: {'initialIndex': 2}, // 激活 Workout tab
                      );
                    },
                    child: Container(
                      width: 40.h,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: appTheme.colorFFFFAA,
                        borderRadius: BorderRadius.circular(10.h),
                        border: Border.all(
                          color: appTheme.blackCustom,
                          width: 2.h,
                        ),
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

                // 内容卡片部分
                Positioned.fill(
                  top: 60.h,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      top: 48.h,
                      left: 12.h,
                      right: 12.h,
                      bottom: 40.h,
                    ),
                    child: Center(child: buildMainCard(context)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Widget buildMainCard(BuildContext context) {
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
          Text(AppLocalizations.of(context)!.cardSuccessTitle, style: TextStyleHelper.instance.headline32Bold),
          CustomImageView(
            imagePath: ImageConstant.imgRectangle3041,
            height: 200.h,
            width: 143.h,
            radius: BorderRadius.circular(24.h),
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: 263.h,
            child: Text(
              AppLocalizations.of(context)!.emptyGotPoints,
              style: TextStyleHelper.instance.headline24Bold,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32.h),
          /*GestureDetector(
            onTap: () {},
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
              ),8/
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.back,
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
          ),*/
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
