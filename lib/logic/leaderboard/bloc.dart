import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/user_log.dart';
import '../../model/user_record.dart';
import 'datastore.dart';
import 'notifier.dart';

final Provider<LeaderBoardDatastore> leaderBoardDatastoreProvider =
    Provider<LeaderBoardDatastore>((ref) => LeaderBoardDatastore(ref));

final AutoDisposeFutureProviderFamily<void, UserLog> updateUserLogProvider =
    FutureProvider.autoDispose.family<void, UserLog>(
  (ref, userLog) async {
    final LeaderBoardDatastore leaderBoard =
        ref.read(leaderBoardDatastoreProvider);
    return leaderBoard.update(userLog);
  },
);

final FutureProvider<List<UserRecord>> overallLeaderboardProvider =
    FutureProvider<List<UserRecord>>(
  (ref) async {
    final l = ref.read(leaderBoardDatastoreProvider);
    return l.overall;
  },
);

final FutureProviderFamily<List<UserRecord>, DateTime> pendingRecordProvider =
    FutureProvider.family<List<UserRecord>, DateTime>(
  (ref, date) async {
    final l = ref.read(leaderBoardDatastoreProvider);
    return l.pendingRecord(date);
  },
);

final Provider<UserRecord?> myBestProvider = Provider<UserRecord?>(
  (ref) {
    final notifier = ref.watch(leaderBoardNotifierProvider);
    return notifier.myBest;
  },
);

final StreamProvider<UserRecord> onNewRecordProvider =
    StreamProvider<UserRecord>(
  (ref) {
    final LeaderBoardDatastore leaderBoardDatastore =
        ref.read(leaderBoardDatastoreProvider);
    return leaderBoardDatastore.onNewRecord;
  },
);
