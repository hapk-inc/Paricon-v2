import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_init.dart';

class CardAvatarNotifier {
  final Ref ref;

  late DatabaseReference firebaseReference;

  CardAvatarNotifier(this.ref) {
    firebaseReference = ref.read(databaseProvider).ref();
  }

  Future<List<String>> avatarCollection(
      {List<String> coll = const ['n_male', 'n_female']}) async {
    final q = await Future.wait(
      coll.map(
        (e) => firebaseReference.child(e).once().then(
          (databaseEvent) {
            final List a = databaseEvent.snapshot.value as List;
            return a;
          },
        ),
      ),
    );

    List y = q.expand((element) => element).toList();
    List<String> z = y.map((e) => e.toString()).toList();
    debugPrint(z.length.toString());
    return z;
  }
}

final Provider<CardAvatarNotifier> cardNotifierProvider =
    Provider<CardAvatarNotifier>(
  (ref) => CardAvatarNotifier(ref),
);
