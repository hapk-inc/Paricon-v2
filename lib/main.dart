import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'firebase_option.dart';
import 'logic/firebase_init.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final PackageInfo info = await PackageInfo.fromPlatform();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  final FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(info.appName),
  );

  final FirebaseAuth firebaseAuth = FirebaseAuth.instanceFor(app: app);
  final FirebaseFirestore fireStore = FirebaseFirestore.instanceFor(app: app);
  //FirebaseFirestore.setLoggingEnabled(true);
  final FirebaseDatabase database = FirebaseDatabase.instanceFor(app: app);

  final FirebaseAnalytics firebaseAnalytics =
      FirebaseAnalytics.instanceFor(app: app);

  final FirebaseCrashlytics firebaseCrashlytics = FirebaseCrashlytics.instance;

  final FirebaseRemoteConfig remoteConfig =
      FirebaseRemoteConfig.instanceFor(app: app);
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(seconds: 10),
    ),
  );

  final Connectivity connectivity = Connectivity();
  final iNet = await connectivity.checkConnectivity();

  if (iNet != ConnectivityResult.none) {
    debugPrint("Initialising Remote Config for connectivity $iNet");
    await remoteConfig.fetchAndActivate();
  }

  //const fatalError = true;
  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    if (!kIsWeb) {
      debugPrintStack(stackTrace: errorDetails.stack);
      firebaseCrashlytics.recordFlutterFatalError(errorDetails);
    }
  };

  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    firebaseCrashlytics.recordError(error, stack, fatal: true);
    return true;
  };

  if (!kIsWeb) {
    await firebaseCrashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);
  }

  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (BuildContext context) => ProviderScope(
        overrides: [
          firebaseAppProvider.overrideWithValue(app),
          firebaseAuthProvider.overrideWithValue(firebaseAuth),
          analyticsProvider.overrideWithValue(firebaseAnalytics),
          fireStoreProvider.overrideWithValue(fireStore),
          databaseProvider.overrideWithValue(database),
          remoteConfigProvider.overrideWithValue(remoteConfig),
          crashlyticsProvider.overrideWithValue(firebaseCrashlytics),
          checkNetProvider.overrideWith((_) async => iNet)
        ],
        child: const MyApp(),
      ),
    ),
  );
}
