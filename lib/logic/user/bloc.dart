import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../model/player.dart';
import 'notifier.dart';
import 'user_datastore.dart';

Logger _logger = Logger();

final Provider<UserDatastore> userDatastoreProvider =
    Provider<UserDatastore>((ref) => UserDatastore(ref));

final StreamProvider<Player?> meProvider = StreamProvider<Player?>(
  (ref) {
    final UserDatastore datastore = ref.watch(userDatastoreProvider);
    return datastore.user;
  },
);

final FutureProviderFamily<Player?, String> playerProvider =
    FutureProvider.family<Player?, String>(
  (ref, id) async {
    final datastore = ref.read(userDatastoreProvider);
    return datastore.player(id);
  },
);

final AutoDisposeChangeNotifierProvider<UserNotifier> userNotifierProvider =
    AutoDisposeChangeNotifierProvider<UserNotifier>(
  (ref) => UserNotifier(ref)..initializeMe(),
);

final AutoDisposeFutureProviderFamily createMeProvider =
    FutureProvider.autoDispose.family<void, Player>(
  (ref, me) async {
    final datastore = ref.read(userDatastoreProvider);
    _logger.i("Running CreateUser");
    return datastore.createPlayer(me);
  },
);

final Provider<Query> recentPlayerProvider = Provider<Query>(
  (ref) {
    final datastore = ref.read(userDatastoreProvider);
    final num id = ref.watch(meProvider).value?.tag ?? 0;
    return datastore.recentPlayer(id);
  },
);
