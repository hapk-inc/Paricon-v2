import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/board.dart';
import '../../model/local_icon.dart';
import '../../model/room.dart';
import '../room/bloc.dart';
import 'database.dart';
import 'notifier.dart';

final Provider<BoardDatabase> boardDatabaseProvider = Provider<BoardDatabase>(
  (ref) {
    final id = ref.watch(idNotifier);
    return BoardDatabase(ref, id);
  },
);

final AutoDisposeFutureProvider createPlayFriendBoardProvider =
    FutureProvider.autoDispose(
  (ref) async {
    final boardDatabase = ref.read(boardDatabaseProvider);
    final Room room = ref.read(roomProvider).value!;
    return boardDatabase.createBoard(room);
  },
);

final FutureProvider<Board> initBoardProvider = FutureProvider<Board>(
  (ref) {
    final boardDatabase = ref.read(boardDatabaseProvider);
    return boardDatabase.initBoard;
  },
);

/*final StreamProviderFamily<LocalIcon, String> iconProvider =
    StreamProvider.family<LocalIcon, String>(
  (ref, icon) {
    final boardDatabase = ref.read(boardDatabaseProvider);
    return boardDatabase.localIcon(icon);
  },
);*/

final AutoDisposeFutureProviderFamily updateIconProvider =
    FutureProvider.autoDispose.family<void, String>(
  (ref, icon) {
    final boardDatabase = ref.read(boardDatabaseProvider);
    final boardNotifier = ref.read(boardNotifierProvider);
    return boardDatabase.updateIcon(icon, boardNotifier.board!.icons[icon]!);
  },
);

final AutoDisposeFutureProviderFamily updateBoardProvider =
    FutureProvider.autoDispose.family<void, Board>(
  (ref, board) {
    final boardDatabase = ref.read(boardDatabaseProvider);
    return boardDatabase.updateBoard(board);
  },
);

final StreamProvider<MapEntry<String, LocalIcon>> onIconChangedProvider =
    StreamProvider<MapEntry<String, LocalIcon>>(
  (ref) {
    final boardDatabase = ref.read(boardDatabaseProvider);
    return boardDatabase.onIconChanged;
  },
);
