import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';

import '../model/my_duration.dart';
import '../model/my_user.dart';
import '../model/t_score.dart';
import 'auth.dart';
import 'firebase_init.dart';

class BotDatastore {
  final Ref ref;

  late CollectionReference userColl;
  late CollectionReference tourColl;
  late FirebaseFirestore firebaseFirestore;

  BotDatastore(this.ref) {
    firebaseFirestore = ref.read(fireStoreProvider);
    userColl = firebaseFirestore.collection('users');
    tourColl = firebaseFirestore.collection('tournament');
  }

  Future get updateBot async {
    final String id = ref.read(firebaseUserProvider).uid;
    return userColl
        .where('isHuman', isEqualTo: false)
        .where('controlledBy', arrayContains: id)
        .get()
        .then(
      (QuerySnapshot snapshot) async {
        if (snapshot.docs.isEmpty) {
          print("Creating New Bot");
          try {
            String? pendingUser = await checkControllerCount;
            if (pendingUser == null) {
              createBot;
            } else {
              await userColl.doc(pendingUser).update(
                {
                  'controllerCount': FieldValue.increment(1),
                  'controlledBy': FieldValue.arrayUnion([id]),
                },
              );
            }
          } catch (e) {
            print(e);
          }
        } else {
          final String botId = snapshot.docs[0].id;
          if (!kDebugMode) {
            tourColl.where('userId', isEqualTo: botId).limit(1).get().then(
              (QuerySnapshot snapshot) {
                tourColl.doc(snapshot.docs[0].id).update({
                  'tDuration': FieldValue.increment(-mockInteger(10000, 300000))
                });
              },
            );
          }

          //Map map = snapshot.docs[0].data() as Map;
          //Map<String,dynamic> json = Map<String,dynamic>.from(map);
          //MyUser myUser = MyUser.fromJson(json);
        }
      },
    );
  }

  Future get createBot async {
    final String uid = ref.read(firebaseUserProvider).uid;

    final String botId = mockString(12);
    final num id = mockInteger(100000, 999999);

    userColl.doc(botId).set({
      ...MyUser(
              name: mockName(),
              controlledBy: [uid],
              controllerCount: 1,
              id: id,
              avatar: mockString(8),
              isActive: true,
              isHuman: false)
          .toJson(),
      ...MyDuration(currentTime: DateTime.now()).toJson()
    });

    final TScore tScore = TScore(
      userId: botId,
      playedAt: DateTime.now(),
      tDuration: Duration(
        minutes: mockInteger(5, 6),
        seconds: mockInteger(0, 59),
        milliseconds: mockInteger(10, 40),
      ),
    );

    tourColl.doc(mockString(12)).set(tScore.toJson());
  }

  Future<String?> get checkControllerCount async {
    return await userColl
        .where('isHuman', isEqualTo: false)
        .where('controllerCount', isLessThan: 3)
        .limit(1)
        .get()
        .then((QuerySnapshot snapshot) {
      return snapshot.size == 0 ? null : snapshot.docs[0].id;
    });
  }
}

final Provider<BotDatastore> myBotDatastoreProvider =
    Provider<BotDatastore>((ref) => BotDatastore(ref));

final updateBotProvider = FutureProvider.autoDispose(
  (ref) {
    final datastore = ref.read(myBotDatastoreProvider);
    return datastore.updateBot;
  },
);
