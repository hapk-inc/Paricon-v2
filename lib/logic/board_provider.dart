import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/board.dart';
import '../model/local_icon.dart';
import 'board_database.dart';

final AutoDisposeFutureProvider<Board?> boardProvider =
    FutureProvider.autoDispose<Board?>(
  (ref) async {
    final boardDatabase = ref.watch(boardDatabaseProvider);
    return Future.delayed(
        const Duration(seconds: 1), () => boardDatabase.board);
  },
);

final AutoDisposeStreamProviderFamily<LocalIcon, String> iconProvider =
    StreamProvider.family.autoDispose<LocalIcon, String>(
  (ref, icon) {
    final boardDatabase = ref.watch(boardDatabaseProvider);
    return boardDatabase.localIcon(icon);
  },
);
