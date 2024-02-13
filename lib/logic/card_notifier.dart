import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';

import '../model/my_user.dart';
import 'firebase_init.dart';
import 'user_activity_database.dart';
import 'user_datastore.dart';
import 'user_provider.dart';

class CardAvatarNotifier {
  final Ref ref;

  late DatabaseReference firebaseReference;

  CardAvatarNotifier(this.ref) {
    firebaseReference = ref.read(databaseProvider).ref();
  }

  Future<List<String>> avatarCollection(
      {List<String> coll = const ['n_male', 'n_female']}) async {
    final List q = await Future.wait(
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
    return z;
  }

  Future<String> oneCard(List<String> myCardArr) async {
    final List<String> x = await avatarCollection();

    final List<String> remainingCards =
        x.toSet().difference(myCardArr.toSet()).toList();

    final String oneCard = remainingCards.isEmpty
        ? mockString(16)
        : remainingCards[mockInteger(0, remainingCards.length - 1)];
    return oneCard;
  }
}

//======================================================================//

final Provider<CardAvatarNotifier> cardNotifierProvider =
    Provider<CardAvatarNotifier>((ref) => CardAvatarNotifier(ref));

/*final AutoDisposeFutureProvider<List<String>> avatarCollectionProvider =
    FutureProvider.autoDispose(
  (ref) {
    final cardNotifier = ref.read(cardNotifierProvider);
    return cardNotifier.avatarCollection();
  },
);*/

/*final AutoDisposeFutureProviderFamily newCardArrProvider =
    FutureProvider.autoDispose.family<void, String>(
  (ref, value) async {
    final datastore = ref.read(userDatastoreProvider);
    return datastore.newCardArr(value);
  },
);*/

final AutoDisposeFutureProviderFamily setAvatarProvider =
    FutureProvider.autoDispose.family<void, String>(
  (ref, value) async {
    final datastore = ref.read(userDatastoreProvider);
    datastore.setAvatar(value);

    final database = ref.read(userDatabaseProvider);
    database.setAvatar(value);
  },
);

/*final AutoDisposeFutureProviderFamily oneCardProvider =
    FutureProvider.autoDispose.family<void, String>(
  (ref, docID) async {
    debugPrint("83--$docID");
    final MyUser? myUser = ref.watch(myUserProvider).value;
    if (myUser != null) {
      debugPrint("87--");
      final String oneCard =
          await ref.watch(cardNotifierProvider).oneCard(myUser.avatarArr);
      debugPrint("98--$oneCard");
      await ref.read(newCardArrProvider(oneCard).future);
      if (docID.isEmpty) {
        await ref.read(userDatabaseProvider).setAvatar(oneCard);
        await ref.read(userDatastoreProvider).setAvatar(oneCard);
      } else {
        await ref.read(userDatabaseProvider).passAvatarUpdate(docID, oneCard);
      }
    }
  },
);*/
