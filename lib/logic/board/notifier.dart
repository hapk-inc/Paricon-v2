import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../model/board.dart';
import '../../model/user_log.dart';
import '../app/game_match_bloc.dart';
import '../auth/bloc.dart';
import '../leaderboard/bloc.dart';
import 'create_board.dart';
import 'provider.dart';

Logger _logger = Logger();

final AutoDisposeChangeNotifierProvider<BoardNotifier> boardNotifierProvider =
    AutoDisposeChangeNotifierProvider<BoardNotifier>(
  (ref) {
    final notifier = BoardNotifier(ref);
    if (!ref.read(matchNotifierProvider.notifier).isDailyMatch) {
      return notifier..init;
    }
    return notifier;
  },
);

class BoardNotifier extends ChangeNotifier {
  final Ref ref;
  Board _board = const Board();
  bool _wait = false;
  late Stopwatch _stopwatch;
  late String _me;
  late bool _isDailyMatch;
  int _iconFound = 0;
  bool _everyFound = false;

  BoardNotifier(this.ref) {
    _me = ref.read(authUserProvider).value?.uid ?? "";
    _stopwatch = Stopwatch();
    _isDailyMatch = ref.read(matchNotifierProvider.notifier).isDailyMatch;
    if (_isDailyMatch) {
      _board = Board(icons: CreateBoard.icons());
    }
  }

  Future get init async {
    _board = await ref.watch(initBoardProvider.future);
    notifyListeners();
  }

  bool get wait => _wait;

  set wait(bool value) {
    if (_wait == value) return;
    _wait = value;
    notifyListeners();
  }

  Board? get board => _board;

  Stopwatch get stopwatch => _stopwatch;

  bool get everyFound => _everyFound;

  Future iconClick(String icon) async {
    wait = true;

    if (!_stopwatch.isRunning) {
      _stopwatch.start();
    }
    _board.icons[icon] = _board.icons[icon]!.copyWith(isCheck: true);
    notifyListeners();

    if (_isDailyMatch) {
      await runValidate(icon);
    } else {
      ref.read(updateIconProvider(icon));
    }

    wait = false;
  }

  Future runValidate(String icon) async {
    wait = true;
    bool? validate = await Future.delayed(
      const Duration(milliseconds: 450),
      () {
        final bool? x = _board.updateIcon(icon);
        notifyListeners();
        return x;
      },
    );
    if (validate != null) {
      if (!_isDailyMatch) {
        if (!validate) {
          _board = _board.copyWith(currentID: _board.nextID);
        }
        ref.read(updateBoardProvider(_board));
      }
      if (validate) {
        ++_iconFound;
        _everyFound = _board.everyIconFound;

        if (_everyFound || _isDailyMatch) {
          ref.read(
            updateUserLogProvider(
              UserLog(
                id: _me,
                when: DateTime.now(),
                timeTaken: _stopwatch.elapsed,
              ),
            ),
          );
        }
        if (_everyFound) _stopwatch.stop();
      }
    }
    wait = false;
  }

  double get percentageFound =>
      _board.icons.isEmpty ? 0 : _iconFound / (_board.icons.length ~/ 2);

  changeUser(String next) {
    _board = _board.copyWith(currentID: next);
    notifyListeners();
  }
}
