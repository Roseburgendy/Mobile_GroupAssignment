// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get hello => 'Hello!';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get languageSettings => 'Language Settings';

  @override
  String get myProfile => 'My Profile';

  @override
  String get yourMedals => 'Your Medals';

  @override
  String get animalLover => 'Animal Lover';

  @override
  String get animalLoverDesc => 'Own 5 pets in your pet house.';

  @override
  String get drinker => 'Drinker';

  @override
  String get drinkerDesc => 'Drink 1000ml water for 7 days';

  @override
  String get energetic => 'Energetic';

  @override
  String get energeticDesc => 'Workout 30min for 7 days';

  @override
  String get newStart => 'New Start';

  @override
  String get newStartDesc => 'This is the beginning!';

  @override
  String get bio => 'Bio';

  @override
  String get chooseProfilePicture => 'Choose Profile Picture';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get settings => 'Settings';

  @override
  String get passwordSettings => 'Password Settings';

  @override
  String get notification => 'Notification';

  @override
  String get helpSupport => 'Help and Support';

  @override
  String get logout => 'Log out';

  @override
  String get english => 'English';

  @override
  String get chineseSimplified => 'Simplified Chinese';

  @override
  String get fullName => 'Nick Name';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get editWeights => 'Edit Weights';

  @override
  String get initialWeight => 'Initial Weight';

  @override
  String get currentWeight => 'Current Weight';

  @override
  String get targetWeight => 'Target Weight';

  @override
  String goalWeight(Object weight) {
    return 'GOAL\n${weight}kg';
  }

  @override
  String currentWeightValue(Object weight) {
    return '${weight}kg';
  }

  @override
  String get ok => 'OK';

  @override
  String get addWaterIntake => 'Add Water Intake';

  @override
  String get amount => 'Amount';

  @override
  String get mlUnit => 'ml';

  @override
  String get clearWaterIntakeTitle => 'Clear Water Intake';

  @override
  String get clearWaterIntakeContent =>
      'Are you sure you want to clear your water intake?';

  @override
  String get myLog => 'My Log';

  @override
  String get myCalendar => 'My Calendar';

  @override
  String firstWeight(Object weight) {
    return 'INITIAL\n${weight}kg';
  }

  @override
  String get dailyExercise => 'Daily Exercise';

  @override
  String activityCalories(Object value) {
    return 'Activity calories: $value kcal';
  }

  @override
  String activityHours(Object value) {
    return 'Activity hours: $value hour(s)';
  }

  @override
  String get start => 'Start';

  @override
  String get todayWaterTitle => 'Daily Water Intake';

  @override
  String get todayStepsTitle => 'Daily Steps';

  @override
  String get lostWeight => 'LOST';

  @override
  String get burnedCalories => 'BURNED';

  @override
  String get previousDay => 'Last';

  @override
  String get nextDay => 'Next';

  @override
  String get petHouse => 'Pet House';

  @override
  String get collected => 'COLLECTED';

  @override
  String get toCollect => 'TO COLLECT';

  @override
  String get collectedLabel => 'collected';

  @override
  String get startWorkout => 'Start Workout';

  @override
  String get go => 'GO';

  @override
  String get workoutCompleteMessage =>
      'FANTASTIC!\nYou just finished another great workout.';

  @override
  String get durationLabel => 'Duration (min:sec)';

  @override
  String get burnLabel => 'Burn (Kcal)';

  @override
  String get emptyOops => 'Oops!';

  @override
  String get emptyYeah => 'Yeah!';

  @override
  String get emptyGotPoints => 'Got Points!';

  @override
  String get emptyNoNewCard => 'No new card this time.';

  @override
  String workoutTodayText(Object count, Object minutes) {
    return 'Workout Today: $count time • $minutes min';
  }

  @override
  String get keepGoing => 'Keep Going!';

  @override
  String get cardSuccessTitle => 'Awesome!';

  @override
  String get cardSuccessSubtitle => 'You got a brand new card!';

  @override
  String cardCollectedStatus(Object current, Object total) {
    return 'Collected: $current/$total';
  }

  @override
  String get back => 'Back';

  @override
  String get recentWeek => 'Recent Week';

  @override
  String get calories => 'Cal';

  @override
  String get water => 'Water';

  @override
  String get mon => 'Mon';

  @override
  String get tue => 'Tue';

  @override
  String get wed => 'Wed';

  @override
  String get thu => 'Thu';

  @override
  String get fri => 'Fri';

  @override
  String get sat => 'Sat';

  @override
  String get sun => 'Sun';

  @override
  String get monShort => 'MON';

  @override
  String get tueShort => 'TUE';

  @override
  String get wedShort => 'WED';

  @override
  String get thuShort => 'THU';

  @override
  String get friShort => 'FRI';

  @override
  String get satShort => 'SAT';

  @override
  String get sunShort => 'SUN';

  @override
  String get dailyExerciseTitle => 'Daily Exercise';

  @override
  String get activityCaloriesLabel => 'Activity calories';

  @override
  String get activityHoursLabel => 'Activity hours';

  @override
  String get hoursSuffix => 'hours';

  @override
  String get waterIntakeLabel => 'Water Intake';

  @override
  String get stepsLabel => 'Steps';

  @override
  String get waterIntake => 'Water Intake';

  @override
  String get loginEmailHint => 'Email/ID';

  @override
  String get loginPassword => 'Password';

  @override
  String get loginForgotPassword => 'FORGOT PASSWORD?';

  @override
  String get loginButton => 'LOG IN';

  @override
  String get loginNoAccountText => 'No Account?';

  @override
  String get loginSignUp => 'SIGN UP';

  @override
  String get loginMissingFieldsMessage =>
      'Please enter both email and password';

  @override
  String get resetPasswordTitle => 'Reset Password';

  @override
  String get signUpTitle => 'Create Account';

  @override
  String get commonEmailHint => 'Email/ID';

  @override
  String get commonPasswordHint => 'Password';

  @override
  String get resetButton => 'Reset';

  @override
  String get signUpButton => 'Sign Up';

  @override
  String get commonMissingFieldsAlert => 'Please enter both email and password';

  @override
  String get faqTitle => 'Frequently Asked Questions';

  @override
  String get resetPasswordQ => 'How do I reset my password?';

  @override
  String get resetPasswordA =>
      'On the login page, tap \'Forgot Password\' and follow the on-screen instructions to reset it.';

  @override
  String get changeLanguageQ => 'How to change language?';

  @override
  String get changeLanguageA =>
      'Go to Profile > Language Settings > choose your preferred language(English or Chinese). Current we only support English and Chinese languages.';

  @override
  String get earnMedalsQ => 'How can I earn Medals?';

  @override
  String get earnMedalsA =>
      'Stay active and hydrated every day! Your progress will be tracked and rewarded with medals as you improve.';

  @override
  String get getPetsQ => 'How do I get pets?';

  @override
  String get getPetsA =>
      'You’ll earn stars after each workout. Use these stars to purchase pets from the Pet House.';

  @override
  String get changePhotoQ => 'How to change profile photo?';

  @override
  String get changePhotoA =>
      'Go to Profile > Edit Profile > Tap on profile photo, you can choose your profile from gallery or take a new profile photo.';

  @override
  String get contactSupport => 'Contact Support';

  @override
  String get emailUs => 'Email Us';

  @override
  String get callUs => 'Call Us';

  @override
  String get medals => 'Medals';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get oldPassword => 'Old Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get passwordResetSuccess => 'Password updated successfully.';

  @override
  String get passwordResetFail => 'Failed to update password.';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get fieldRequired => 'This field is required.';

  @override
  String get passwordMismatch => 'Passwords do not match.';

  @override
  String get confirmed => 'Confirmed';

  @override
  String get resetPrompt =>
      'Enter your email/ID and we will send you a password reset link.';

  @override
  String get changePassword => 'Change Password';

  @override
  String get frequentlyAsked => 'Frequently Asked Questions';

  @override
  String yearMonthLabel(Object year, Object month) {
    return '$year/$month';
  }

  @override
  String get petBobaDesc => 'Stay chill, bro';

  @override
  String get petEbiDesc => 'Never mention sashimi in front of him';

  @override
  String get petDjDesc => 'Maybe he is also an idol?';

  @override
  String get petNewHumanDesc => 'Definitely doing good on rhythm games';

  @override
  String get petRorrrrrrDesc => 'Enjoy death metal!';

  @override
  String get petMsBeckyDesc => 'Melt into the night';

  @override
  String get petGuiDesc => 'Solid as a rock';

  @override
  String get petBananaDesc => 'Bro really think bro is a banana';

  @override
  String get petNaruhodoDesc => 'Objection!';

  @override
  String get petGodfatherDesc => 'You never even think to call me Godfather';

  @override
  String get pointNeeded => 'Point needed';

  @override
  String get purchase => 'Purchase';

  @override
  String get notEnoughPoints => 'Not enough points';
}
