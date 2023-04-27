import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/my_duration.dart';
import '../model/my_user.dart';
import 'auth.dart';
import 'firebase_init.dart';

final Provider<UserDatastore> userDatastoreProvider =
    Provider<UserDatastore>((ref) => UserDatastore(ref));

final myUserProvider = FutureProvider.autoDispose<MyUser>(
  (ref) {
    final user = ref.read(firebaseUserProvider);
    // final user = "";
    final datastore = ref.read(userDatastoreProvider);
    return datastore.myUser(user.uid);
  },
);

final xUserProvider = FutureProvider.autoDispose.family<MyUser, String>(
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
  late CollectionReference tourColl;
  late FirebaseFirestore firebaseFirestore;
  late String? userId;

  UserDatastore(this.ref) {
    firebaseFirestore = ref.read(fireStoreProvider);
    userColl = firebaseFirestore.collection('users');
    //tourColl = firebaseFirestore.collection('tournament');
    //userId = ref.read(freakUserStateNotifier.notifier).state?.uid;

    //final now = DateFormat.yMMMd().format(DateTime.now());
    //todayColl = firebaseFirestore.collection(now);
  }

  Future<MyUser> myUser(String id) => userColl.doc(id).get().then(
        (DocumentSnapshot documentSnapshot) {
          Map map = documentSnapshot.data() as Map;
          if (kDebugMode) {
            print("Future<MyUser> $map");
          }
          Map<String, dynamic> json = Map<String, dynamic>.from(map);
          return MyUser.fromJson(json);
        },
      );

  Future get updateDuration async {
    final String id = ref.read(firebaseUserProvider).uid;
    DocumentReference<MyDuration> documentReference = userColl
        .doc(id)
        .withConverter(
          fromFirestore: (snapshot, _) => MyDuration.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );

    return await firebaseFirestore.runTransaction(
      (transaction) async {
        DocumentSnapshot<MyDuration> snapshot =
            await transaction.get<MyDuration>(documentReference);
        if (snapshot.data() == null) {
          transaction.update(documentReference,
              MyDuration(currentTime: DateTime.now()).toJson());
        } else {
          transaction.update(
            documentReference,
            MyDuration(
                    currentTime: DateTime.now(),
                    lastOpened: snapshot.data()!.currentTime)
                .toJson(),
          );
        }
      },
    );
  }
}
