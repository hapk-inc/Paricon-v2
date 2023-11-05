import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/my_user.dart';
import '../model/t_score.dart';
import 'auth_provider.dart';
import 'firebase_init.dart';
import 'user_provider.dart';

final tournamentDatabaseProvider = Provider((ref) => TournamentDatabase(ref));

class TournamentDatabase {
  final Ref ref;

  late DatabaseReference firebaseReference;
  late FirebaseFirestore firebaseFirestore;
  late String? userId;
  late DatabaseReference tournamentReference;
  late DocumentReference userDoc;

  TournamentDatabase(this.ref) {
    firebaseFirestore = ref.read(fireStoreProvider);
    firebaseReference = ref.read(databaseProvider).ref();

    userId = ref.read(authUserProvider).value!.uid;
    tournamentReference = firebaseReference.child('tournament');
    if (userId != null) {
      userDoc = firebaseFirestore.collection('users').doc(userId);
    }
  }

  Future<void> updateTDuration(TScore tScore) async {
    final MyUser? myUser = await ref.read(myUserProvider.future);
    tournamentReference.push().set(tScore.toJson());
    if (myUser == null || userId == null) return;
    return userDoc.update(
      {
        'lastGamePlayed': tScore.playedAt.toIso8601String(),
        'bestDuration': myUser.bestDuration == null
            ? tScore.tDuration.inMicroseconds
            : myUser.bestDuration!.compareTo(tScore.tDuration) > 0
                ? tScore.tDuration.inMicroseconds
                : myUser.bestDuration?.inMicroseconds,
        'tournamentPlayed': FieldValue.increment(1),
      },
    );
  }
}
