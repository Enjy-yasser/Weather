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

  /// `Weather Application`
  String get weatherApplication {
    return Intl.message(
      'Weather Application',
      name: 'weatherApplication',
      desc: '',
      args: [],
    );
  }

  /// `Weather Forecast`
  String get weatherForecast {
    return Intl.message(
      'Weather Forecast',
      name: 'weatherForecast',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Email Controller`
  String get emailController {
    return Intl.message(
      'Email Controller',
      name: 'emailController',
      desc: '',
      args: [],
    );
  }

  /// `Password Controller`
  String get passwordController {
    return Intl.message(
      'Password Controller',
      name: 'passwordController',
      desc: '',
      args: [],
    );
  }

  /// `Username Controller`
  String get usernameController {
    return Intl.message(
      'Username Controller',
      name: 'usernameController',
      desc: '',
      args: [],
    );
  }

  /// `Already have account`
  String get haveAccount {
    return Intl.message(
      'Already have account',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `error`
  String get error {
    return Intl.message(
      'error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `No data available `
  String get noDataAvailable {
    return Intl.message(
      'No data available ',
      name: 'noDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Storage Permission`
  String get storagePermission {
    return Intl.message(
      'Storage Permission',
      name: 'storagePermission',
      desc: '',
      args: [],
    );
  }

  /// `Request Permission`
  String get requestPermissions {
    return Intl.message(
      'Request Permission',
      name: 'requestPermissions',
      desc: '',
      args: [],
    );
  }

  /// `Submit Data`
  String get submitData {
    return Intl.message(
      'Submit Data',
      name: 'submitData',
      desc: '',
      args: [],
    );
  }

  /// `homepage`
  String get homePage {
    return Intl.message(
      'homepage',
      name: 'homePage',
      desc: '',
      args: [],
    );
  }

  /// `Search page`
  String get searchPage {
    return Intl.message(
      'Search page',
      name: 'searchPage',
      desc: '',
      args: [],
    );
  }

  /// `Get current location`
  String get getCurrentLocation {
    return Intl.message(
      'Get current location',
      name: 'getCurrentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Download Weather Info`
  String get downloadWeatherInfo {
    return Intl.message(
      'Download Weather Info',
      name: 'downloadWeatherInfo',
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
