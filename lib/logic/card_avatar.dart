import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/user_datastore.dart';
import 'package:paricon/model/my_user.dart';

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

final AutoDisposeFutureProvider<List<String>> avatarCollectionProvider =
    FutureProvider.autoDispose(
  (ref) {
    final cardNotifier = ref.read(cardNotifierProvider);
    return cardNotifier.avatarCollection();
  },
);

final AutoDisposeFutureProviderFamily<void, String> setCardAvatarProvider =
    FutureProvider.autoDispose.family(
  (ref, docID) async {
    final MyUser myUser = await ref.read(myUserProvider.future);

    final List<String> myCards = myUser.myCards;

    final List<String> allCards =
        await ref.read(avatarCollectionProvider.future);

    final List<String> remainingCards =
        allCards.toSet().difference(myCards.toSet()).toList();

    final String randomPickCard =
        remainingCards[mockInteger(0, remainingCards.length - 1)];

    final datastore = ref.read(userDatastoreProvider);
    return datastore.setNewCardCollection(docID, randomPickCard);
  },
);
