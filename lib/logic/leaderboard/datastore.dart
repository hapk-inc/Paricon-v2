import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../firebase/bloc.dart';
import '../../model/user_log.dart';
import '../../model/user_record.dart';
import '../auth/bloc.dart';
import 'database.dart';
import 'leaderboard_ql.dart';

const String _ref = 'leaderboard';

class LeaderBoardDatastore {
  final Ref ref;
  final LeaderBoardQL _db = LeaderBoardQL();
  late LeaderBoardDatabase database;

  late FirebaseFirestore firebaseFirestore;

  late CollectionReference leaderBoardCollectionReference;
  late String? me;

  LeaderBoardDatastore(this.ref) {
    database = LeaderBoardDatabase(ref);
    firebaseFirestore = ref.read(fireStoreProvider);
    leaderBoardCollectionReference = firebaseFirestore.collection(_ref);

    me = ref.watch(authUserProvider).value?.uid;
  }

  Future<Map<String, UserRecord>> get overallLeaderBoard =>
      leaderBoardQuery.get().then(
            (value) => Map.fromIterables(
              value.docs.map((e) => e.id),
              value.docs.map((e) => e.data()),
            ),
          );

  /////
  Future update(UserLog userLog) async {
    database.update(userLog);

    //
    DocumentReference documentReference =
        leaderBoardCollectionReference.doc(me ?? "x");

    firebaseFirestore.runTransaction(
      (transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);
        UserRecord userRecord;

        //
        if (!snapshot.exists) {
          userRecord = UserRecord.fromUserLog(userLog);
          transaction.set(documentReference, userRecord.toJson());
        } else {
          userRecord = UserRecord.fromSnapshot(snapshot).fromExisting(userLog);
          transaction.update(documentReference, userRecord.toJson());
        }
      },
    );
  }

  Query<UserRecord> get leaderBoardQuery => leaderBoardCollectionReference
      .orderBy('lastPlayed', descending: false)
      .withConverter<UserRecord>(
        fromFirestore: (snapshot, options) => UserRecord.fromSnapshot(snapshot),
        toFirestore: (value, options) => value.toJson(),
      );
}
