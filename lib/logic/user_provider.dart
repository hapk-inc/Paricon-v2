import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/board.dart';
import '../model/my_user.dart';
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

final AutoDisposeFutureProviderFamily<void, Board> updateStatsProvider =
    FutureProvider.autoDispose.family<void, Board>(
  (ref, board) {
    final datastore = ref.watch(userDatastoreProvider);
    return datastore.updatePlayFriendScore(board);
  },
);
