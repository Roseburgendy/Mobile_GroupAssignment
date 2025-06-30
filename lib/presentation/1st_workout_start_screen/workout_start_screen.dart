import 'dart:math';
import 'package:assignment1/src/shared/styles.dart';
import 'package:assignment1/src/widgets/box_text.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import 'package:assignment1/l10n/app_localizations.dart';
import '/presentation/5th_card_collection_success_screen/card_collection_success_screen.dart';
import '/presentation/4th_workout_empty_state_screen/workout_empty_state_screen.dart';

class NavItem {
  final String imagePath;
  NavItem({required this.imagePath});
}

class WorkoutStartScreen extends StatefulWidget {
  const WorkoutStartScreen({super.key});

  @override
  State<WorkoutStartScreen> createState() => _WorkoutStartScreenState();
}

class _WorkoutStartScreenState extends State<WorkoutStartScreen> {
  bool _hasHandledRedirect = false;

  late PageController _pageController;
  int _selectedIndex = 3;

  final List<NavItem> _navItems = [
    NavItem(imagePath: ImageConstant.imgVolleyball),
    NavItem(imagePath: ImageConstant.imgBike),
    NavItem(imagePath: ImageConstant.imgBaseball),
    NavItem(imagePath: ImageConstant.imgRun),
    NavItem(imagePath: ImageConstant.imgTennisball),
    NavItem(imagePath: ImageConstant.imgBasketball),
    NavItem(imagePath: ImageConstant.imgHiking),
    NavItem(imagePath: ImageConstant.imgSoccerBall),
  ];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.25,
    );
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (!_hasHandledRedirect && (args?['fromCompletion'] ?? false)) {
      _hasHandledRedirect = true;
      Future.microtask(_triggerRandomRedirect);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _triggerRandomRedirect() {
    final isA = _random.nextBool();

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Random Result',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => Center(
        child: isA
            ? const CardCollectionSuccessScreen()
            : const WorkoutEmptyStateScreen(),
      ),
      transitionBuilder: (_, animation, __, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, ori, _) {
        return Scaffold(
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
              Text(AppLocalizations.of(context)!.startWorkout,style: ExtraBigHeadlineStyle.copyWith(fontSize: 30),),
              //BoxText.ExtraBigHeadline(AppLocalizations.of(context)!.startWorkout,),

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
          bottom: -65.h / 6,
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
          child: Text(
            AppLocalizations.of(context)!.go, // 替换硬编码文本
            style: TextStyleHelper.instance.display48SemiBold,
          ),

        ),
      ),
    );
  }


  Widget _buildNavigationWithIndicator() {
    final double navBarWidth = 364.h;
    final double indicatorWidth = 31.h;
    final double itemSlotWidth = navBarWidth / _navItems.length;
    final double _ = (_selectedIndex * itemSlotWidth) + (itemSlotWidth / 2) - (indicatorWidth / 2);

    return Container(
      width: navBarWidth,
      height: 95.h,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          _buildBottomNavigationBar(),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: -16.h,
            left: 170.h,
            child: Transform.rotate(
              angle: pi,
              child: _buildSelectionIndicator(),
            ),
          ),
        ],
      ),
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
      child: PageView.builder(
        controller: _pageController,
        itemCount: _navItems.length,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final item = _navItems[index];
          return GestureDetector(
            onTap: (){
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Center(
              child: CustomImageView(
                imagePath: item.imagePath,
                height: 42.h,
                width: 42.h,
              ),
            ),
          );
        },
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