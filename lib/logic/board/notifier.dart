import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:paricon/model/local_icon.dart';

import '../../model/board.dart';
import '../../model/user_log.dart';
import '../app/game_match_bloc.dart';
import '../auth/bloc.dart';
import '../leaderboard/bloc.dart';

import 'create_board.dart';
import 'provider.dart';

Logger _logger = Logger();

final ChangeNotifierProvider<BoardNotifier> boardNotifierProvider =
    ChangeNotifierProvider<BoardNotifier>(
  (ref) {
    final notifier = BoardNotifier(ref);
    if (!ref.read(matchNotifierProvider.notifier).isDailyMatch) {
      return notifier..initFriendBoard;
    }
    return notifier;
  },
);

class BoardNotifier extends ChangeNotifier {
  final Ref ref;

  Board? _board;

  bool _wait = false;

  late Stopwatch _stopwatch;
  late String _me;
  late bool _isDailyMatch;
  int _iconFound = 0;
  bool _ifYouAreCreator = false;

  late bool _alreadyClicked;

  bool _everyFound = false;

  BoardNotifier(this.ref) {
    _logger.d("initializeBoard");
    _me = ref.read(authUserProvider).value?.uid ?? "";
    _stopwatch = Stopwatch();
    _alreadyClicked = true;
    _isDailyMatch = ref.read(matchNotifierProvider.notifier).isDailyMatch;

    if (_isDailyMatch) {
      _board = Board(icons: CreateBoard.icons());
    }
  }

  @override
  void addListener(VoidCallback listener) {
    if (!_isDailyMatch) {
      ref.listen(
        onIconChangedProvider.select((value) => value.value),
        (previous, next) async {
          if (next != null) {
            wait = true;

            if (next.value.isCheck ?? false) {
              _board?.icons[next.key] = next.value;
              if (_alreadyClicked) await runValidate();
              notifyListeners();
            }
            wait = false;
          }
        },
      );
    }
    super.addListener(listener);
  }

  Future get initFriendBoard async {
    debugPrint("78--");
    _board = await ref.watch(initBoardProvider.future);
    notifyListeners();
  }

  Board? get board => _board;

  Stopwatch get stopwatch => _stopwatch;

  Future iconClick(String i) async {
    if (_board == null) return;
    wait = true;

    if (!_stopwatch.isRunning) {
      _stopwatch.start();
    }

    _board!.icons[i] = _board!.icons[i]!.copyWith(isCheck: true);
    _alreadyClicked = !_alreadyClicked;
    notifyListeners();

    if (_isDailyMatch) {
      runValidate();
    } else {
      ref.read(updateIconProvider(i));
    }
    wait = false;
  }

  Future runValidate() async {
    if (_alreadyClicked) {
      final bool validate = await validateIcon;
      if (validate) {
        ++_iconFound;
        everyFound = board?.everyIcon ?? false;
        _logger.i("72--$everyFound");
        if (everyFound) {
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
      }
      if (!_isDailyMatch) ref.read(updateBoardProvider(board));
    }
  }

  Future<bool> get validateIcon async => Future.delayed(
        const Duration(milliseconds: 750),
        () {
          final x = board?.updateIcon(_isDailyMatch);
          notifyListeners();
          return x ?? false;
        },
      );

  bool get wait => _wait;

  set wait(bool value) {
    if (_wait == value) return;
    notifyListeners();
  }

  double get percentageFound => (board?.icons ?? {}).isEmpty
      ? 0
      : _iconFound / (board?.icons.length ?? 30 ~/ 2);

  bool get everyFound => _everyFound;

  set everyFound(bool value) {
    if (_everyFound == value) return;
    _everyFound = value;
    notifyListeners();
  }
}
