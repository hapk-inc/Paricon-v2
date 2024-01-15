import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paricon/logic/board_database.dart';

import '../model/board.dart';
import '../model/local_icon.dart';
import 'board_provider.dart';

final AutoDisposeChangeNotifierProvider<PlayFriendListener>
    playFriendNotifierProvider =
    AutoDisposeChangeNotifierProvider((ref) => PlayFriendListener(ref));

class PlayFriendListener extends ChangeNotifier {
  final Ref ref;
  late Board? board;
  late Map<String, LocalIcon> _icons;
  late bool _inWait;
  late bool _allFound;

  late Stopwatch _stopwatch;
  double _balancePercentage = 0.0;
  bool _alreadyClicked = true;

  PlayFriendListener(this.ref) {
    board = ref.read(boardProvider).when(
          data: (d) {
            if (d != null) {
              _icons = Map.from(d.icons);
            }
            return d;
          },
          error: (_, s) {
            debugPrintStack(stackTrace: s);
            return null;
          },
          loading: () => null,
        );
    _stopwatch = Stopwatch();
    _stopwatch.start();
    _inWait = false;
    _allFound = false;
  }

  bool get allFound => _allFound;

  bool get inWait => _inWait;

  Map<String, LocalIcon> get icons => _icons;

  void iconClick(String i) async {
    final boardDatabase = ref.read(boardDatabaseProvider);

    _icons[i] = _icons[i]!.copyWith(isCheck: true);
    await boardDatabase.setIconCheck(i, true);

    _alreadyClicked = !_alreadyClicked;

    if (_alreadyClicked) {
      _inWait = true;
      notifyListeners();
      await Future.delayed(
        const Duration(milliseconds: 600),
        () async => await validCheck,
      );
    }
    _inWait = false;
    notifyListeners();
  }

  Future get validCheck async {
    final Map<String, LocalIcon> z = Map<String, LocalIcon>.from(_icons);
    final boardDatabase = ref.read(boardDatabaseProvider);
    z.removeWhere((key, value) => !value.isCheck);

    debugPrint("75--$z");
    final bool validCheck = z.values
        .every((element) => element.iconCode == z.values.first.iconCode);
    if (validCheck) {
      for (String y in z.keys) {
        _icons[y] = _icons[y]!.copyWith(
          isCheck: false,
          isFound: true,
          //color: board?.players[user!.uid].color;
          color: 0,
        );
        z[y] = _icons[y]!;
      }
      // await boardDatabase.increment(user!.uid);
    } else {
      for (String y in z.keys) {
        _icons[y] = _icons[y]!.copyWith(isCheck: false);
        z[y] = _icons[y]!;
      }
    }
    debugPrint("95--$z");
    await boardDatabase.updateBoard(z, addPts: validCheck);
  }
}
