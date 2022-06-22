import 'dart:convert';

import 'package:app/data/local/pref_helper.dart';
import 'package:app/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs extends PrefHelper {
  static const String firstRunKey = 'first_run_key';
  static const String tokenKey = 'token_key';
  static const String userKey = 'user_key';
  static const String firebaseTokenKey = 'firebaseTokenKey';
  static const String currentLocaleKey = 'currentLocaleKey';

  @override
  Future<bool> firstRun() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(firstRunKey) ?? true;
  }

  @override
  Future<void> setFirstRun(bool isFirstRun) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(firstRunKey, isFirstRun);
  }

  @override
  Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(tokenKey);
  }

  @override
  Future setToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(tokenKey, token);
  }

  @override
  Future<User?> getUserSaved() async {
    final preferences = await SharedPreferences.getInstance();
    final userJson = preferences.getString(userKey);
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
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(userKey, user.toJson().toString());
  }

  @override
  Future<String> setFirebaseToken(String firebaseToken) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(firebaseTokenKey, firebaseToken);
    return firebaseToken;
  }

  @override
  Future<String> setCurrentLocale(String currentLocale) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(currentLocaleKey, currentLocale);
    return currentLocale;
  }

  @override
  Future<String?> getCurrentLocale() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(currentLocaleKey);
  }
}
