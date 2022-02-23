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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Astro Tak`
  String get appTitle {
    return Intl.message(
      'Astro Tak',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Wallet Balance`
  String get walletBalance {
    return Intl.message(
      'Wallet Balance',
      name: 'walletBalance',
      desc: '',
      args: [],
    );
  }

  /// `Add Money`
  String get addMoney {
    return Intl.message(
      'Add Money',
      name: 'addMoney',
      desc: '',
      args: [],
    );
  }

  /// `Ask Question`
  String get askQuestion {
    return Intl.message(
      'Ask Question',
      name: 'askQuestion',
      desc: '',
      args: [],
    );
  }

  /// `seek accurate answers to your life problems and get guidance towards the right path. Whether the problem is related to love, self, life, business, money, education or work, our astrologer will do an in depth study of your birth chart to provide personalized responses along with remedies`
  String get askQuestionDesc {
    return Intl.message(
      'seek accurate answers to your life problems and get guidance towards the right path. Whether the problem is related to love, self, life, business, money, education or work, our astrologer will do an in depth study of your birth chart to provide personalized responses along with remedies',
      name: 'askQuestionDesc',
      desc: '',
      args: [],
    );
  }

  /// `Choose Category`
  String get chooseCategory {
    return Intl.message(
      'Choose Category',
      name: 'chooseCategory',
      desc: '',
      args: [],
    );
  }

  /// `Type a question here`
  String get typeQuestionHere {
    return Intl.message(
      'Type a question here',
      name: 'typeQuestionHere',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Talk`
  String get talk {
    return Intl.message(
      'Talk',
      name: 'talk',
      desc: '',
      args: [],
    );
  }

  /// `Ask a Questions`
  String get askQuestions {
    return Intl.message(
      'Ask a Questions',
      name: 'askQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message(
      'Reports',
      name: 'reports',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Ideas what to Ask (Select Any)`
  String get ideasWhatToAsk {
    return Intl.message(
      'Ideas what to Ask (Select Any)',
      name: 'ideasWhatToAsk',
      desc: '',
      args: [],
    );
  }

  /// `Ask Now`
  String get askNow {
    return Intl.message(
      'Ask Now',
      name: 'askNow',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Order History`
  String get orderHistory {
    return Intl.message(
      'Order History',
      name: 'orderHistory',
      desc: '',
      args: [],
    );
  }

  /// `Basic Profile`
  String get basicProfile {
    return Intl.message(
      'Basic Profile',
      name: 'basicProfile',
      desc: '',
      args: [],
    );
  }

  /// `Friends and Family Profile`
  String get friendsFamilyProfile {
    return Intl.message(
      'Friends and Family Profile',
      name: 'friendsFamilyProfile',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `DOB`
  String get dob {
    return Intl.message(
      'DOB',
      name: 'dob',
      desc: '',
      args: [],
    );
  }

  /// `TOB`
  String get tob {
    return Intl.message(
      'TOB',
      name: 'tob',
      desc: '',
      args: [],
    );
  }

  /// `Relation`
  String get relation {
    return Intl.message(
      'Relation',
      name: 'relation',
      desc: '',
      args: [],
    );
  }

  /// `No Family Member`
  String get noFamilyMember {
    return Intl.message(
      'No Family Member',
      name: 'noFamilyMember',
      desc: '',
      args: [],
    );
  }

  /// `+ Add New Profile`
  String get btnTxtAddNewProfile {
    return Intl.message(
      '+ Add New Profile',
      name: 'btnTxtAddNewProfile',
      desc: '',
      args: [],
    );
  }

  /// `Add New Profile`
  String get titleAddNewProfile {
    return Intl.message(
      'Add New Profile',
      name: 'titleAddNewProfile',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid name`
  String get enterValidName {
    return Intl.message(
      'Enter valid name',
      name: 'enterValidName',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Invalid DD`
  String get invalidDD {
    return Intl.message(
      'Invalid DD',
      name: 'invalidDD',
      desc: '',
      args: [],
    );
  }

  /// `Invalid MM`
  String get invalidMM {
    return Intl.message(
      'Invalid MM',
      name: 'invalidMM',
      desc: '',
      args: [],
    );
  }

  /// `Invalid YYYY`
  String get invalidYYY {
    return Intl.message(
      'Invalid YYYY',
      name: 'invalidYYY',
      desc: '',
      args: [],
    );
  }

  /// `Time of Birth`
  String get timeOfBirth {
    return Intl.message(
      'Time of Birth',
      name: 'timeOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Invalid HH`
  String get invalidHH {
    return Intl.message(
      'Invalid HH',
      name: 'invalidHH',
      desc: '',
      args: [],
    );
  }

  /// `AM`
  String get am {
    return Intl.message(
      'AM',
      name: 'am',
      desc: '',
      args: [],
    );
  }

  /// `PM`
  String get pm {
    return Intl.message(
      'PM',
      name: 'pm',
      desc: '',
      args: [],
    );
  }

  /// `Place of Birth`
  String get placeOfBirth {
    return Intl.message(
      'Place of Birth',
      name: 'placeOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Please select a city`
  String get pleaseSelectCity {
    return Intl.message(
      'Please select a city',
      name: 'pleaseSelectCity',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Gender`
  String get invalidGender {
    return Intl.message(
      'Invalid Gender',
      name: 'invalidGender',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Relation`
  String get invalidRelation {
    return Intl.message(
      'Invalid Relation',
      name: 'invalidRelation',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to delete?`
  String get alertTxtDelete {
    return Intl.message(
      'Do you really want to delete?',
      name: 'alertTxtDelete',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
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
