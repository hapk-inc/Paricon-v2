import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/model/my_user.dart';
import 'package:rxdart/rxdart.dart';

import '../dashboard/open_challenge_table.dart';
import '../model/best_d.dart';
import '../model/t_duration.dart';
import 'auth_provider.dart';
import 'firebase_init.dart';

final tournamentDatabaseProvider = Provider((ref) => TournamentDatabase(ref));

final recentTourListProvider = StreamProvider<List<TDuration>>(
  (ref) {
    final tDatabase = ref.read(tournamentDatabaseProvider);
    return tDatabase.recentTourList;
  },
);

final StreamProvider<List<String>> bestDListProvider =
    StreamProvider<List<String>>(
  (ref) {
    final tDatabase = ref.read(tournamentDatabaseProvider);
    return tDatabase.bestDList;
  },
);

final AutoDisposeFutureProvider<Map<String, BestD>> viewLeaderBoardProvider =
    FutureProvider.autoDispose<Map<String, BestD>>(
  (ref) async {
    final tDatabase = ref.read(tournamentDatabaseProvider);
    return tDatabase.viewLeaderBoard;
  },
);

final AutoDisposeFutureProvider<BestD?> myBestDProvider =
    FutureProvider.autoDispose<BestD?>(
  (ref) async {
    final tDatabase = ref.read(tournamentDatabaseProvider);
    return tDatabase.myBestD;
  },
);

final StreamProviderFamily<MyUser?, String> xUserProvider =
    StreamProvider.family<MyUser?, String>(
  (ref, id) {
    final tDatabase = ref.read(tournamentDatabaseProvider);
    return tDatabase.xUser(id);
  },
);

class TournamentDatabase {
  final Ref ref;

  late DatabaseReference firebaseReference;
  late FirebaseFirestore firebaseFirestore;
  late String? userId;
  late DatabaseReference tournamentReference;
  late DocumentReference bestDurationDoc;
  late DocumentReference userDoc;

  TournamentDatabase(this.ref) {
    firebaseFirestore = ref.read(fireStoreProvider);
    firebaseReference = ref.read(databaseProvider).ref();

    userId = ref.watch(authUserProvider).value!.uid;

    tournamentReference = firebaseReference.child('tournament');
    if (userId != null) {
      debugPrint("57--$userId");
      userDoc = firebaseFirestore.collection('users').doc(userId);
      bestDurationDoc = firebaseFirestore.collection('bestD').doc(userId);
    }
  }

  Future<BestD?> get myBestD async => bestDurationDoc.get().then(
        (DocumentSnapshot documentSnapshot) {
          if (!documentSnapshot.exists) {
            return null;
          } else {
            Map<String, dynamic> json =
                Map<String, dynamic>.from(documentSnapshot.data() as Map);
            BestD bestD = BestD.fromJson(json);
            return bestD;
          }
        },
      );

  Stream<List<TDuration>> get recentTourList {
    late BehaviorSubject<List<TDuration>> subject;
    subject = BehaviorSubject(
      onListen: () => tournamentReference
          .orderByChild('playedAt')
          .limitToLast(tableCount)
          .onValue
          .listen(
        (event) {
          if (event.snapshot.exists) {
            List<TDuration> tList = [];
            for (final child in event.snapshot.children) {
              Map<String, dynamic> json =
                  Map<String, dynamic>.from(child.value as Map);
              TDuration tD = TDuration.fromJson(json);
              tList.add(tD);
            }
            subject.add(tList);
          }
        },
      ),
    );
    return subject.stream;
  }

  Stream<List<String>> get bestDList => firebaseFirestore
      .collection('bestD')
      .orderBy('bestD')
      .snapshots()
      .map((event) =>
          event.size == 0 ? [] : event.docs.map((e) => e.id).toList());

  Future<Map<String, BestD>> get viewLeaderBoard =>
      firebaseFirestore.collection('bestD').orderBy('bestD').get().then(
        (QuerySnapshot snapshot) {
          Map<String, BestD> map = {};
          if (snapshot.size != 0) {
            final List<QueryDocumentSnapshot> x = snapshot.docs;
            for (var e in x) {
              Map m = e.data() as Map;
              Map<String, dynamic> json = Map<String, dynamic>.from(m);
              BestD bestD = BestD.fromJson(json);
              map[e.id] = bestD;
            }
          }
          return map;
        },
      );

  Stream<MyUser?> xUser(String id) =>
      firebaseFirestore.collection('users').doc(id).snapshots().map(
        (event) {
          if (event.exists) {
            Map<String, dynamic> json =
                Map<String, dynamic>.from(event.data() as Map);
            MyUser myUser = MyUser.fromJson(json);
            return myUser;
          } else {
            return null;
          }
        },
      );

  Future updateTDuration(Duration tDuration) async {
    final now = DateTime.now();

    WriteBatch batch = firebaseFirestore.batch();
    batch.set(
      userDoc.collection('played').doc(mockString(8)),
      {
        "playedAt": now.toIso8601String(),
        "tDuration": tDuration.inMicroseconds,
      },
    );
    final BestD? bestD = await myBestD;

    final TDuration tD = TDuration(
      userId: userId!,
      playedAt: now,
      tDuration: tDuration,
      firstTime: bestD == null,
    );
    tournamentReference.push().set(tD.toJson());

    if (bestD == null) {
      batch.set(
          bestDurationDoc, BestD(lastPlayed: now, bestD: tDuration).toJson());
    } else if (bestD.bestD.compareTo(tDuration) > 0) {
      batch.update(
          bestDurationDoc,
          BestD(lastPlayed: now, bestD: tDuration, prevD: bestD.bestD)
              .toJson());
      batch.update(bestDurationDoc, {'tCount': FieldValue.increment(1)});
    } else {
      batch.update(bestDurationDoc, {'tCount': FieldValue.increment(1)});
    }
    return batch.commit();
  }
}
