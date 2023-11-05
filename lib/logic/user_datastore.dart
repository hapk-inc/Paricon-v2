import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';
import 'package:rxdart/rxdart.dart';

import '../model/my_duration.dart';
import '../model/my_user.dart';
import '../model/p_user.dart';
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
        const Duration(seconds: 4),
        () => _userBehaviour.add(myUser),
      );
    }
  }

  Future<String> get _appVersion =>
      ref.read(packageInfoProvider.future).then((value) => value.version);

  Future<bool> get appOpenedOrLoggedIn async {
    debugPrint("Running appOpenedOrLoggedIn");
    DocumentReference documentReference = userColl.doc(_id);
    return await firebaseFirestore.runTransaction(
      (transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);
        if (snapshot.exists) {
          final String appVersion = await _appVersion;
          final DateTime now = DateTime.now();

          Map map = snapshot.data() as Map;
          bool isNewUser = !map.containsKey('currentTime');
          if (isNewUser) {
            debugPrint("New User");
            transaction.update(
              documentReference,
              MyDuration(appVersion: appVersion, currentTime: now).toJson(),
            );
          } else {
            Map<String, dynamic> json = Map<String, dynamic>.from(map);
            MyDuration d = MyDuration.fromJson(json);
            bool nextDayOpen = now.day != d.currentTime.day;
            Duration timeGap = now.difference(d.currentTime);
            bool timeGapInMinute = timeGap > const Duration(minutes: 1);
            if (timeGapInMinute || nextDayOpen) {
              debugPrint("Existing LastOpened");
              transaction.update(
                documentReference,
                MyDuration(
                  currentTime: now,
                  lastOpened: d.currentTime,
                  appVersion: appVersion,
                ).toJson(),
              );
            } else {
              debugPrint(timeGap.toString());
              debugPrint("Less than minute");
            }
            if (nextDayOpen) {
              debugPrint("Changing New Avatar Code");
              transaction.update(
                documentReference,
                {"avatarCode": mockString(6, 'A')},
              );
            }
          }
          return true;
        } else {
          debugPrint("No Transaction done");
          return false;
        }
      },
    );
  }

  Query<PUser> recentUserCollection(num id) => userColl
      .withConverter(
        fromFirestore: (snapshot, _) => PUser.fromJson(snapshot.data()!),
        toFirestore: (x, _) => x.toJson(),
      )
      .orderBy('currentTime', descending: true);

  CollectionReference<PUser> get bestDurationColl => userColl.withConverter(
        fromFirestore: (snapshot, _) => PUser.fromJson(snapshot.data()!),
        toFirestore: (x, _) => x.toJson(),
      );

  Stream<MyDuration?> get myUserDuration {
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
  }

  Stream<QueryDocumentSnapshot<PUser>> get firstRank {
    late BehaviorSubject<QueryDocumentSnapshot<PUser>> subject;
    subject = BehaviorSubject(
      onListen: () => bestDurationColl
          .where('bestDuration', isNull: false)
          .orderBy('bestDuration')
          .limit(1)
          .snapshots()
          .listen(
        (QuerySnapshot<PUser> querySnapshot) {
          if (querySnapshot.docs.isNotEmpty) {
            if (subject.hasValue) {
              final QueryDocumentSnapshot<PUser> x = querySnapshot.docs[0];
              if (subject.value.id != x.id ||
                  subject.value.data().bestDuration! != x.data().bestDuration) {
                subject.add(x);
              }
            } else {
              subject.add(querySnapshot.docs[0]);
            }
          }
        },
      ),
    );
    return subject.stream;
  }
}
