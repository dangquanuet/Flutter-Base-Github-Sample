import 'dart:io';

import 'package:app/data/local/pref_helper.dart';
import 'package:app/foundation/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final languageViewModelProvider =
    ChangeNotifierProvider((ref) => LanguageViewModel(ref));

class LanguageViewModel extends ChangeNotifier {
  LanguageViewModel(this._ref);

  final Ref _ref;

  // Change Locale
  Locale? _currentLocale;

  Locale? get currentLocale => _currentLocale;

  late final _prefs = _ref.read(prefsProvider);

  getSavedLocale() async {
    _currentLocale =
        Locale(await _prefs.getCurrentLocale() ?? getLanguageInFirstTime());
    notifyListeners();
  }

  changeLocale(Locale locale) {
    _prefs.setCurrentLocale(locale.languageCode);
    _currentLocale = locale;
    notifyListeners();
  }

  String getLanguageInFirstTime() {
    String currentLocale = Platform.localeName.substring(0, 2);
    if (Constants.supportedLanguages.containsKey(currentLocale)) {
      _prefs.setCurrentLocale(currentLocale);
      return currentLocale;
    } else {
      _prefs.setCurrentLocale("en");
      return "en";
    }
  }
}
