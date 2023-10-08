import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info_plus/package_info_plus.dart';

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

/*
final analyticsProvider =
    Provider<FirebaseAnalytics>((_) => throw UnimplementedError());
*/

/*final storageProvider = Provider<FirebaseStorage>(
  (ref) {
    final app = ref.read(firebaseAppProvider);
    return FirebaseStorage.instanceFor(app: app);
  },
);*/

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

final AutoDisposeFutureProvider<PackageInfo> packageInfoProvider =
    FutureProvider.autoDispose<PackageInfo>(
  (_) => PackageInfo.fromPlatform(),
);

final AutoDisposeFutureProvider<AppUpdateInfo> inAppUpdateProvider =
    FutureProvider.autoDispose<AppUpdateInfo>(
  (_) async => InAppUpdate.checkForUpdate(),
);

final StreamProvider<ConnectivityResult> internetConnectionProvider =
    StreamProvider((_) => Connectivity().onConnectivityChanged);

final FutureProvider<ConnectivityResult> checkNetProvider =
    FutureProvider((_) => Connectivity().checkConnectivity());

final FutureProvider<bool> ensureInitialisedProvider = FutureProvider<bool>(
  (ref) {
    final rConfig = ref.read(remoteConfigProvider);
    return rConfig.fetchAndActivate();
  },
);
