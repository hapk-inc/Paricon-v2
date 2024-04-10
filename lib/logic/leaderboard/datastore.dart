import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../../firebase/bloc.dart';
import '../../model/user_log.dart';
import '../../model/user_record.dart';
import '../auth/bloc.dart';
import 'database.dart';
import 'leaderboard_ql.dart';

const String _ref = 'leaderboard';

class LeaderBoardDatastore {
  final Ref ref;
  //final LeaderBoardQL _db = LeaderBoardQL();
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

  /*Future<Map<String, UserRecord>> get overall => lQuery.get().then(
        (value) => Map.fromIterables(
          value.docs.map((e) => e.id),
          value.docs.map((e) => e.data()),
        ),
      );*/

  Future<List<UserRecord>> get overall => lQuery.get().then(
        (QuerySnapshot<UserRecord> querySnapshot) => List.from(
          querySnapshot.docs.map(
            (e) => e.data().copyWith(id: e.id),
          ),
        ),
      );

  Future<List<UserRecord>> pendingRecord(DateTime dateTime) => lQuery
      .where('lastPlayed', isGreaterThan: dateTime.toIso8601String())
      .get()
      .then(
        (value) => List.from(
          value.docs.map(
            (e) => e.data().copyWith(id: e.id),
          ),
        ),
      );

  /////
  Future update(UserLog userLog) async {
    database.update(userLog);

    //
    DocumentReference docRef = leaderBoardCollectionReference.doc(me ?? "x");

    return firebaseFirestore.runTransaction(
      (transaction) async {
        DocumentSnapshot snapshot = await transaction.get(docRef);
        if (!snapshot.exists) {
          transaction.set(docRef, UserRecord.fromUserLog(userLog).toJson());
        } else {
          final rec = UserRecord.fromSnapshot(snapshot).fromExisting(userLog);
          transaction.update(docRef, rec.toJson());
        }
      },
    );
  }

  Query<UserRecord> get lQuery => leaderBoardCollectionReference
      .orderBy('lastPlayed', descending: true)
      .withConverter<UserRecord>(
        fromFirestore: (snapshot, _) => UserRecord.fromSnapshot(snapshot),
        toFirestore: (value, _) => value.toJson(),
      );

  /*Stream<UserRecord> get onChangedRecord =>
      lQuery.snapshots().listen((QuerySnapshot<UserRecord> querySnapshot) {});*/

  Stream<UserRecord> get onNewRecord {
    late BehaviorSubject<UserRecord> subject;
    subject = BehaviorSubject(
      onListen: () => lQuery
          .where('lastPlayed', isGreaterThan: DateTime.now().toIso8601String())
          .snapshots()
          .listen(
        (QuerySnapshot<UserRecord> querySnapshot) {
          for (var element in querySnapshot.docChanges) {
            subject.add(element.doc.data()!.copyWith(id: element.doc.id));
          }
        },
      ),
    );
    return subject.stream;
  }
}
