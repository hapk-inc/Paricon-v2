import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';
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
                if (event.exists) getMyUser(event);
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

  getMyUser(DocumentSnapshot<Object?> documentSnapshot) {
    Map m = documentSnapshot.data() as Map;
    Map<String, dynamic> json = Map<String, dynamic>.from(m);
    MyUser myUser = MyUser.fromJson(json);

    if (_userBehaviour.hasValue) {
      if (_userBehaviour.value != myUser) _userBehaviour.add(myUser);
    } else {
      debugPrint("First MyUser");
      Future.delayed(
        const Duration(seconds: 5),
        () => _userBehaviour.add(myUser),
      );
    }
  }

  Future<String> get appVersion =>
      ref.read(packageInfoProvider.future).then((value) => value.version);

  Future<bool> get appOpenedOrLoggedIn async => true;

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

  Future setActive(bool flag) => userColl.doc(_id).update({'isActive': flag});

/*  Query<MyAvatar> get receivedNewAvatar => userColl
      .doc(_id)
      .collection('avatar')
      .where('id', isEqualTo: "")
      .withConverter(
        fromFirestore: (snapshot, _) => MyAvatar.fromJson(snapshot.data()!),
        toFirestore: (x, _) => x.toJson(),
      );*/

  Future newCard(String docId, String rPickCard) {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    batch.update(
      userColl.doc(_id),
      {
        'avatarArr': FieldValue.arrayUnion([rPickCard]),
        'avatar': rPickCard,
      },
    );
    batch.update(
      userColl.doc(_id).collection('avatar').doc(docId),
      {'id': rPickCard},
    );
    return batch.commit();
  }
}
