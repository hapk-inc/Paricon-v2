import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<FirebaseApp> firebaseAppProvider = Provider<FirebaseApp>(
  (_) => throw UnimplementedError(),
);

final Provider<FirebaseAuth> firebaseAuthProvider = Provider<FirebaseAuth>(
  (_) => throw UnimplementedError(),
);

final Provider<FirebaseFirestore> fireStoreProvider =
    Provider<FirebaseFirestore>(
  (_) => throw UnimplementedError(),
);

final Provider<FirebaseDatabase> databaseProvider = Provider<FirebaseDatabase>(
  (_) => throw UnimplementedError(),
);

final Provider<FirebaseAnalytics> analyticsProvider =
    Provider<FirebaseAnalytics>((_) => throw UnimplementedError());

final Provider<FirebaseRemoteConfig> remoteConfigProvider =
    Provider<FirebaseRemoteConfig>((ref) => throw UnimplementedError());

final Provider<FirebaseCrashlytics> crashlyticsProvider =
    Provider<FirebaseCrashlytics>((ref) => throw UnimplementedError());
