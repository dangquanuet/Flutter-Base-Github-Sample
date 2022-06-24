import 'dart:convert';

import 'package:app/data/local/pref_helper.dart';
import 'package:app/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs extends PrefHelper {
  // keys
  final String _firstRunKey = '_firstRunKey';
  final String _tokenKey = '_tokenKey';
  final String _userKey = '_userKey';
  final String _firebaseTokenKey = '_firebaseTokenKey';
  final String _currentLocaleKey = '_currentLocaleKey';

  Future<SharedPreferences> _getPrefs() async {
    return SharedPreferences.getInstance();
  }

  @override
  Future<bool> firstRun() async {
    return (await _getPrefs()).getBool(_firstRunKey) ?? true;
  }

  @override
  Future setFirstRun(bool isFirstRun) async {
    await (await _getPrefs()).setBool(_firstRunKey, isFirstRun);
  }

  @override
  Future<String?> getToken() async {
    return (await _getPrefs()).getString(_tokenKey);
  }

  @override
  Future setToken(String token) async {
    await (await _getPrefs()).setString(_tokenKey, token);
  }

  @override
  Future<User?> getUserSaved() async {
    final userJson = (await _getPrefs()).getString(_userKey);
    if (userJson != null) {
      try {
        return User.fromJson(jsonDecode(userJson));
      } on Exception {
        return null;
      }
    }
    return null;
  }

  @override
  Future saveUser(User user) async {
    (await _getPrefs()).setString(_userKey, user.toJson().toString());
  }

  @override
  Future setFirebaseToken(String firebaseToken) async {
    (await _getPrefs()).setString(_firebaseTokenKey, firebaseToken);
  }

  @override
  Future setCurrentLocale(String currentLocale) async {
    (await _getPrefs()).setString(_currentLocaleKey, currentLocale);
  }

  @override
  Future<String?> getCurrentLocale() async {
    return (await _getPrefs()).getString(_currentLocaleKey);
  }
}
