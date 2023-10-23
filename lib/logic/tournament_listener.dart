import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/local_icon.dart';
import '../my_widget/g_icons.dart';
import '../theme/my_color.dart';

final tournamentListenerNotifier =
    ChangeNotifierProvider((_) => TournamentListener());

class TournamentListener extends ChangeNotifier {
  late List<LocalIcon> _icons;
  late bool _alreadyClicked;
  late bool _inWait;
  late bool _allFound;

  late Duration _tDuration;

  TournamentListener() {
    print("Running TournamentListener");
    _icons = _newIcons;
    _alreadyClicked = true;
    _inWait = false;
    _allFound = false;
  }

  bool get allFound => _allFound;

  bool get inWait => _inWait;

  bool get alreadyClicked => _alreadyClicked;

  List<LocalIcon> get icons => _icons;

  void iconClick(LocalIcon i) async {
    _icons[i.iconNo] = i.copyWith(isCheck: true);
    _alreadyClicked = !_alreadyClicked;
    if (_alreadyClicked) {
      _inWait = true;
      notifyListeners();
      await Future.delayed(
        const Duration(milliseconds: 700),
        () {
          Iterable<LocalIcon> x = _icons.where((element) => element.isCheck);
          if (x.every((e) => x.first.iconCode == e.iconCode)) {
            for (var e in x) {
              _icons[e.iconNo] = e.copyWith(
                  isCheck: false, isFound: true, color: majorelleBlue.value);
            }
            _allFound = _icons.every((element) => element.isFound);
          } else {
            for (var e in x) {
              icons[e.iconNo] = e.copyWith(isCheck: false);
            }
          }
        },
      );
    }
    _inWait = false;
    notifyListeners();
  }
}

List<LocalIcon> get _newIcons {
  List<IconData> x = List.from(gIcons);
  x.shuffle();
  List<IconData> y = List.from(x.take(36));
  List<IconData> z = y + y;
  z.shuffle();
  return List.generate(
      72, (index) => LocalIcon(iconCode: z[index].codePoint, iconNo: index));
}
