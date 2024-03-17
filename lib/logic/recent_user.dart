import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'remote_values.dart';
import 'user_activity_database.dart';

final Provider<Query> recentUserProvider = Provider<Query>(
  (ref) {
    final int count = ref.watch(onlinePlayerProvider);

    final userDatabase = ref.read(userDatabaseProvider);
    return userDatabase.recentUser(count);
  },
);

/*final FutureProvider<Map<String,UserActivity>> initRecentUserProvider = FutureProvider<Map<String,UserActivity>> (
      (ref) {
    final int count = ref.watch(onlinePlayerProvider);

    final userDatabase = ref.read(userDatabaseProvider);
    return userDatabase.initRecentUser(count);
  },
);*/
