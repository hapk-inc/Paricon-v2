import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paricon/logic/auth_provider.dart';

import '../model/my_duration.dart';
import '../model/my_user.dart';
import '../model/p_user.dart';
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

final recentUserCollectionReferenceProvider =
    Provider.autoDispose.family<Query<PUser>, num>(
  (ref, id) {
    final datastore = ref.watch(userDatastoreProvider);
    return datastore.recentUserCollection(id);
  },
);

final AutoDisposeProvider<CollectionReference<PUser>>
    bestDurationCollReferenceProvider = Provider.autoDispose(
  (ref) {
    final datastore = ref.watch(userDatastoreProvider);
    return datastore.bestDurationColl;
  },
);

final StreamProvider<MyDuration?> myUserDurationProvider =
    StreamProvider<MyDuration?>(
  (ref) {
    final userDatastore = ref.read(userDatastoreProvider);
    return userDatastore.myUserDuration;
  },
);
