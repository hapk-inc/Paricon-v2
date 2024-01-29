import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'remote_values.dart';
import 'user_activity_database.dart';

final AutoDisposeFutureProvider<TransactionResult> appOpenedProvider =
    FutureProvider.autoDispose<TransactionResult>(
  (ref) async {
    final userDatabase = ref.read(userDatabaseProvider);
    return userDatabase.appOpened;
  },
);

final AutoDisposeFutureProviderFamily<void, bool> setActiveProvider =
    FutureProvider.autoDispose.family<void, bool>(
  (ref, flag) async {
    final userDatabase = ref.read(userDatabaseProvider);
    return userDatabase.setActive(flag);
  },
);

final AutoDisposeFutureProviderFamily<void, dynamic> setPlayingProvider =
    FutureProvider.autoDispose.family<void, dynamic>(
  (ref, flag) async {
    final userDatabase = ref.read(userDatabaseProvider);
    return userDatabase.setPlaying(flag);
  },
);

final Provider<Query> recentUserProvider = Provider<Query>(
  (ref) {
    final int count = ref.watch(onlinePlayerProvider);

    final userDatabase = ref.read(userDatabaseProvider);
    return userDatabase.recentUser(count);
  },
);
