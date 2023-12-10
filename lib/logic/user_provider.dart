import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';

import '../model/my_user.dart';
import 'auth_provider.dart';
import 'card_avatar_notifier.dart';
import 'user_datastore.dart';

final Provider<UserDatastore> userDatastoreProvider = Provider<UserDatastore>(
  (ref) {
    final user = ref.watch(authUserProvider).value;
    return UserDatastore(ref, user);
  },
);

final myUserProvider = StreamProvider.autoDispose<MyUser?>(
  (ref) {
    final datastore = ref.watch(userDatastoreProvider);
    return datastore.myUser;
  },
);

final AutoDisposeFutureProviderFamily<void, String> addFriendProvider =
    FutureProvider.autoDispose.family<void, String>(
  (ref, id) async {
    final userDatastore = ref.read(userDatastoreProvider);
    return userDatastore.addFriend(id);
  },
);

final AutoDisposeFutureProviderFamily validateAvatarCodeProvider =
    FutureProvider.autoDispose.family<dynamic, String>(
  (ref, code) async {
    final userDatastore = ref.read(userDatastoreProvider);
    final String? validUser = await userDatastore.validUser(code);
    if (validUser == null) {
      debugPrint("38-- No validUser");
      return false;
    } else {
      debugPrint("40--validUser $validUser");
      final List<String> otherUserAvatarArr =
          await ref.watch(myUserAvatarListProvider(validUser).future);
      debugPrint("44--otherUserAvatarArr $otherUserAvatarArr");
      final List<String> allCards =
          await ref.read(avatarCollectionProvider.future);

      final List<String> remainingCards =
          allCards.toSet().difference(otherUserAvatarArr.toSet()).toList();

      final String newCard = remainingCards.isEmpty
          ? mockString(16)
          : remainingCards[mockInteger(0, remainingCards.length - 1)];

      final userDatastore = ref.read(userDatastoreProvider);
      userDatastore.newAvatar(validUser, newCard);
      return validUser;
    }
  },
);

/*final StreamProvider<MyDuration?> myUserDurationProvider =
    StreamProvider<MyDuration?>(
  (ref) {
    final userDatastore = ref.read(userDatastoreProvider);
    return userDatastore.myUserDuration;
  },
);*/

/*final recentUserCollectionReferenceProvider =
    Provider.autoDispose<Query<PUser>>(
  (ref) {
    final datastore = ref.watch(userDatastoreProvider);
    return datastore.recentUserCollection;
  },
);

final AutoDisposeProvider<CollectionReference<PUser>>
    bestDurationCollReferenceProvider = Provider.autoDispose(
  (ref) {
    final datastore = ref.watch(userDatastoreProvider);
    return datastore.bestDurationColl;
  },
);*/
