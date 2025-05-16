// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Camera is not active`
  String get cameraIsNotActive {
    return Intl.message(
      'Camera is not active',
      name: 'cameraIsNotActive',
      desc: '',
      args: [],
    );
  }

  /// `Clear Sentence`
  String get clearSentence {
    return Intl.message(
      'Clear Sentence',
      name: 'clearSentence',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Discovered sentence will appear here...`
  String get discoveredSentenceWillAppearHere {
    return Intl.message(
      'Discovered sentence will appear here...',
      name: 'discoveredSentenceWillAppearHere',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `enter valide ema9il`
  String get enterValideEma9il {
    return Intl.message(
      'enter valide ema9il',
      name: 'enterValideEma9il',
      desc: '',
      args: [],
    );
  }

  /// `enter your email`
  String get enterYourEmail {
    return Intl.message(
      'enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// ` Enter Your Name`
  String get enterYourName {
    return Intl.message(
      ' Enter Your Name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get enterYourPassword {
    return Intl.message(
      'Enter Your Password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `I Accept terms of use & privacy policy`
  String get iAcceptTermsOfUsePrivacyPolicy {
    return Intl.message(
      'I Accept terms of use & privacy policy',
      name: 'iAcceptTermsOfUsePrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message('Languages', name: 'languages', desc: '', args: []);
  }

  /// `Learn`
  String get learn {
    return Intl.message('Learn', name: 'learn', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `please enter latest char 8`
  String get pleaseEnterLatestChar8 {
    return Intl.message(
      'please enter latest char 8',
      name: 'pleaseEnterLatestChar8',
      desc: '',
      args: [],
    );
  }

  /// `please enter valide email`
  String get pleaseEnterValideEmail {
    return Intl.message(
      'please enter valide email',
      name: 'pleaseEnterValideEmail',
      desc: '',
      args: [],
    );
  }

  /// `please enter your email`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'please enter your email',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Name`
  String get pleaseEnterYourName {
    return Intl.message(
      'Please Enter Your Name',
      name: 'pleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `please enter your password`
  String get pleaseEnterYourPassword {
    return Intl.message(
      'please enter your password',
      name: 'pleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Read Aloud`
  String get readAloud {
    return Intl.message('Read Aloud', name: 'readAloud', desc: '', args: []);
  }

  /// `Send Reset Link`
  String get sendResetLink {
    return Intl.message(
      'Send Reset Link',
      name: 'sendResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Sentence cleared.`
  String get sentenceCleared {
    return Intl.message(
      'Sentence cleared.',
      name: 'sentenceCleared',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get service {
    return Intl.message('Service', name: 'service', desc: '', args: []);
  }

  /// `Share Discovered Sentence:{answer}`
  String shareDiscoveredSentencenanswer(Object answer) {
    return Intl.message(
      'Share Discovered Sentence:$answer',
      name: 'shareDiscoveredSentencenanswer',
      desc: '',
      args: [answer],
    );
  }

  /// `Share Sentence`
  String get shareSentence {
    return Intl.message(
      'Share Sentence',
      name: 'shareSentence',
      desc: '',
      args: [],
    );
  }

  /// `Share with your friends`
  String get shareWithYourFriends {
    return Intl.message(
      'Share with your friends',
      name: 'shareWithYourFriends',
      desc: '',
      args: [],
    );
  }

  /// `Sign Language Translator`
  String get signLanguageTranslator {
    return Intl.message(
      'Sign Language Translator',
      name: 'signLanguageTranslator',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `SignUp`
  String get signup {
    return Intl.message('SignUp', name: 'signup', desc: '', args: []);
  }

  /// `Start Camera`
  String get startCamera {
    return Intl.message(
      'Start Camera',
      name: 'startCamera',
      desc: '',
      args: [],
    );
  }

  /// `Start translating sign language using camera`
  String get startTranslatingSignLanguageUsingCamera {
    return Intl.message(
      'Start translating sign language using camera',
      name: 'startTranslatingSignLanguageUsingCamera',
      desc: '',
      args: [],
    );
  }

  /// `Stop Camera`
  String get stopCamera {
    return Intl.message('Stop Camera', name: 'stopCamera', desc: '', args: []);
  }

  /// `Switch Camera`
  String get switchCamera {
    return Intl.message(
      'Switch Camera',
      name: 'switchCamera',
      desc: '',
      args: [],
    );
  }

  /// `Toggle Theme`
  String get toggleTheme {
    return Intl.message(
      'Toggle Theme',
      name: 'toggleTheme',
      desc: '',
      args: [],
    );
  }

  /// `Your email`
  String get yourEmail {
    return Intl.message('Your email', name: 'yourEmail', desc: '', args: []);
  }

  /// `Your password`
  String get yourPassword {
    return Intl.message(
      'Your password',
      name: 'yourPassword',
      desc: '',
      args: [],
    );
  }

  /// `There's no sentence to share.`
  String get theresNoSentenceToShare {
    return Intl.message(
      'There\'s no sentence to share.',
      name: 'theresNoSentenceToShare',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Camera stopped.`
  String get cameraStopped {
    return Intl.message(
      'Camera stopped.',
      name: 'cameraStopped',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `This will only stop the camera preview.`
  String get thisWillOnlyStopTheCameraPreview {
    return Intl.message(
      'This will only stop the camera preview.',
      name: 'thisWillOnlyStopTheCameraPreview',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Raise one hand.\nStraight the second finger and close the others.\nPoint to yourself using it.`
  String get raiseOneHandnstraightTheSecondFingerAndCloseTheOthersnpoint {
    return Intl.message(
      'Raise one hand.\\nStraight the second finger and close the others.\\nPoint to yourself using it.',
      name: 'raiseOneHandnstraightTheSecondFingerAndCloseTheOthersnpoint',
      desc: '',
      args: [],
    );
  }

  /// `Sign Language Guide`
  String get signLanguageGuide {
    return Intl.message(
      'Sign Language Guide',
      name: 'signLanguageGuide',
      desc: '',
      args: [],
    );
  }

  /// `Tap thumb on forehead.`
  String get tapThumbOnForehead {
    return Intl.message(
      'Tap thumb on forehead.',
      name: 'tapThumbOnForehead',
      desc: '',
      args: [],
    );
  }

  /// `Tap thumb on chin.`
  String get tapThumbOnChin {
    return Intl.message(
      'Tap thumb on chin.',
      name: 'tapThumbOnChin',
      desc: '',
      args: [],
    );
  }

  /// `Combine signs for 'boy' and 'baby'.`
  String get combineSignsForBoyAndBaby {
    return Intl.message(
      'Combine signs for \'boy\' and \'baby\'.',
      name: 'combineSignsForBoyAndBaby',
      desc: '',
      args: [],
    );
  }

  /// `Combine signs for 'girl' and 'baby'.`
  String get combineSignsForGirlAndBaby {
    return Intl.message(
      'Combine signs for \'girl\' and \'baby\'.',
      name: 'combineSignsForGirlAndBaby',
      desc: '',
      args: [],
    );
  }

  /// `Mimic rocking a baby.`
  String get mimicRockingABaby {
    return Intl.message(
      'Mimic rocking a baby.',
      name: 'mimicRockingABaby',
      desc: '',
      args: [],
    );
  }

  /// `Our Service`
  String get ourService {
    return Intl.message('Our Service', name: 'ourService', desc: '', args: []);
  }

  /// `Text Into Video`
  String get textIntoVideo {
    return Intl.message(
      'Text Into Video',
      name: 'textIntoVideo',
      desc: '',
      args: [],
    );
  }

  /// `convert any text into video sign language`
  String get convertAnyTextIntoVideoSignLanguage {
    return Intl.message(
      'convert any text into video sign language',
      name: 'convertAnyTextIntoVideoSignLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Learn Sign Language`
  String get learnSignLanguage {
    return Intl.message(
      'Learn Sign Language',
      name: 'learnSignLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Learn how to talk sign language`
  String get learnHowToTalkSignLanguage {
    return Intl.message(
      'Learn how to talk sign language',
      name: 'learnHowToTalkSignLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Translate Sign Language`
  String get translateSignLanguage {
    return Intl.message(
      'Translate Sign Language',
      name: 'translateSignLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Translate sign language by video or image`
  String get translateSignLanguageByVideoOrImage {
    return Intl.message(
      'Translate sign language by video or image',
      name: 'translateSignLanguageByVideoOrImage',
      desc: '',
      args: [],
    );
  }

  /// `Trans Sign Language`
  String get transSignLanguage {
    return Intl.message(
      'Trans Sign Language',
      name: 'transSignLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Pick a Video`
  String get pickAVideo {
    return Intl.message('Pick a Video', name: 'pickAVideo', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
