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

  /// `News`
  String get app_name_news {
    return Intl.message('News', name: 'app_name_news', desc: '', args: []);
  }

  /// `App`
  String get app_name_app {
    return Intl.message('App', name: 'app_name_app', desc: '', args: []);
  }

  /// `ago`
  String get ago {
    return Intl.message('ago', name: 'ago', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Dark Mode`
  String get theme_dark {
    return Intl.message('Dark Mode', name: 'theme_dark', desc: '', args: []);
  }

  /// `Light Mode`
  String get theme_light {
    return Intl.message('Light Mode', name: 'theme_light', desc: '', args: []);
  }

  /// `Select Theme`
  String get select_theme {
    return Intl.message(
      'Select Theme',
      name: 'select_theme',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get select_language {
    return Intl.message(
      'Select Language',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get language_arabic {
    return Intl.message('Arabic', name: 'language_arabic', desc: '', args: []);
  }

  /// `English`
  String get language_english {
    return Intl.message(
      'English',
      name: 'language_english',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get search_news {
    return Intl.message('News', name: 'search_news', desc: '', args: []);
  }

  /// `Search here...`
  String get search_hint {
    return Intl.message(
      'Search here...',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get search_empty {
    return Intl.message(
      'No results found',
      name: 'search_empty',
      desc: '',
      args: [],
    );
  }

  /// `Latest News`
  String get latest_news {
    return Intl.message('Latest News', name: 'latest_news', desc: '', args: []);
  }

  /// `Latest Bookmark`
  String get latest_bookmark {
    return Intl.message(
      'Latest Bookmark',
      name: 'latest_bookmark',
      desc: '',
      args: [],
    );
  }

  /// `Added to bookmark`
  String get bookmark_added {
    return Intl.message(
      'Added to bookmark',
      name: 'bookmark_added',
      desc: '',
      args: [],
    );
  }

  /// `Removed from bookmark`
  String get bookmark_removed {
    return Intl.message(
      'Removed from bookmark',
      name: 'bookmark_removed',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get sa {
    return Intl.message('', name: 'sa', desc: '', args: []);
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
