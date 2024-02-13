import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../model/board.dart';
import '../model/local_player.dart';
import '../model/my_user.dart';
import '../model/play_stats.dart';
import 'auth_provider.dart';
import 'firebase_init.dart';
import 'game_setup_provider.dart';
import 'pass_avatar_provider.dart';

final Provider<UserDatastore> userDatastoreProvider =
    Provider<UserDatastore>((ref) => UserDatastore(ref));

class UserDatastore {
  final Ref<UserDatastore> ref;

  late FirebaseFirestore firebaseFirestore;
  late CollectionReference userColl;
  late User? user;

  late DocumentReference myDocRef;

  UserDatastore(this.ref) {
    firebaseFirestore = ref.read(fireStoreProvider);
    userColl = firebaseFirestore.collection('users');
    user = ref.watch(authUserProvider).value;

    if (user != null) {
      myDocRef = userColl.doc(user?.uid ?? "");
    }

    debugPrint("Initiating User Datastore ${user?.uid ?? "No User"}");
  }

  Stream<MyUser?> get myUser {
    late BehaviorSubject<MyUser?> behaviorSubject;
    behaviorSubject = BehaviorSubject<MyUser?>(
      onListen: user == null
          ? null
          : () => myDocRef.snapshots().listen(
                (DocumentSnapshot snapshot) {
                  MyUser? myUser;
                  if (snapshot.exists) {
                    myUser = getMyUser(snapshot);
                    if (behaviorSubject.hasValue) {
                      if (behaviorSubject.value != myUser) {
                        behaviorSubject.add(myUser);
                      }
                    } else {
                      debugPrint("First MyUser");
                      Future.delayed(
                        const Duration(seconds: 5),
                        () => behaviorSubject.add(myUser),
                      );
                    }
                  }
                },
              ),
      onCancel: () {
        debugPrint("on Cancelling $user");
        if (user != null) {
          userActive(false);
        }
      },
    );
    return behaviorSubject.stream;
  }

  Future userActive(bool flag) => myDocRef.update({'isActive': flag});

  Future<String> get appVersion =>
      ref.read(packageInfoProvider.future).then((value) => value.version);

  Future get newAvatarCode async {
    //final String avatarCode =
    //    List.generate(6, (index) => mockInteger(1, 8).toString()).join();
    return myDocRef.update(
      {
        'avatarCode': ref.read(newAvatarCodeProvider),
      },
    );
  }

  Future<MyUser?> xUser(String x) => userColl.doc(x).get().then(
        (DocumentSnapshot documentSnapshot) {
          if (!documentSnapshot.exists) return null;
          return getMyUser(documentSnapshot);
        },
      );

  MyUser getMyUser(DocumentSnapshot<Object?> documentSnapshot) {
    Map m = documentSnapshot.data() as Map;
    Map<String, dynamic> json = Map<String, dynamic>.from(m);
    MyUser myUser = MyUser.fromJson(json);
    return myUser;
  }

  Future updatePlayFriendScore(Board board) async {
    final x = GameSetup();
    final String cPath = x.collectionPath(board);

    DocumentReference documentReference =
        myDocRef.collection("play_friend_score").doc(cPath);

    final LocalPlayer? myLocalPlayer = board.players[user!.uid];

    return firebaseFirestore.runTransaction(
      (transaction) async {
        // Get the document
        DocumentSnapshot snapshot = await transaction.get(documentReference);

        final List<String> pList = List.from(board.players.keys);
        pList.remove(user!.uid);

        PlayStats playStats = myLocalPlayer!.statsConversion(
          board.icons.length,
          board.winners.containsKey(user!.uid),
          pList,
        );

        if (!snapshot.exists) {
          transaction.set(documentReference, playStats.toJson());
        } else {
          Map map = snapshot.data() as Map;
          Map<String, dynamic> json = Map<String, dynamic>.from(map);
          PlayStats currentStats = PlayStats.fromJson(json);
          currentStats += playStats;
          transaction.update(documentReference, currentStats.toJson());
        }
        return playStats;
      },
    );
  }

  Future newCardArr(String value) {
    final x = FieldValue.arrayUnion([value]);
    return myDocRef.update({'avatarArr': x});
  }

  Future setAvatar(String value) => myDocRef.update(
        {
          'avatar': value,
          'avatarArr': FieldValue.arrayUnion([value]),
        },
      );

  Future<List<String>> searchAvatarCode(String code) =>
      userColl.where('avatarCode', isEqualTo: code).get().then(
        (QuerySnapshot snapshot) {
          return snapshot.size == 0
              ? []
              : snapshot.docs.map((e) => e.id).toList();
        },
      );

  Future newAvatarUserId(String xId) => myDocRef.update(
        {
          'newPassAvatar': FieldValue.arrayUnion([xId]),
        },
      );

  Future<List<String>> get passAvatar => myDocRef.get().then(
        (DocumentSnapshot snapshot) {
          if (snapshot.exists) {
            Map map = snapshot.data() as Map;
            debugPrint("166-$map");
            List<String> x =
                //(snapshot.data() as Map)['newPassAvatar'] as List<String>;
                map.containsKey('newPassAvatar')
                    ? (map['newPassAvatar'] as List).cast<String>()
                    : [];
            return x;
          }
          return [];
        },
      );
  //Stream<String> onNewAvatarUserId => myDocRef.
}
