import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
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
import 'logic/app_check.dart';
import 'logic/firebase_init.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final PackageInfo info = await PackageInfo.fromPlatform();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  bool isEmulator = true;
  //bool isAndroidWeb = true;

  if (!kIsWeb) {
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      isEmulator = !androidInfo.isPhysicalDevice;
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      isEmulator = !iosInfo.isPhysicalDevice;
    }
  } else {
    WebBrowserInfo webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
    debugPrint('Running on ${webBrowserInfo.appVersion}');
    //  isAndroidWeb = (webBrowserInfo.appVersion ?? "").contains("Android");
  }

  final FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(info.appName),
  );

  final FirebaseAuth firebaseAuth = FirebaseAuth.instanceFor(app: app);
  final FirebaseFirestore fireStore = FirebaseFirestore.instanceFor(app: app);
  //FirebaseFirestore.setLoggingEnabled(true);
  final FirebaseDatabase database = FirebaseDatabase.instanceFor(app: app);

  final FirebaseAnalytics analytics = FirebaseAnalytics.instanceFor(app: app);

  final FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;

  final FirebaseRemoteConfig remoteConfig =
      FirebaseRemoteConfig.instanceFor(app: app);

  await remoteConfig.setDefaults(_remoteConfigDefaults);

  final RemoteConfigSettings remoteConfigSetting = RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 45),
    minimumFetchInterval: const Duration(seconds: 3),
  );

  await remoteConfig.setConfigSettings(remoteConfigSetting);

  /*final int isNetConnected = await remoteConfig
      .fetchAndActivate()
      .then((flag) => flag ? 1 : 0)
      .catchError((_, __) => -1);*/

  //final ConnectivityResult iNet =
  //    await Connectivity().onConnectivityChanged.first;

  //remoteConfig.fetchAndActivate();

  //const fatalError = true;
  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    debugPrint(errorDetails.toString());
    if (!kIsWeb) {
      debugPrintStack(stackTrace: errorDetails.stack);
      crashlytics.recordFlutterFatalError(errorDetails);
    }
  };

  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint(error.toString());
    if (!kIsWeb) {
      crashlytics.recordError(error, stack, fatal: true);
    }
    return true;
  };

  if (!kIsWeb) {
    await crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);
  }

  List<Override> overrides = [
    firebaseAppProvider.overrideWithValue(app),
    firebaseAuthProvider.overrideWithValue(firebaseAuth),
    analyticsProvider.overrideWithValue(analytics),
    fireStoreProvider.overrideWithValue(fireStore),
    databaseProvider.overrideWithValue(database),
    remoteConfigProvider.overrideWithValue(remoteConfig),
    crashlyticsProvider.overrideWithValue(crashlytics),
    //checkNetProvider.overrideWith((_) async => iNet),
    isEmulatorProvider.overrideWithValue(isEmulator),
    // if (kIsWeb) isAndroidWebProvider.overrideWithValue(isAndroidWeb)
  ];

  runApp(
    DevicePreview(
      //enabled: !kIsWeb ? (!Platform.isIOS && kDebugMode) : false,
      //enabled: kIsWeb ? true : !kDebugMode,
      enabled: kDebugMode,
      builder: (_) => ProviderScope(overrides: overrides, child: const MyApp()),
    ),
  );
}

const Map<String, dynamic> _remoteConfigDefaults = {
  "showApp": false,
  "inWork": "Screen not Compatible",
  "playOnline": true,
  "enterAvatarCode": false,
  "onlineCount": 9,
};
