import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../firebase/bloc.dart';
import '../../model/user_log.dart';

const String _ref = 'leaderboard';

class LeaderBoardDatabase {
  final Ref ref;
  late DatabaseReference firebaseReference;
  late DatabaseReference leaderBoardReference;

  LeaderBoardDatabase(this.ref) {
    firebaseReference = ref.read(databaseProvider).ref();
    leaderBoardReference = firebaseReference.child(_ref);
  }

  Future update(UserLog log) async {
    leaderBoardReference.push().set(log.toJson());
    await firebaseReference.child('t_count').set(ServerValue.increment(1));
  }
}
