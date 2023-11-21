import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/my_user.dart';
//import '../model/p_user.dart';
import 'auth_provider.dart';
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

final AutoDisposeFutureProvider<bool> appOpenedOrLoggedInProvider =
    FutureProvider.autoDispose<bool>(
  (ref) async {
    final userDatastore = ref.read(userDatastoreProvider);
    return await userDatastore.appOpenedOrLoggedIn;
  },
);

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

final AutoDisposeFutureProviderFamily<void, String> addFriendProvider =
    FutureProvider.autoDispose.family<void, String>(
  (ref, id) async {
    final userDatastore = ref.read(userDatastoreProvider);
    return userDatastore.addFriend(id);
  },
);

final AutoDisposeFutureProviderFamily<void, bool> setActiveProvider =
    FutureProvider.autoDispose.family<void, bool>(
  (ref, flag) async {
    final userDatastore = ref.read(userDatastoreProvider);
    return userDatastore.setActive(flag);
  },
);

/*final StreamProvider<MyDuration?> myUserDurationProvider =
    StreamProvider<MyDuration?>(
  (ref) {
    final userDatastore = ref.read(userDatastoreProvider);
    return userDatastore.myUserDuration;
  },
);*/
