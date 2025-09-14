import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pt.dart';

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
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('pt')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'SPYGAM'**
  String get appTitle;

  /// Welcome message
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// Title for login screen
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// Title for register screen
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerTitle;

  /// Button text for guest mode
  ///
  /// In en, this message translates to:
  /// **'Play as Guest'**
  String get playAsGuest;

  /// Email input label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Password input label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Register button text
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Profile screen title
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Game screen title
  ///
  /// In en, this message translates to:
  /// **'Game'**
  String get game;

  /// Native language selection label
  ///
  /// In en, this message translates to:
  /// **'Native Language'**
  String get nativeLanguage;

  /// Learning language selection label
  ///
  /// In en, this message translates to:
  /// **'Learning Language'**
  String get learningLanguage;

  /// Current level label
  ///
  /// In en, this message translates to:
  /// **'Current Level'**
  String get currentLevel;

  /// Progress label
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// Rankings section title
  ///
  /// In en, this message translates to:
  /// **'Rankings'**
  String get rankings;

  /// Coming soon message
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get comingSoon;

  /// Total points label
  ///
  /// In en, this message translates to:
  /// **'Total Points'**
  String get totalPoints;

  /// Correct words counter
  ///
  /// In en, this message translates to:
  /// **'Correct Words'**
  String get correctWords;

  /// Failed words counter
  ///
  /// In en, this message translates to:
  /// **'Failed Words'**
  String get failedWords;

  /// Placeholder text for word guess input
  ///
  /// In en, this message translates to:
  /// **'Enter your guess'**
  String get enterYourGuess;

  /// Submit button text
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// Attempts counter
  ///
  /// In en, this message translates to:
  /// **'Attempts'**
  String get attempts;

  /// Points label
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get points;

  /// Time label
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// Temperature clue: very cold
  ///
  /// In en, this message translates to:
  /// **'Very Cold'**
  String get veryCold;

  /// Temperature clue: cold
  ///
  /// In en, this message translates to:
  /// **'Cold'**
  String get cold;

  /// Temperature clue: warm
  ///
  /// In en, this message translates to:
  /// **'Warm'**
  String get warm;

  /// Temperature clue: hot
  ///
  /// In en, this message translates to:
  /// **'Hot'**
  String get hot;

  /// Temperature clue: burning
  ///
  /// In en, this message translates to:
  /// **'Burning'**
  String get burning;

  /// Indicates a hint was used
  ///
  /// In en, this message translates to:
  /// **'Hint Used'**
  String get hintUsed;

  /// Apprentice game mode
  ///
  /// In en, this message translates to:
  /// **'Apprentice Mode'**
  String get apprenticeMode;

  /// Quick rounds game mode
  ///
  /// In en, this message translates to:
  /// **'Quick Rounds'**
  String get quickRounds;

  /// Vs friends game mode
  ///
  /// In en, this message translates to:
  /// **'Vs Friends'**
  String get vsFriends;

  /// Game over message
  ///
  /// In en, this message translates to:
  /// **'Game Over'**
  String get gameOver;

  /// Shows the correct answer after game over
  ///
  /// In en, this message translates to:
  /// **'The correct answer was:'**
  String get correctAnswer;

  /// End round button
  ///
  /// In en, this message translates to:
  /// **'End Round'**
  String get endRound;

  /// Play hangman button
  ///
  /// In en, this message translates to:
  /// **'Play Hangman'**
  String get playHangman;

  /// Error message for invalid word
  ///
  /// In en, this message translates to:
  /// **'Word not valid'**
  String get wordNotValid;

  /// Congratulations message
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congratulations;

  /// Next round button
  ///
  /// In en, this message translates to:
  /// **'Next Round'**
  String get nextRound;

  /// Level label
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// Temperature clue label
  ///
  /// In en, this message translates to:
  /// **'Temperature'**
  String get temperature;

  /// Spanish language
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish;

  /// English language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Italian language
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get italian;

  /// French language
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// German language
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get german;

  /// Portuguese language
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get portuguese;

  /// A1 level description
  ///
  /// In en, this message translates to:
  /// **'Beginner (A1)'**
  String get levelA1;

  /// A2 level description
  ///
  /// In en, this message translates to:
  /// **'Elementary (A2)'**
  String get levelA2;

  /// B1 level description
  ///
  /// In en, this message translates to:
  /// **'Intermediate (B1)'**
  String get levelB1;

  /// B2 level description
  ///
  /// In en, this message translates to:
  /// **'Upper Intermediate (B2)'**
  String get levelB2;

  /// C1 level description
  ///
  /// In en, this message translates to:
  /// **'Advanced (C1)'**
  String get levelC1;

  /// C2 level description
  ///
  /// In en, this message translates to:
  /// **'Proficient (C2)'**
  String get levelC2;

  /// Email validation error
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// Email format validation error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get invalidEmail;

  /// Password validation error
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// Password length validation error
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordTooShort;

  /// Login error message
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please check your credentials.'**
  String get loginFailed;

  /// Registration error for existing email
  ///
  /// In en, this message translates to:
  /// **'This email is already registered'**
  String get emailAlreadyExists;

  /// Registration error message
  ///
  /// In en, this message translates to:
  /// **'Registration failed. Please try again.'**
  String get registrationFailed;

  /// Logout button
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fr',
        'it',
        'pt'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
