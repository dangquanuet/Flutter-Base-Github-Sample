import 'package:app/data/local/app_pref.dart';
import 'package:app/data/model/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final prefsProvider = Provider<PrefHelper>(
  (ref) => AppPrefs(),
);

abstract class PrefHelper {
  Future<bool> firstRun();

  Future<void> setFirstRun(bool isFirstRun);

  Future<String?> getToken();

  Future setToken(String token);

  Future saveUser(User user);

  Future<User?> getUserSaved();

  Future<String> setFirebaseToken(String firebaseToken);

  Future<String> setCurrentLocale(String currentLocale);

  Future<String?> getCurrentLocale();
}
