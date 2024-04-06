import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../enums/enums.dart';
import '../../model/board.dart';
import '../auth/bloc.dart';
import '../user/bloc.dart';
import 'create_board.dart';

Logger _logger = Logger();

final ChangeNotifierProvider<BoardNotifier> boardNotifierProvider =
    ChangeNotifierProvider<BoardNotifier>(
  (ref) => BoardNotifier(ref),
);

class BoardNotifier extends ChangeNotifier {
  final Ref ref;

  final bool isOnline;
  late Board _board;

  bool _allFound = false;
  bool _wait = false;
  double _percentage = 0.0;
  late Stopwatch _stopwatch;
  late String _me;

  late bool _alreadyClicked;

  BoardNotifier(this.ref, {this.isOnline = false}) {
    _logger.d("initializeBoard");
    _me = ref.watch(authUserProvider).value?.uid ?? "";
    if (!isOnline) {
      _board = Board(
        currentID: _me,
        icons: CreateBoard.icons,
        players: CreateBoard.localPlayers({_me: ref.watch(meProvider).value}),
      );
    }
  }

  Board get board => _board;

  iconClick(String i) async {
    board.icons[i] = board.icons[i]!.copyWith(isCheck: true);
    notifyListeners();
  }
}
