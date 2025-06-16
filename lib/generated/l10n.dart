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

class AppLocale {
  AppLocale();

  static AppLocale? _current;

  static AppLocale get current {
    assert(
      _current != null,
      'No instance of AppLocale was loaded. Try to initialize the AppLocale delegate before accessing AppLocale.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocale> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocale();
      AppLocale._current = instance;

      return instance;
    });
  }

  static AppLocale of(BuildContext context) {
    final instance = AppLocale.maybeOf(context);
    assert(
      instance != null,
      'No instance of AppLocale present in the widget tree. Did you add AppLocale.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static AppLocale? maybeOf(BuildContext context) {
    return Localizations.of<AppLocale>(context, AppLocale);
  }

  /// `My tasks`
  String get my_tasks {
    return Intl.message('My tasks', name: 'my_tasks', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `New`
  String get create_new {
    return Intl.message('New', name: 'create_new', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `What to do…`
  String get what_to_do {
    return Intl.message('What to do…', name: 'what_to_do', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocale> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocale> load(Locale locale) => AppLocale.load(locale);
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
