import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mock_data/mock_data.dart';

import '../../model/friendly_stats.dart';
import '../../model/player.dart';
import 'notifier.dart';
import 'user_datastore.dart';

Logger _logger = Logger();

final Provider<UserDatastore> userDatastoreProvider =
    Provider<UserDatastore>((ref) => UserDatastore(ref));

final Provider<String> newAvatarCodeProvider = Provider<String>(
  (ref) {
    /*String str = List.generate(
        6,
        <String>(int index) => defaultEmojiSet[1]
            .emoji[mockInteger(0, defaultEmojiSet[1].emoji.length - 1)]
            .emoji).join();*/
    return mockString(6, 'A').toUpperCase();
  },
);

final AutoDisposeFutureProviderFamily createMeProvider =
    FutureProvider.autoDispose.family<void, Player>(
  (ref, me) async {
    final UserDatastore datastore = ref.read(userDatastoreProvider);
    _logger.i("Running CreateUser");
    return datastore.createPlayer(me);
  },
);

final FutureProviderFamily<List<Player>, DateTime> pendingUserProvider =
    FutureProvider.family<List<Player>, DateTime>(
  (ref, date) async {
    final UserDatastore datastore = ref.read(userDatastoreProvider);
    return datastore.pendingUser(date);
  },
);
/*final StreamProvider<Player?> meProvider = StreamProvider<Player?>(
  (ref) {
    final UserDatastore datastore = ref.watch(userDatastoreProvider);
    return datastore.user;
  },
);*/

/*final Provider<Query<Player>> recentPlayerProvider = Provider<Query<Player>>(
  (ref) {
    final datastore = ref.read(userDatastoreProvider);
    final num id = ref.watch(meProvider).value?.tag ?? 0;
    return datastore.recentPlayer(id);
  },
);*/

final AutoDisposeFutureProviderFamily<void, FriendlyStats>
    newFriendlyStatsProvider =
    FutureProvider.autoDispose.family<void, FriendlyStats>(
  (ref, stats) async {
    final UserDatastore datastore = ref.read(userDatastoreProvider);
    return datastore.newFriendlyStats(stats);
  },
);

final AutoDisposeFutureProvider updateNowTimeProvider =
    FutureProvider.autoDispose(
  (ref) async {
    final UserDatastore datastore = ref.read(userDatastoreProvider);
    return datastore.updateNowTime();
  },
);

final FutureProvider<List<Player>> overallUserProvider =
    FutureProvider<List<Player>>(
  (ref) async {
    final UserDatastore userDatastore = ref.read(userDatastoreProvider);
    return userDatastore.overall;
  },
);

final StreamProvider<Player> onNewPlayerProvider = StreamProvider<Player>(
  (ref) {
    final UserDatastore userDatastore = ref.read(userDatastoreProvider);
    return userDatastore.onNewPlayer;
  },
);

final Provider<Player?> meProvider = Provider<Player?>(
  (ref) {
    final UserNotifier notifier = ref.read(userNotifierProvider);
    return notifier.me;
  },
);

final ProviderFamily<Player?, String> xPlayerProvider =
    Provider.family<Player?, String>(
  (ref, id) {
    final UserNotifier notifier = ref.read(userNotifierProvider);
    return notifier.player(id);
  },
);
