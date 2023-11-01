import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';
import 'package:rxdart/rxdart.dart';

import '../model/avatar_card.dart';
import '../model/my_duration.dart';
import '../model/my_user.dart';
import '../model/p_user.dart';
import 'auth.dart';
import 'firebase_init.dart';

class UserDatastore {
  final Ref ref;
  late CollectionReference userColl;
  late FirebaseFirestore firebaseFirestore;
  late String userId;

  UserDatastore(this.ref) {
    firebaseFirestore = ref.read(fireStoreProvider);
    userColl = firebaseFirestore.collection('users');
    userId = ref.read(firebaseUserProvider).uid;
  }

  Stream<PUser> pUserMe(String id) {
    late BehaviorSubject<PUser> behaviorSubject;
    behaviorSubject = BehaviorSubject(
      onListen: () => userColl.doc(id).snapshots().listen(
        (event) {
          if (event.exists) {
            Map m = event.data() as Map;
            if (m.containsKey('currentTime')) {
              Map<String, dynamic> json = Map<String, dynamic>.from(m);

              behaviorSubject.add(
                PUser(
                  MyUser.fromJson(json),
                  MyDuration.fromJson(json),
                ),
              );
            } else {
              debugPrint("No Data");
            }
          }
        },
      ),
    );
    return behaviorSubject.stream;
  }

  Future get updateDuration async {
    //DocumentReference documentReference = userColl.doc(userId);

    DocumentReference documentReference = userColl.doc(userId);

    return firebaseFirestore.runTransaction(
      (transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);

        if (snapshot.data() != null) {
          Map map = snapshot.data() as Map;
          Map<String, dynamic> json = Map<String, dynamic>.from(map);

          final String appVersion = await _appVersion;
          final DateTime now = DateTime.now();

          if (!json.containsKey('currentTime')) {
            debugPrint("New CurrentTime");
            transaction.update(
              documentReference,
              MyDuration(
                      appVersion: appVersion,
                      avatarCode: mockString(6, 'A'),
                      currentTime: now)
                  .toJson(),
            );
          } else {
            MyDuration d = MyDuration.fromJson(json);
            debugPrint("Existing CurrentTime");
            transaction.update(
              documentReference,
              MyDuration(
                      currentTime: now,
                      lastOpened: d.currentTime,
                      appVersion: appVersion,
                      avatarCode: now.day != d.currentTime.day
                          ? mockString(6, 'A')
                          : d.avatarCode)
                  .toJson(),
            );
          }
        }
      },
    );
  }

  Future<String> get _appVersion =>
      ref.read(packageInfoProvider.future).then((value) => value.version);

  CollectionReference<AvatarCard> get avatarCardCollection {
    final xAvatars = userColl.doc(userId).collection('avatar');
    return xAvatars.withConverter(
      fromFirestore: (snapshot, _) => AvatarCard.fromJson(snapshot.data()!),
      toFirestore: (x, _) => x.toJson(),
    );
  }

  CollectionReference<PUser> get recentUserCollection {
    final xUsers = userColl;
    return xUsers.withConverter(
      fromFirestore: (snapshot, _) => PUser(MyUser.fromJson(snapshot.data()!),
          MyDuration.fromJson(snapshot.data()!)),
      toFirestore: (x, _) => x.xtoJson,
    );
  }

  Future newCard(String docId, String rPickCard) {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    batch.update(userColl.doc(userId), {
      'myCards': FieldValue.arrayUnion([rPickCard]),
      'avatar': rPickCard,
    });
    batch.update(
      userColl.doc(userId).collection('avatar').doc(docId),
      {'id': rPickCard},
    );
    return batch.commit();
  }
}

/*class UserDatastore {
  final Ref ref;

  late CollectionReference userColl;

  late FirebaseFirestore firebaseFirestore;
  late String? userId;

  UserDatastore(this.ref) {
    firebaseFirestore = ref.read(fireStoreProvider);
    userColl = firebaseFirestore.collection('users');
    userId = ref.read(firebaseUserProvider).uid;
  }

  Stream<String> get avatarID {
    late BehaviorSubject<String> behaviorSubject;
    behaviorSubject = BehaviorSubject(
      onListen: () => userColl.doc(userId).snapshots().listen(
        (event) {
          Map m = event.data() as Map;
          behaviorSubject.add(m['avatar']);
        },
      ),
    );
    return behaviorSubject.stream;
  }

  Stream<String> get avatarCode {
    late BehaviorSubject<String> behaviorSubject;
    behaviorSubject = BehaviorSubject(
      onListen: () => userColl.doc(userId).snapshots().listen(
        (event) {
          if (event.exists) {
            Map m = event.data() as Map;
            behaviorSubject.add(m['avatarCode']);
          }
        },
      ),
    );
    return behaviorSubject.stream;
  }

  Future get updateDuration async {
    final String id = ref.read(firebaseUserProvider).uid;

    DocumentReference<MyDuration> documentReference =
        userColl.doc(id).withConverter(
              fromFirestore: (snapshot, SnapshotOptions? snapshotOption) {
                return MyDuration.fromJson(snapshot.data()!);
              },
              toFirestore: (value, _) => value.toJson(),
            );

    MyDuration? myDuration = await userColl.doc(id).get().then(
      (snapshot) {
        try {
          debugPrint("117--");
          Map map = snapshot.data() as Map;
          Map<String, dynamic> json = Map<String, dynamic>.from(map);
          if (!json.containsKey('currentTime')) return null;
          final r = MyDuration.fromJson(json);
          return r;
        } catch (e) {
          debugPrint(e.toString());
          return null;
        }
      },
    );
    final now = DateTime.now();
    final String appVersion = await ref
        .read(packageInfoProvider.future)
        .then((value) => value.version);
    if (myDuration == null) {
      debugPrint("Updating currentTime");
      await documentReference.update(MyDuration(
        currentTime: now,
        appVersion: appVersion,
        avatarCode: mockString(6, 'A'),
      ).toJson());
    } else {
      await documentReference.update(MyDuration(
              currentTime: now,
              appVersion: appVersion,
              lastOpened: myDuration.currentTime,
              avatarCode: now.day != myDuration.currentTime.day
                  ? mockString(6, 'A')
                  : myDuration.avatarCode)
          .toJson());
    }
  }

  Future<MyUser> myUser(String id) {
    debugPrint("Running myUser --68");
    return userColl.doc(id).get().then(
      (DocumentSnapshot documentSnapshot) async {
        Map map = documentSnapshot.data() as Map;
        await Future.delayed(const Duration(milliseconds: 4000));

        debugPrint("Future<MyUser> $map");
        Map<String, dynamic> json = Map<String, dynamic>.from(map);
        return MyUser.fromJson(json);
      },
    );
  }

  Future<PUser> myPUser(String id) {
    debugPrint("Running myUser --68");
    return userColl.doc(id).get().then(
      (DocumentSnapshot documentSnapshot) async {
        Map map = documentSnapshot.data() as Map;
        await Future.delayed(const Duration(milliseconds: 4000));

        debugPrint("Future<MyUser> $map");
        Map<String, dynamic> json = Map<String, dynamic>.from(map);
        return PUser(MyUser.fromJson(json), MyDuration.fromJson(json));
      },
    );
  }

  Future<MyDuration?> myDuration(String id) {
    return userColl.doc(id).get().then(
      (DocumentSnapshot documentSnapshot) async {
        if (!documentSnapshot.exists) return null;
        Map map = documentSnapshot.data() as Map;

        Map<String, dynamic> json = Map<String, dynamic>.from(map);
        return MyDuration.fromJson(json);
      },
    );
  }

  CollectionReference<PUser> get recentUserCollection {
    final xUsers = userColl;
    return xUsers.withConverter(
      fromFirestore: (snapshot, _) => PUser(MyUser.fromJson(snapshot.data()!),
          MyDuration.fromJson(snapshot.data()!)),
      toFirestore: (x, _) => x.xtoJson,
    );
  }

  CollectionReference<AvatarCard> get avatarCardCollection {
    final xAvatars = userColl.doc(userId).collection('avatar');
    return xAvatars.withConverter(
      fromFirestore: (snapshot, _) => AvatarCard.fromJson(snapshot.data()!),
      toFirestore: (x, _) => x.toJson(),
    );
  }

  Future setNewCardCollection(String docID, String randomPickCard) async {
    await userColl.doc(userId).update(
      {
        'myCards': FieldValue.arrayUnion([randomPickCard]),
        'avatar': randomPickCard,
      },
    );

    return userColl.doc(userId).collection('avatar').doc(docID).update(
      {'id': randomPickCard},
    );
  }
}*/
