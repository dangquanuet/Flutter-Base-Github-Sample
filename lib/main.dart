import 'dart:async';

import 'package:app/app.dart';
import 'package:app/foundation/app_config.dart';
import 'package:app/foundation/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // debugPaintBaselinesEnabled = true;
  // debugPaintSizeEnabled = true;
  // debugPaintLayerBordersEnabled = true;

  // Firebase
  await Firebase.initializeApp();

  // Crashlytics
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  Function originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) async {
    await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    originalOnError(errorDetails);
  };

  // Remote config
  /*await RemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: Duration.zero,
  ));
  RemoteConfigValue(null, ValueSource.valueStatic);*/

  // Init and get SharedPreferences instance
  // final sharedPreferences = await SharedPreferences.getInstance();

  // Get flavor
  AppConfig.flavorEnvironment =
      await Constants.platformChannel.invokeMethod(Constants.getFlavor);
  debugPrint('STARTED WITH FLAVOR ${AppConfig.flavorEnvironment}');

  if (kReleaseMode) {
    debugPrint = (message, {wrapWidth}) {};
  }

  runZonedGuarded(() {
    runApp(
      const ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: App(),
        ),
      ),
    );
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
