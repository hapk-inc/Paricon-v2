import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/p_user.dart';
import 'user_provider.dart';

final StreamProvider<QueryDocumentSnapshot<PUser>> firstRankProvider =
    StreamProvider<QueryDocumentSnapshot<PUser>>(
  (ref) {
    final datastore = ref.watch(userDatastoreProvider);
    return datastore.firstRank;
  },
);
