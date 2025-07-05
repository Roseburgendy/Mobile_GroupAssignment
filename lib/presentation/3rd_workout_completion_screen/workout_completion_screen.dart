import 'package:flutter/material.dart';
import '../../core2/app_export.dart';
import '../../widgets2/custom_image_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assignment1/dbzzq/openLocalDatabase.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:assignment1/src/widgets/box_button.dart';

class WorkoutCompletionScreen extends StatelessWidget {

  const WorkoutCompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final int durationInSeconds = args?['duration'] ?? 300;

    //这里插入加分逻辑
    _addPointToUser();

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
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 140.h),
                          _buildMainCard(context,durationInSeconds),
                          SizedBox(height: 140.h),
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

  //加分函数
  void _addPointToUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userID');

    if (userId == null) {
      debugPrint('未登录，无法增加积分');
      return;
    }

    final db = await openLocalDatabase();
    await db.rawUpdate(
      'UPDATE users SET point = point + 1 WHERE id = ?',
      [userId],
    );
    debugPrint('已为用户 $userId 增加 1 个积分');
  }


  String _formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String secs = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$secs";
  }

  Widget _buildCloseButton(BuildContext context) {
    return Positioned(
      right: 24.h,
      top: 24.h,
      child: BoxButton(
              style: ButtonStyleType.secondary,
              icon: const Icon(Icons.close, size: 20),
              onTap: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.workoutStartScreen,
                (route) => false,
            arguments: {'fromCompletion': true},
          );
        },
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
            imagePath: ImageConstant.imgCrown,
            radius: BorderRadius.circular(70),
            height: 143.h,
            width: 143.h,
          ),
        ),
      ),
    );
  }

  Widget _buildMainCard(BuildContext context,int durationInSeconds) {
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
          SizedBox(height: 20,),
          Text(
            AppLocalizations.of(context)!.workoutCompleteMessage,
            textAlign: TextAlign.center,
            style: TextStyleHelper.instance.title20BoldMontserrat.copyWith(
              height: 1.7,
            ),
          ),

          SizedBox(height: 32.h),
          _buildTrophySection(),
          SizedBox(height: 24.h),
          _buildStatsSection(context,durationInSeconds),
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

  Widget _buildStatsSection(BuildContext context,int durationInSeconds) {
    double burn = (durationInSeconds / 300) * 182;
    String durationStr = _formatDuration(durationInSeconds);
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
            padding: EdgeInsets.symmetric(horizontal: 0.h, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatItem(AppLocalizations.of(context)!.durationLabel, durationStr),
                _buildStatItem(AppLocalizations.of(context)!.burnLabel, burn.toStringAsFixed(0)),

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
              style: TextStyleHelper.instance.display38SemiBoldMontserrat.copyWith(height: 0.8,fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
