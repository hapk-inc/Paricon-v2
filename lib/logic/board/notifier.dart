import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../model/board.dart';
import '../app/game_match_bloc.dart';
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

  late Board _board;

  bool _wait = false;

  late Stopwatch _stopwatch;
  late String _me;
  late bool _isDailyMatch;
  int _iconFound = 0;

  late bool _alreadyClicked;

  bool _everyFound = false;

  BoardNotifier(this.ref) {
    _logger.d("initializeBoard");
    _me = ref.read(authUserProvider).value?.uid ?? "";
    _stopwatch = Stopwatch();
    _alreadyClicked = true;
    _isDailyMatch = ref.watch(matchNotifierProvider.notifier).isDailyMatch;

    if (_isDailyMatch) {
      _board = Board(
        currentID: _me,
        icons: CreateBoard.icons,
        players: CreateBoard.localPlayers({_me: ref.watch(meProvider).value}),
      );
    }
  }

  Board get board => _board;

  Stopwatch get stopwatch => _stopwatch;

  Future iconClick(String i) async {
    _wait = true;

    if (!_stopwatch.isRunning) {
      _stopwatch.start();
    }

    board.icons[i] = board.icons[i]!.copyWith(isCheck: true);
    _alreadyClicked = !_alreadyClicked;
    notifyListeners();

    if (_alreadyClicked) {
      final bool validate = await validateIcon;
      if (validate) {
        ++_iconFound;
        _everyFound = board.everyIcon;
      }
    }
    _wait = false;
    notifyListeners();
  }

  Future<bool> get validateIcon async => Future.delayed(
        const Duration(milliseconds: 750),
        () {
          final x = board.updateIcon(_isDailyMatch);
          notifyListeners();
          return x;
        },
      );

  bool get wait => _wait;

  set wait(bool value) {
    if (_wait == value) return;
    notifyListeners();
  }

  double get percentageFound {
    _logger.i("IconFound $_iconFound");
    _logger.i("Percentage ${_iconFound / board.icons.length}");
    return _iconFound / (board.icons.length / 2);
  }

  bool get everyFound => _everyFound;
}
