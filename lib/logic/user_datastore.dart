import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../model/avatar_card.dart';
import '../model/my_duration.dart';
import '../model/my_user.dart';
import 'auth.dart';
import 'firebase_init.dart';

final Provider<UserDatastore> userDatastoreProvider =
    Provider<UserDatastore>((ref) => UserDatastore(ref));

final myUserProvider = FutureProvider.autoDispose<MyUser>(
  (ref) async {
    final user = ref.read(firebaseUserProvider);
    final datastore = ref.read(userDatastoreProvider);
    /*await ref.read(updateDurationProvider.future).catchError((e, s) {
      debugPrintStack(stackTrace: s);
    });*/
    return datastore.myUser(user.uid);
  },
);

final StreamProvider avatarIDProvider = StreamProvider<String>(
  (ref) {
    final datastore = ref.read(userDatastoreProvider);
    return datastore.avatarID;
  },
);

final StreamProvider<DateTime> todayDateTimeProvider = StreamProvider<DateTime>(
  (_) async* {
    // DateTime currentTime = DateTime.now();
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield DateTime.now();
    }
  },
);

final xUserProvider = FutureProvider.family<MyUser, String>(
  (ref, id) {
    final datastore = ref.read(userDatastoreProvider);
    return datastore.myUser(id);
  },
);

final updateDurationProvider = FutureProvider.autoDispose(
  (ref) {
    final datastore = ref.read(userDatastoreProvider);
    return datastore.updateDuration;
  },
);

class UserDatastore {
  final Ref ref;

  late CollectionReference userColl;
  //late DatabaseReference databaseReference;

  late FirebaseFirestore firebaseFirestore;
  late String? userId;

  UserDatastore(this.ref) {
    firebaseFirestore = ref.read(fireStoreProvider);
    userColl = firebaseFirestore.collection('users');
    userId = ref.read(firebaseUserProvider).uid;

    //databaseReference = ref.read(databaseProvider).ref();
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
      await documentReference.update(
          MyDuration(currentTime: now, appVersion: appVersion).toJson());
    } else {
      await documentReference.update(MyDuration(
        currentTime: now,
        appVersion: appVersion,
        lastOpened: myDuration.currentTime,
      ).toJson());
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

  CollectionReference<MyUser> get recentUserCollection {
    final xUsers = userColl;
    return xUsers.withConverter(
        fromFirestore: (snapshot, _) => MyUser.fromJson(snapshot.data()!),
        toFirestore: (x, _) => x.toJson());
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
}

final AutoDisposeProvider<CollectionReference<MyUser>>
    recentUserCollectionReference = Provider.autoDispose(
  (ref) {
    final datastore = ref.read(userDatastoreProvider);
    return datastore.recentUserCollection;
  },
);

final AutoDisposeProvider<CollectionReference<AvatarCard>>
    avatarCardCollectionReference = Provider.autoDispose(
  (ref) {
    final datastore = ref.watch(userDatastoreProvider);
    return datastore.avatarCardCollection;
  },
);
