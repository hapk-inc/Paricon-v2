import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import '../../firebase/bloc.dart';
import '../../model/my_activity.dart';
import '../../model/player.dart';
import '../auth/bloc.dart';

//const Duration _m900 = Duration(milliseconds: 900);

Logger _logger = Logger();

class UserDatastore {
  final Ref<UserDatastore> ref;

  late FirebaseFirestore firebaseFirestore;
  //late FirebaseDatabase firebaseDatabase;
  late CollectionReference userColl;
  late User? fUser;

  UserDatastore(this.ref) {
    firebaseFirestore = ref.read(fireStoreProvider);
    //firebaseDatabase = ref.read(databaseProvider);
    userColl = firebaseFirestore.collection('users');
    fUser = ref.watch(authUserProvider).value;

    if (fUser != null) {
      _logger.i("Initiating User Datastore ${fUser?.uid ?? "No User"}");
    }
  }

  Stream<Player?> get user {
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
      onCancel: () => _logger.i("Player OnCancel"),
    );
    return behaviorSubject.stream;
  }

  Future userActive(bool flag) =>
      userColl.doc(fUser?.uid).update({'isActive': flag});

  Future<Player?> player(String id) => userColl.doc(id).get().then(
        (DocumentSnapshot documentSnapshot) {
          if (!documentSnapshot.exists) return null;
          return Player.fromSnapshot(documentSnapshot);
        },
      );

  Future createPlayer(Player me) => userColl.doc(fUser?.uid ?? "").set(
        <String, dynamic>{
          ...me.toJson(),
          ...MyActivity(nowTime: me.createdAt ?? DateTime.now()).toJson()
        },
      );

  Query recentPlayer(num id) {
    _logger.i("recentPlayerId $id");
    return userColl.where('tag', isNotEqualTo: id);
  }
}
