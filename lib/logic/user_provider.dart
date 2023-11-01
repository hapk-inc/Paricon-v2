import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paricon/logic/auth.dart';

import '../model/avatar_card.dart';
import '../model/p_user.dart';
import 'user_datastore.dart';

final Provider<UserDatastore> userDatastoreProvider =
    Provider<UserDatastore>((ref) => UserDatastore(ref));

final AutoDisposeStreamProvider<PUser> pUserMeProvider =
    StreamProvider.autoDispose(
  (ref) {
    final datastore = ref.read(userDatastoreProvider);
    final firebaseUser = ref.read(firebaseUserProvider);
    return datastore.pUserMe(firebaseUser.uid);
  },
);

final Provider<CollectionReference<PUser>>
    recentUserCollectionReferenceProvider = Provider(
  (ref) {
    final datastore = ref.watch(userDatastoreProvider);
    return datastore.recentUserCollection;
  },
);

final AutoDisposeFutureProvider updateDurationProvider =
    FutureProvider.autoDispose(
  (ref) {
    final datastore = ref.watch(userDatastoreProvider);
    debugPrint("32--");
    return datastore.updateDuration;
  },
);

final AutoDisposeProvider<CollectionReference<AvatarCard>>
    avatarCardCollectionReferenceProvider = Provider.autoDispose(
  (ref) {
    final datastore = ref.watch(userDatastoreProvider);
    return datastore.avatarCardCollection;
  },
);
