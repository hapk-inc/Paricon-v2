import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rxdart/rxdart.dart';

final firebaseAppProvider = Provider<FirebaseApp>(
  (_) => throw UnimplementedError(),
);

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (_) => throw UnimplementedError(),
);

final databaseProvider = Provider<FirebaseDatabase>(
  (_) => throw UnimplementedError(),
);

final analyticsProvider =
    Provider<FirebaseAnalytics>((_) => throw UnimplementedError());

final remoteConfigProvider =
    Provider<FirebaseRemoteConfig>((ref) => throw UnimplementedError());

final crashlyticsProvider =
    Provider<FirebaseCrashlytics>((ref) => throw UnimplementedError());

final StreamProvider<ConnectivityResult> internetConnectionProvider =
    StreamProvider(
  (_) {
    BehaviorSubject<ConnectivityResult>? subject;
    subject = BehaviorSubject(
      onListen: () => Connectivity().onConnectivityChanged.listen(
        (event) {
          if (subject == null) {
            subject!.add(event);
          } else {
            if (subject.hasValue) {
              if (subject.value != event) {
                subject.add(event);
              }
            } else {
              subject.add(event);
            }
          }
        },
      ),
    );
    return subject.stream;
  },
);

final Provider<FirebaseFirestore> fireStoreProvider =
    Provider<FirebaseFirestore>(
  (_) => throw UnimplementedError(),
);

final debugAndAppNameProvider = FutureProvider<bool>(
  (ref) async {
    final package = await ref.read(packageInfoProvider.future);

    return package.appName.contains("Dev") || kDebugMode;
  },
);

final deviceInfoProvider = Provider<DeviceInfoPlugin>(
  (_) => DeviceInfoPlugin(),
);

final FutureProvider<bool> isPhysicalDeviceProvider = FutureProvider<bool>(
  (ref) async {
    final deviceInfo = ref.read(deviceInfoProvider);
    if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;
      return iosInfo.isPhysicalDevice;
    } else if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      debugPrint("89--${androidInfo.isPhysicalDevice}");
      return androidInfo.isPhysicalDevice;
    }
    return false;
  },
);

final AutoDisposeFutureProvider<PackageInfo> packageInfoProvider =
    FutureProvider.autoDispose<PackageInfo>(
  (_) => PackageInfo.fromPlatform(),
);

final AutoDisposeFutureProvider<AppUpdateInfo> inAppUpdateProvider =
    FutureProvider.autoDispose<AppUpdateInfo>(
  (_) async => InAppUpdate.checkForUpdate(),
);

/*final StreamProvider<ConnectivityResult> internetConnectionProvider =
    StreamProvider(
  (_) => Connectivity().onConnectivityChanged,
);*/

final FutureProvider<ConnectivityResult> checkNetProvider = FutureProvider(
  (_) => Connectivity().checkConnectivity(),
);
