import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/board.dart';
import '../model/local_icon.dart';
import '../model/local_player.dart';
import 'board_database.dart';

final AutoDisposeFutureProvider<Board?> boardProvider =
    FutureProvider.autoDispose<Board?>(
  (ref) async {
    final boardDatabase = ref.watch(boardDatabaseProvider);
    return boardDatabase.board;
  },
);

final AutoDisposeStreamProviderFamily<LocalIcon, String> iconProvider =
    StreamProvider.family.autoDispose<LocalIcon, String>(
  (ref, icon) {
    final boardDatabase = ref.read(boardDatabaseProvider);
    return boardDatabase.localIcon(icon);
  },
);

final AutoDisposeStreamProviderFamily<LocalPlayer, String>
    playFriendPlayerProvider =
    StreamProvider.family.autoDispose<LocalPlayer, String>(
  (ref, p) {
    final boardDatabase = ref.read(boardDatabaseProvider);
    return boardDatabase.localPlayer(p);
  },
);

final AutoDisposeStreamProvider<String> currentIDProvider =
    StreamProvider.autoDispose<String>(
  (ref) {
    final boardDatabase = ref.read(boardDatabaseProvider);
    return boardDatabase.currentID;
  },
);
