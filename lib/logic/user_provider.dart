import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/board.dart';
import '../model/my_user.dart';
import 'user_datastore.dart';

final myUserProvider = StreamProvider.autoDispose<MyUser?>(
  (ref) {
    final datastore = ref.watch(userDatastoreProvider);
    return datastore.myUser;
  },
);

final AutoDisposeFutureProviderFamily<void, Board> updateStatsProvider =
    FutureProvider.autoDispose.family<void, Board>(
  (ref, board) {
    final datastore = ref.watch(userDatastoreProvider);
    return datastore.updatePlayFriendScore(board);
  },
);

final FutureProviderFamily<MyUser?, String> xUserProvider =
    FutureProvider.family<MyUser?, String>(
  (ref, id) async {
    final datastore = ref.read(userDatastoreProvider);
    return datastore.xUser(id);
  },
);
