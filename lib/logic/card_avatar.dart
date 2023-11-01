import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';

import '../model/p_user.dart';
import 'card_avatar_notifier.dart';
import 'user_provider.dart';

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
    //final MyUser myUser = await ref.read(myUserProvider.future);
    final PUser pUser = await ref.read(pUserMeProvider.future);
    //final List<String> myCards = myUser.myCards;
    final List<String> myCards = pUser.myUser.myCards;

    final List<String> allCards =
        await ref.read(avatarCollectionProvider.future);

    final List<String> remainingCards =
        allCards.toSet().difference(myCards.toSet()).toList();

    final String randomPickCard =
        remainingCards[mockInteger(0, remainingCards.length - 1)];

    final datastore = ref.read(userDatastoreProvider);
    return datastore.newCard(docID, randomPickCard);
  },
);
