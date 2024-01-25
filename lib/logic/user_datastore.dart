import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/model/pass_avatar.dart';
import 'package:rxdart/rxdart.dart';

import '../model/my_user.dart';
import 'firebase_init.dart';

class UserDatastore {
  final Ref ref;
  late CollectionReference userColl;
  final User? user;
  late BehaviorSubject<MyUser?> _userBehaviour;
  late String? _id;
  late FirebaseFirestore firebaseFirestore;

  UserDatastore(this.ref, this.user) {
    firebaseFirestore = ref.read(fireStoreProvider);
    userColl = firebaseFirestore.collection('users');
    final User? x = user;
    debugPrint("Checking xFirebaseUser ${x == null ? "No xUser" : x.uid}");
    _id = x?.uid;
    debugPrint("Initiating user datastore");
  }

  Stream<MyUser?> get myUser {
    _userBehaviour = BehaviorSubject<MyUser>(
      onListen: () => _id == null
          ? null
          : userColl.doc(_id).snapshots().listen(
              (event) {
                MyUser? myUser;
                if (event.exists) myUser = getMyUser(event);
                if (_userBehaviour.hasValue) {
                  if (_userBehaviour.value != myUser) {
                    _userBehaviour.add(myUser);
                  }
                } else {
                  debugPrint("First MyUser");
                  Future.delayed(
                    const Duration(seconds: 5),
                    () => _userBehaviour.add(myUser),
                  );
                }
              },
            ),
      onCancel: () {
        debugPrint("on Cancelling $_id");
        if (_id != null) {
          userActive(false);
        }
      },
    );
    return _userBehaviour.stream;
  }

  Future userActive(bool flag) => userColl.doc(_id).update({'isActive': flag});

  MyUser getMyUser(DocumentSnapshot<Object?> documentSnapshot) {
    Map m = documentSnapshot.data() as Map;
    Map<String, dynamic> json = Map<String, dynamic>.from(m);
    MyUser myUser = MyUser.fromJson(json);
    return myUser;
  }

  Future<String> get appVersion =>
      ref.read(packageInfoProvider.future).then((value) => value.version);

  //Future<bool> get appOpenedOrLoggedIn async => true;

  Future get newAvatarCode async =>
      userColl.doc(_id).update({'avatarCode': mockString(6, 'A')});

/*  Query<PUser> get recentUserCollection => userColl
      .withConverter(
        fromFirestore: (snapshot, _) => PUser.fromJson(snapshot.data()!),
        toFirestore: (x, _) => x.toJson(),
      )
      .orderBy('currentTime', descending: true);

  CollectionReference<PUser> get bestDurationColl => userColl.withConverter(
        fromFirestore: (snapshot, _) => PUser.fromJson(snapshot.data()!),
        toFirestore: (x, _) => x.toJson(),
      );*/

  /*Stream<MyDuration?> get myUserDuration {
    late BehaviorSubject<MyDuration?> subject;
    subject = BehaviorSubject(
      onListen: () => userColl.doc(_id).snapshots().listen(
        (DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            Map map = documentSnapshot.data() as Map;
            if (map.containsKey('currentTime')) {
              Map<String, dynamic> json = Map<String, dynamic>.from(map);
              MyDuration d = MyDuration.fromJson(json);
              subject.add(d);
            }
          }
        },
      ),
    );
    return subject.stream;
  }*/

  Future addFriend(String friend) => userColl.doc(_id).update(
        {
          'myFriends': FieldValue.arrayUnion([friend]),
        },
      );

  Future<String?> validUser(String avatarCode) =>
      userColl.where('avatarCode', isEqualTo: avatarCode).get().then(
        (QuerySnapshot snapshot) {
          if (snapshot.docs.isEmpty) {
            return null;
          } else {
            return snapshot.docs[0].id;
          }
        },
      );

  // Future setActive(bool flag) => userColl.doc(_id).update({'isActive': flag});

/*  Query<MyAvatar> get receivedNewAvatar => userColl
      .doc(_id)
      .collection('avatar')
      .where('id', isEqualTo: "")
      .withConverter(
        fromFirestore: (snapshot, _) => MyAvatar.fromJson(snapshot.data()!),
        toFirestore: (x, _) => x.toJson(),
      );*/

  Future newAvatar(String docId, String rPickCard) =>
      userColl.doc(docId).collection('avatar').doc(_id).set(
            PassAvatar(
              createdAt: DateTime.now(),
              //from: _id!,
            ).toJson(),
          );

  Future newCard(String docId, String xCard) {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    batch.update(
      userColl.doc(_id),
      {
        'avatarArr': FieldValue.arrayUnion([xCard]),
        'avatar': xCard,
      },
    );
    batch.update(
      userColl.doc(_id).collection('avatar').doc(docId),
      PassAvatar(
        createdAt: DateTime.now(),
        id: xCard,
      ).toJson(),
    );
    return batch.commit();
  }

  Future<MyUser?> xUser(String x) => userColl.doc(x).get().then(
        (DocumentSnapshot documentSnapshot) {
          if (!documentSnapshot.exists) return null;
          return getMyUser(documentSnapshot);
        },
      );

  Future<List<String>> userAvatarArr(String userID) =>
      userColl.doc(userID).get().then(
        (DocumentSnapshot documentSnapshot) {
          if (!documentSnapshot.exists) return [];
          final Map map = documentSnapshot.data() as Map;
          return List.from(map['avatarArr']);
        },
      );
}
