import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// The current Language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello!'**
  String get hello;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @languageSettings.
  ///
  /// In en, this message translates to:
  /// **'Language Settings'**
  String get languageSettings;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// No description provided for @yourMedals.
  ///
  /// In en, this message translates to:
  /// **'Your Medals'**
  String get yourMedals;

  /// No description provided for @animalLover.
  ///
  /// In en, this message translates to:
  /// **'Animal Lover'**
  String get animalLover;

  /// No description provided for @animalLoverDesc.
  ///
  /// In en, this message translates to:
  /// **'Own 5 pets in your pet house.'**
  String get animalLoverDesc;

  /// No description provided for @drinker.
  ///
  /// In en, this message translates to:
  /// **'Drinker'**
  String get drinker;

  /// No description provided for @drinkerDesc.
  ///
  /// In en, this message translates to:
  /// **'Drink 1000ml water for 7 days'**
  String get drinkerDesc;

  /// No description provided for @energetic.
  ///
  /// In en, this message translates to:
  /// **'Energetic'**
  String get energetic;

  /// No description provided for @energeticDesc.
  ///
  /// In en, this message translates to:
  /// **'Workout 30min for 7 days'**
  String get energeticDesc;

  /// No description provided for @newStart.
  ///
  /// In en, this message translates to:
  /// **'New Start'**
  String get newStart;

  /// No description provided for @newStartDesc.
  ///
  /// In en, this message translates to:
  /// **'This is the beginning!'**
  String get newStartDesc;

  /// No description provided for @bio.
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get bio;

  /// No description provided for @chooseProfilePicture.
  ///
  /// In en, this message translates to:
  /// **'Choose Profile Picture'**
  String get chooseProfilePicture;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @passwordSettings.
  ///
  /// In en, this message translates to:
  /// **'Password Settings'**
  String get passwordSettings;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @helpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help and Support'**
  String get helpSupport;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @chineseSimplified.
  ///
  /// In en, this message translates to:
  /// **'Simplified Chinese'**
  String get chineseSimplified;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Nick Name'**
  String get fullName;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @editWeights.
  ///
  /// In en, this message translates to:
  /// **'Edit Weights'**
  String get editWeights;

  /// No description provided for @initialWeight.
  ///
  /// In en, this message translates to:
  /// **'Initial Weight'**
  String get initialWeight;

  /// No description provided for @currentWeight.
  ///
  /// In en, this message translates to:
  /// **'Current Weight'**
  String get currentWeight;

  /// No description provided for @targetWeight.
  ///
  /// In en, this message translates to:
  /// **'Target Weight'**
  String get targetWeight;

  /// No description provided for @goalWeight.
  ///
  /// In en, this message translates to:
  /// **'GOAL\n{weight}kg'**
  String goalWeight(Object weight);

  /// No description provided for @currentWeightValue.
  ///
  /// In en, this message translates to:
  /// **'{weight}kg'**
  String currentWeightValue(Object weight);

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @addWaterIntake.
  ///
  /// In en, this message translates to:
  /// **'Add Water Intake'**
  String get addWaterIntake;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @mlUnit.
  ///
  /// In en, this message translates to:
  /// **'ml'**
  String get mlUnit;

  /// No description provided for @clearWaterIntakeTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear Water Intake'**
  String get clearWaterIntakeTitle;

  /// No description provided for @clearWaterIntakeContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear your water intake?'**
  String get clearWaterIntakeContent;

  /// No description provided for @myLog.
  ///
  /// In en, this message translates to:
  /// **'My Log'**
  String get myLog;

  /// No description provided for @myCalendar.
  ///
  /// In en, this message translates to:
  /// **'My Calendar'**
  String get myCalendar;

  /// No description provided for @firstWeight.
  ///
  /// In en, this message translates to:
  /// **'INITIAL\n{weight}kg'**
  String firstWeight(Object weight);

  /// No description provided for @dailyExercise.
  ///
  /// In en, this message translates to:
  /// **'Daily Exercise'**
  String get dailyExercise;

  /// No description provided for @activityCalories.
  ///
  /// In en, this message translates to:
  /// **'Activity calories: {value} kcal'**
  String activityCalories(Object value);

  /// No description provided for @activityHours.
  ///
  /// In en, this message translates to:
  /// **'Activity hours: {value} hour(s)'**
  String activityHours(Object value);

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @todayWaterTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Water Intake'**
  String get todayWaterTitle;

  /// No description provided for @todayStepsTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Steps'**
  String get todayStepsTitle;

  /// No description provided for @lostWeight.
  ///
  /// In en, this message translates to:
  /// **'LOST'**
  String get lostWeight;

  /// No description provided for @burnedCalories.
  ///
  /// In en, this message translates to:
  /// **'BURNED'**
  String get burnedCalories;

  /// No description provided for @previousDay.
  ///
  /// In en, this message translates to:
  /// **'Last'**
  String get previousDay;

  /// No description provided for @nextDay.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextDay;

  /// No description provided for @petHouse.
  ///
  /// In en, this message translates to:
  /// **'Pet House'**
  String get petHouse;

  /// No description provided for @collected.
  ///
  /// In en, this message translates to:
  /// **'COLLECTED'**
  String get collected;

  /// No description provided for @toCollect.
  ///
  /// In en, this message translates to:
  /// **'TO COLLECT'**
  String get toCollect;

  /// No description provided for @collectedLabel.
  ///
  /// In en, this message translates to:
  /// **'collected'**
  String get collectedLabel;

  /// No description provided for @startWorkout.
  ///
  /// In en, this message translates to:
  /// **'Start Workout'**
  String get startWorkout;

  /// No description provided for @go.
  ///
  /// In en, this message translates to:
  /// **'GO'**
  String get go;

  /// No description provided for @workoutCompleteMessage.
  ///
  /// In en, this message translates to:
  /// **'FANTASTIC!\nYou just finished another great workout.'**
  String get workoutCompleteMessage;

  /// No description provided for @durationLabel.
  ///
  /// In en, this message translates to:
  /// **'Duration (min:sec)'**
  String get durationLabel;

  /// No description provided for @burnLabel.
  ///
  /// In en, this message translates to:
  /// **'Burn (Kcal)'**
  String get burnLabel;

  /// No description provided for @emptyOops.
  ///
  /// In en, this message translates to:
  /// **'Oops!'**
  String get emptyOops;

  /// No description provided for @emptyYeah.
  ///
  /// In en, this message translates to:
  /// **'Yeah!'**
  String get emptyYeah;

  /// No description provided for @emptyGotPoints.
  ///
  /// In en, this message translates to:
  /// **'Got Points!'**
  String get emptyGotPoints;

  /// No description provided for @emptyNoNewCard.
  ///
  /// In en, this message translates to:
  /// **'No new card this time.'**
  String get emptyNoNewCard;

  /// No description provided for @workoutTodayText.
  ///
  /// In en, this message translates to:
  /// **'Workout Today: {count} time • {minutes} min'**
  String workoutTodayText(Object count, Object minutes);

  /// No description provided for @keepGoing.
  ///
  /// In en, this message translates to:
  /// **'Keep Going!'**
  String get keepGoing;

  /// No description provided for @cardSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Awesome!'**
  String get cardSuccessTitle;

  /// No description provided for @cardSuccessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You got a brand new card!'**
  String get cardSuccessSubtitle;

  /// No description provided for @cardCollectedStatus.
  ///
  /// In en, this message translates to:
  /// **'Collected: {current}/{total}'**
  String cardCollectedStatus(Object current, Object total);

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @recentWeek.
  ///
  /// In en, this message translates to:
  /// **'Recent Week'**
  String get recentWeek;

  /// No description provided for @calories.
  ///
  /// In en, this message translates to:
  /// **'Cal'**
  String get calories;

  /// No description provided for @water.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get water;

  /// No description provided for @mon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get mon;

  /// No description provided for @tue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tue;

  /// No description provided for @wed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wed;

  /// No description provided for @thu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thu;

  /// No description provided for @fri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get fri;

  /// No description provided for @sat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get sat;

  /// No description provided for @sun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sun;

  /// No description provided for @monShort.
  ///
  /// In en, this message translates to:
  /// **'MON'**
  String get monShort;

  /// No description provided for @tueShort.
  ///
  /// In en, this message translates to:
  /// **'TUE'**
  String get tueShort;

  /// No description provided for @wedShort.
  ///
  /// In en, this message translates to:
  /// **'WED'**
  String get wedShort;

  /// No description provided for @thuShort.
  ///
  /// In en, this message translates to:
  /// **'THU'**
  String get thuShort;

  /// No description provided for @friShort.
  ///
  /// In en, this message translates to:
  /// **'FRI'**
  String get friShort;

  /// No description provided for @satShort.
  ///
  /// In en, this message translates to:
  /// **'SAT'**
  String get satShort;

  /// No description provided for @sunShort.
  ///
  /// In en, this message translates to:
  /// **'SUN'**
  String get sunShort;

  /// No description provided for @dailyExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Exercise'**
  String get dailyExerciseTitle;

  /// No description provided for @activityCaloriesLabel.
  ///
  /// In en, this message translates to:
  /// **'Activity calories'**
  String get activityCaloriesLabel;

  /// No description provided for @activityHoursLabel.
  ///
  /// In en, this message translates to:
  /// **'Activity hours'**
  String get activityHoursLabel;

  /// No description provided for @hoursSuffix.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get hoursSuffix;

  /// No description provided for @waterIntakeLabel.
  ///
  /// In en, this message translates to:
  /// **'Water Intake'**
  String get waterIntakeLabel;

  /// No description provided for @stepsLabel.
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get stepsLabel;

  /// No description provided for @waterIntake.
  ///
  /// In en, this message translates to:
  /// **'Water Intake'**
  String get waterIntake;

  /// No description provided for @loginEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Email/ID'**
  String get loginEmailHint;

  /// No description provided for @loginPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPassword;

  /// No description provided for @loginForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'FORGOT PASSWORD?'**
  String get loginForgotPassword;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'LOG IN'**
  String get loginButton;

  /// No description provided for @loginNoAccountText.
  ///
  /// In en, this message translates to:
  /// **'No Account?'**
  String get loginNoAccountText;

  /// No description provided for @loginSignUp.
  ///
  /// In en, this message translates to:
  /// **'SIGN UP'**
  String get loginSignUp;

  /// No description provided for @loginMissingFieldsMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter both email and password'**
  String get loginMissingFieldsMessage;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordTitle;

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get signUpTitle;

  /// No description provided for @commonEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Email/ID'**
  String get commonEmailHint;

  /// No description provided for @commonPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get commonPasswordHint;

  /// No description provided for @resetButton.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetButton;

  /// No description provided for @signUpButton.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpButton;

  /// No description provided for @commonMissingFieldsAlert.
  ///
  /// In en, this message translates to:
  /// **'Please enter both email and password'**
  String get commonMissingFieldsAlert;

  /// No description provided for @faqTitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get faqTitle;

  /// No description provided for @resetPasswordQ.
  ///
  /// In en, this message translates to:
  /// **'How do I reset my password?'**
  String get resetPasswordQ;

  /// No description provided for @resetPasswordA.
  ///
  /// In en, this message translates to:
  /// **'On the login page, tap \'Forgot Password\' and follow the on-screen instructions to reset it.'**
  String get resetPasswordA;

  /// No description provided for @changeLanguageQ.
  ///
  /// In en, this message translates to:
  /// **'How to change language?'**
  String get changeLanguageQ;

  /// No description provided for @changeLanguageA.
  ///
  /// In en, this message translates to:
  /// **'Go to Profile > Language Settings > choose your preferred language(English or Chinese). Current we only support English and Chinese languages.'**
  String get changeLanguageA;

  /// No description provided for @earnMedalsQ.
  ///
  /// In en, this message translates to:
  /// **'How can I earn Medals?'**
  String get earnMedalsQ;

  /// No description provided for @earnMedalsA.
  ///
  /// In en, this message translates to:
  /// **'Stay active and hydrated every day! Your progress will be tracked and rewarded with medals as you improve.'**
  String get earnMedalsA;

  /// No description provided for @getPetsQ.
  ///
  /// In en, this message translates to:
  /// **'How do I get pets?'**
  String get getPetsQ;

  /// No description provided for @getPetsA.
  ///
  /// In en, this message translates to:
  /// **'You’ll earn stars after each workout. Use these stars to purchase pets from the Pet House.'**
  String get getPetsA;

  /// No description provided for @changePhotoQ.
  ///
  /// In en, this message translates to:
  /// **'How to change profile photo?'**
  String get changePhotoQ;

  /// No description provided for @changePhotoA.
  ///
  /// In en, this message translates to:
  /// **'Go to Profile > Edit Profile > Tap on profile photo, you can choose your profile from gallery or take a new profile photo.'**
  String get changePhotoA;

  /// No description provided for @contactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupport;

  /// No description provided for @emailUs.
  ///
  /// In en, this message translates to:
  /// **'Email Us'**
  String get emailUs;

  /// No description provided for @callUs.
  ///
  /// In en, this message translates to:
  /// **'Call Us'**
  String get callUs;

  /// No description provided for @medals.
  ///
  /// In en, this message translates to:
  /// **'Medals'**
  String get medals;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @oldPassword.
  ///
  /// In en, this message translates to:
  /// **'Old Password'**
  String get oldPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @passwordResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password updated successfully.'**
  String get passwordResetSuccess;

  /// No description provided for @passwordResetFail.
  ///
  /// In en, this message translates to:
  /// **'Failed to update password.'**
  String get passwordResetFail;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get fieldRequired;

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get passwordMismatch;

  /// No description provided for @confirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get confirmed;

  /// No description provided for @resetPrompt.
  ///
  /// In en, this message translates to:
  /// **'Enter your email/ID and we will send you a password reset link.'**
  String get resetPrompt;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @frequentlyAsked.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get frequentlyAsked;

  /// Displays the current year and month in English order
  ///
  /// In en, this message translates to:
  /// **'{year}/{month}'**
  String yearMonthLabel(Object year, Object month);

  /// No description provided for @petBobaDesc.
  ///
  /// In en, this message translates to:
  /// **'Stay chill, bro'**
  String get petBobaDesc;

  /// No description provided for @petEbiDesc.
  ///
  /// In en, this message translates to:
  /// **'Never mention sashimi in front of him'**
  String get petEbiDesc;

  /// No description provided for @petDjDesc.
  ///
  /// In en, this message translates to:
  /// **'Maybe he is also an idol?'**
  String get petDjDesc;

  /// No description provided for @petNewHumanDesc.
  ///
  /// In en, this message translates to:
  /// **'Definitely doing good on rhythm games'**
  String get petNewHumanDesc;

  /// No description provided for @petRorrrrrrDesc.
  ///
  /// In en, this message translates to:
  /// **'Enjoy death metal!'**
  String get petRorrrrrrDesc;

  /// No description provided for @petMsBeckyDesc.
  ///
  /// In en, this message translates to:
  /// **'Melt into the night'**
  String get petMsBeckyDesc;

  /// No description provided for @petGuiDesc.
  ///
  /// In en, this message translates to:
  /// **'Solid as a rock'**
  String get petGuiDesc;

  /// No description provided for @petBananaDesc.
  ///
  /// In en, this message translates to:
  /// **'Bro really think bro is a banana'**
  String get petBananaDesc;

  /// No description provided for @petNaruhodoDesc.
  ///
  /// In en, this message translates to:
  /// **'Objection!'**
  String get petNaruhodoDesc;

  /// No description provided for @petGodfatherDesc.
  ///
  /// In en, this message translates to:
  /// **'You never even think to call me Godfather'**
  String get petGodfatherDesc;

  /// No description provided for @pointNeeded.
  ///
  /// In en, this message translates to:
  /// **'Point needed'**
  String get pointNeeded;

  /// No description provided for @purchase.
  ///
  /// In en, this message translates to:
  /// **'Purchase'**
  String get purchase;

  /// No description provided for @notEnoughPoints.
  ///
  /// In en, this message translates to:
  /// **'Not enough points'**
  String get notEnoughPoints;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
