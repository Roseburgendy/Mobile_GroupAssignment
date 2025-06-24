import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../core1/app_export.dart';
import '../../widgets1/custom_control_button.dart';
import '../../widgets1/custom_image_view.dart';

class WorkoutTimerScreen extends StatefulWidget {
  const WorkoutTimerScreen({super.key});

  @override
  State<WorkoutTimerScreen> createState() => _WorkoutTimerScreenState();
}

class _WorkoutTimerScreenState extends State<WorkoutTimerScreen> {
  Timer? _timer;
  Duration _duration = const Duration(minutes: 5);
  Duration _remaining = const Duration(minutes: 5);
  bool _isRunning = false;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining.inSeconds > 0) {
        setState(() {
          _remaining = _remaining - const Duration(seconds: 1);
        });
      } else {
        _timer?.cancel();
        setState(() {
          playSoundEffect();
          _isRunning = false;
        });
        if (mounted) {
          Navigator.pushReplacementNamed(
              context, AppRoutes.workoutCompletionScreen);
        }
      }
    });
  }

  void _pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      setState(() {
        _isRunning = false;
      });
    }
  }

  void _resumeTimer() {
    if (!_isRunning && _remaining.inSeconds > 0) {
      _startTimer();
    }
  }

  void _showTimePicker() {
    if (_isRunning) return;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: 300,
          child: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.ms,
            initialTimerDuration: _duration,
            onTimerDurationChanged: (Duration newDuration) {
              setState(() {
                _duration = newDuration;
                _remaining = newDuration;
              });
            },
          ),
        );
      },
    ).whenComplete(() {
      if (_remaining.inSeconds > 0) {
        _startTimer();
      }
    });
  }

  void playSoundEffect() async {
    await audioPlayer.play(AssetSource('sound/Ring01.wav'));
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
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
    return GestureDetector(
      onTap: _showTimePicker,
      child: Container(
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
            _formatDuration(_remaining),
            style: TextStyleHelper.instance.display48SemiBoldMontserrat,
          ),
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
          // Left Pause/Play Button
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
              if (_isRunning) {
                _pauseTimer();
              } else {
                _resumeTimer();
              }
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
              _timer?.cancel();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
                arguments: {
                  'initialIndex': 2,
                  'fromTimer': true,
                },
              );
            },
          ),
        ],
      ),
    );
  }
}