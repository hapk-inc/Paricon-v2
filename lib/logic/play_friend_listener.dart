import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/board.dart';
import '../model/local_icon.dart';
import '../model/local_player.dart';
import '../theme/my_color.dart';
import 'auth_provider.dart';
import 'board_database.dart';
import 'board_provider.dart';

final AutoDisposeChangeNotifierProvider<PlayFriendListener>
    playFriendNotifierProvider = AutoDisposeChangeNotifierProvider(
  (ref) => PlayFriendListener(ref),
);

class PlayFriendListener extends ChangeNotifier {
  final Ref ref;
  late Board? board;
  late Map<String, LocalIcon> _icons;
  late Map<String, LocalPlayer> _players;
  late bool _inWait;
  late bool _allFound;

  late Stopwatch _stopwatch;
  double _balancePercentage = 0.0;
  bool _alreadyClicked = true;

  PlayFriendListener(this.ref) {
    board = ref.read(boardProvider).when(
          data: (d) {
            if (d != null) {
              _icons = Map<String, LocalIcon>.from(d.icons);
              _players = Map<String, LocalPlayer>.from(d.players);
            }
            return d;
          },
          error: (_, s) => null,
          loading: () => null,
        );
    _stopwatch = Stopwatch();
    _stopwatch.start();
    _inWait = false;
    _allFound = false;
  }

  double get balancePercentage => _balancePercentage;

  Stopwatch get stopwatch => _stopwatch;

  bool get allFound => _allFound;

  bool get inWait => _inWait;

  Map<String, LocalIcon> get icons => _icons;

  Map<String, LocalPlayer> get players => _players;

  finalCut() {
    board = board!.copyWith(icons: _icons, players: _players);
    notifyListeners();
  }

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
    final user = ref.read(authUserProvider).value;
    final Map<String, LocalIcon> z = Map<String, LocalIcon>.from(_icons);
    final boardDatabase = ref.read(boardDatabaseProvider);
    z.removeWhere((key, value) => !value.isCheck);

    debugPrint("75--$z");
    final bool validCheck = z.length > 1 &&
        z.values
            .every((element) => element.iconCode == z.values.first.iconCode);
    if (validCheck) {
      for (String y in z.keys) {
        _icons[y] = _icons[y]!.copyWith(
            isCheck: false, isFound: true, color: _players[user!.uid]!.color);
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
    await boardDatabase.updateBoard(
      z,
      addPts: validCheck,
      nextPlayer: !validCheck ? await changeNextPlayer : null,
    );
  }

  Map<String, dynamic> get colorMap => {
        "blue": {"tile": uranianBlue, "icon": federalBlue},
        "yellow": {"tile": xantHous, "icon": federalBlue},
        "green": {"tile": aquamarine, "icon": federalBlue},
      };

  Future<String> get changeNextPlayer async {
    debugPrint("changeNextPlayer");
    final String prevPlayer = await ref.read(currentIDProvider.future);
    List<String> pList = List.from(_players.keys);
    int prevIndex = pList.indexOf(prevPlayer);
    return _players.keys.length == 1
        ? pList.first
        : pList.length == (prevIndex + 1)
            ? pList.first
            : pList[prevIndex + 1];
  }

  setIcon(String id, LocalIcon localIcon) {
    _icons[id] = localIcon;
    int iconFoundCount =
        _icons.values.where((element) => element.isFound).length;
    _balancePercentage = iconFoundCount / _icons.length;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _stopwatch.stop();
  }
}
