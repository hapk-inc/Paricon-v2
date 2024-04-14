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
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'firebase/firebase_option.dart';

import 'firebase/bloc.dart';
import 'logic/app/ai_bloc.dart';
import 'logic/app/device_provider.dart';
import 'my_app.dart';
import 'values/strings.dart';

Logger _log = Logger();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final PackageInfo info = await PackageInfo.fromPlatform();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  bool isEmulator = true;

  bool androidWeb = false;

  bool isModelPhone = true;

  if (!kIsWeb) {
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      isEmulator = !androidInfo.isPhysicalDevice;
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;

      _log.d("${iosInfo.data}");

      isModelPhone = iosInfo.model == iphone;
      isEmulator = !iosInfo.isPhysicalDevice;
    } else if (Platform.isMacOS) {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      _log.d("${packageInfo.data}");
    }
  } else {
    WebBrowserInfo webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
    _log.d('Running on ${webBrowserInfo.appVersion}');
    androidWeb = (webBrowserInfo.appVersion ?? "").contains('Android');
    _log.d('AndroidWeb $androidWeb');
  }

  final GenerativeModel model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: DefaultFirebaseOptions.geminiKey,
  );

  final FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(info.appName),
  );

  final FirebaseAuth firebaseAuth = FirebaseAuth.instanceFor(app: app);
  final FirebaseFirestore fireStore = FirebaseFirestore.instanceFor(app: app);
  //FirebaseFirestore.setLoggingEnabled(true);
  final FirebaseDatabase database = FirebaseDatabase.instanceFor(app: app);
  //database.setPersistenceEnabled(enabled)

  final FirebaseAnalytics analytics = FirebaseAnalytics.instanceFor(app: app);

  final FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;

  final FirebaseRemoteConfig remoteConfig =
      FirebaseRemoteConfig.instanceFor(app: app);

  await remoteConfig.setDefaults(remoteConfigDefaults);

  final RemoteConfigSettings remoteConfigSetting = RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 45),
    minimumFetchInterval: const Duration(seconds: 3),
  );

  await remoteConfig.setConfigSettings(remoteConfigSetting);

  final bool devicePreviewEnabled = kIsWeb
      ? kDebugMode
      : Platform.isAndroid
          ? false
          : Platform.isMacOS
              ? true
              : !isModelPhone;

  //const fatalError = true;
  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    _log.e(errorDetails.exception, stackTrace: errorDetails.stack);
    if (!kIsWeb) {
      _log.e("MainError",
          error: errorDetails.exception, stackTrace: errorDetails.stack);
      crashlytics.recordFlutterFatalError(errorDetails);
    }
  };

  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    _log.e(error, stackTrace: stack);
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
    isEmulatorProvider.overrideWithValue(isEmulator),
    geminiModelProvider.overrideWithValue(model),
    if (kIsWeb) androidWebProvider.overrideWithValue(androidWeb),
  ];

  runApp(
    DevicePreview(
      data: const DevicePreviewData(isFrameVisible: false),
      isToolbarVisible: kDebugMode,
      enabled: devicePreviewEnabled,
      builder: (_) => ProviderScope(overrides: overrides, child: const MyApp()),
    ),
  );
}
