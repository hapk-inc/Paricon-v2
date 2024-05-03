import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import '../../firebase/bloc.dart';
import '../../model/friendly_stats.dart';
//import '../../model/my_activity.dart';
import '../../model/player.dart';
import '../app/device_provider.dart';
import '../auth/bloc.dart';
import '../leaderboard/notifier.dart';
import '../room/bloc.dart';

//const Duration _m900 = Duration(milliseconds: 900);

Logger _logger = Logger();

class UserDatastore {
  final Ref<UserDatastore> ref;

  late FirebaseFirestore firebaseFirestore;
  late CollectionReference userColl;
  late User? fUser;

  UserDatastore(this.ref) {
    firebaseFirestore = ref.read(fireStoreProvider);
    userColl = firebaseFirestore.collection('users');
    fUser = ref.watch(authUserProvider).value;

    if (fUser != null) {
      _logger.i("Initiating User Datastore ${fUser?.uid ?? "No User"}");
    }
  }

/*  Stream<Player?> get user {
    late BehaviorSubject<Player?> behaviorSubject;
    behaviorSubject = BehaviorSubject<Player?>(
      onListen: fUser == null
          ? null
          : () => userColl.doc(fUser?.uid).snapshots().listen(
                (DocumentSnapshot snapshot) {
                  if (snapshot.exists) {
                    _logger.i("Player Exist");
                    Player player = Player.fromSnapshot(snapshot);
                    behaviorSubject.add(player);
                  }
                },
              ),
      onCancel: () {
        _logger.i("Player OnCancel");
        // ref.read(leaderBoardNotifierProvider).dispose();
      },
    );
    return behaviorSubject.stream;
  }*/

  Query<Player> get userConverterQuery =>
      userColl.orderBy('nowTime', descending: true).withConverter<Player>(
            fromFirestore: (snapshot, _) {
              Player player = Player.fromSnapshot(snapshot);
              return player.copyWith(id: snapshot.id);
            },
            toFirestore: (value, _) => value.toJson(),
          );

  Future<List<Player>> get overall => userConverterQuery.get().then(
        (QuerySnapshot<Player> snapshot) {
          if (snapshot.docs.isEmpty) return [];
          return List.from(snapshot.docs.map((e) => e.data()));
        },
      );

  Future userActive(bool flag) =>
      userColl.doc(fUser?.uid).update({'isActive': flag});

/*  Future<Player?> player(String id) => userColl.doc(id).get().then(
        (DocumentSnapshot documentSnapshot) {
          if (!documentSnapshot.exists) return null;
          return Player.fromSnapshot(documentSnapshot);
        },
      );*/

  Future createPlayer(Player me) => userColl.doc(fUser?.uid ?? "").set(
        <String, dynamic>{
          ...me
              .copyWith(
                nowTime: me.createdAt ?? DateTime.now(),
              )
              .toJson(),
          //...MyActivity(nowTime: me.createdAt ?? DateTime.now()).toJson()
        },
      );

/*  Query<Player> recentPlayer(num id) => userColl
      .where('tag', isNotEqualTo: id)
      .orderBy('nowTime', descending: true)
      .withConverter<Player>(
        fromFirestore: (snapshot, _) => Player.fromSnapshot(snapshot),
        toFirestore: (value, _) => value.toJson(),
      )
      .limit(5);*/

  Future newFriendlyStats(FriendlyStats friendlyStats) {
    final String room = ref.watch(idNotifier)!;
    return userColl
        .doc(fUser?.uid ?? "")
        .collection('stats')
        .doc(room)
        .set(friendlyStats.toJson());
  }

  Future updateNowTime() async {
    final String? version =
        await ref.read(packageInfoProvider.future).then((x) => x.buildNumber);
    return userColl.doc(fUser?.uid ?? "").update(
      {
        "nowTime": DateTime.now().toIso8601String(),
        "appVersion": version,
      },
    );
  }

  Future<List<Player>> pendingUser(DateTime date) => userConverterQuery
      .where('nowTime', isGreaterThan: date.toIso8601String())
      .get()
      .then(
        (QuerySnapshot<Player> snapshot) =>
            List.from(snapshot.docs.map((e) => e.data())),
      );

  /*  Future<List<UserRecord>> pendingRecord(DateTime dateTime) => leaderboardQuery
      .where('lastPlayed', isGreaterThan: dateTime.toIso8601String())
      .get()
      .then(
        (value) => List.from(
          value.docs.map(
            (e) => e.data().copyWith(id: e.id),
          ),
        ),
      );*/
}
