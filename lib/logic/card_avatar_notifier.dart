import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';

import '../model/my_user.dart';
import 'auth_provider.dart';
import 'card_notifier_provider.dart';
import 'user_provider.dart';

final Provider<CardAvatarNotifier> cardNotifierProvider =
    Provider<CardAvatarNotifier>((ref) => CardAvatarNotifier(ref));

final AutoDisposeFutureProvider<List<String>> avatarCollectionProvider =
    FutureProvider.autoDispose(
  (ref) {
    final cardNotifier = ref.read(cardNotifierProvider);
    return cardNotifier.avatarCollection();
  },
);

final AutoDisposeFutureProviderFamily<List<String>, String>
    myUserAvatarListProvider =
    FutureProvider.autoDispose.family<List<String>, String>(
  (ref, userID) async {
    debugPrint("55--myUserAvatarListProvider");
    final User? user = ref.watch(authUserProvider).value;
    if (user!.uid == userID) {
      final MyUser? myUser = await ref.read(myUserProvider.future);
      return myUser == null ? [] : myUser.avatarArr;
    } else {
      debugPrint("63--");
      final datastore = ref.read(userDatastoreProvider);
      return datastore.userAvatarArr(userID);
    }
  },
);

final FutureProviderFamily<MyUser?, String> xUserProvider =
    FutureProvider.family<MyUser?, String>(
  (ref, id) async {
    final datastore = ref.read(userDatastoreProvider);
    return datastore.xUser(id);
  },
);

final AutoDisposeFutureProvider<String> newCardAvatarProvider =
    FutureProvider.autoDispose(
  (ref) async {
    final MyUser? myUser = await ref.read(myUserProvider.future);
    final List<String> myCards = myUser == null ? [] : myUser.avatarArr;

    final List<String> allCards =
        await ref.read(avatarCollectionProvider.future);

    final List<String> remainingCards =
        allCards.toSet().difference(myCards.toSet()).toList();

    return remainingCards.isEmpty
        ? mockString(16)
        : remainingCards[mockInteger(0, remainingCards.length - 1)];
  },
);

final AutoDisposeFutureProviderFamily<void, String> setCardAvatarProvider =
    FutureProvider.autoDispose.family(
  (ref, docID) async {
    final datastore = ref.read(userDatastoreProvider);

    final String rString = await ref.read(newCardAvatarProvider.future);
    return datastore.newCard(docID, rString);
  },
);
