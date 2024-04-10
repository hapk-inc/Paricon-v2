import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/user_log.dart';
import '../../model/user_record.dart';
import 'datastore.dart';

final Provider<LeaderBoardDatastore> leaderBoardDatastoreProvider =
    Provider<LeaderBoardDatastore>((ref) => LeaderBoardDatastore(ref));

final AutoDisposeFutureProviderFamily<void, UserLog> updateUserLogProvider =
    FutureProvider.autoDispose.family<void, UserLog>(
  (ref, userLog) async {
    final leaderBoard = ref.read(leaderBoardDatastoreProvider);
    return leaderBoard.update(userLog);
  },
);

final Provider<Query<UserRecord>> queryLeaderboardProvider =
    Provider<Query<UserRecord>>(
  (ref) {
    final l = ref.read(leaderBoardDatastoreProvider);
    return l.leaderBoardQuery;
  },
);

final FutureProvider<Map<String, UserRecord>> overallLeaderBoardProvider =
    FutureProvider<Map<String, UserRecord>>((ref) async {
  final l = ref.read(leaderBoardDatastoreProvider);
  return l.overallLeaderBoard;
});
