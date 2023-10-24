import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/local_icon.dart';
import '../my_widget/g_icons.dart';
import '../theme/my_color.dart';

final tournamentListenerNotifierProvider =
    ChangeNotifierProvider((_) => TournamentListener());

class TournamentListener extends ChangeNotifier {
  late List<LocalIcon> _icons;
  late bool _alreadyClicked;
  late bool _inWait;
  late bool _allFound;
  //late Timer? _timer;
  late Stopwatch _stopwatch;
  double _balancePercentage = 0.0;
  //Duration _duration = Duration.zero;

  //late Duration _tDuration;

  TournamentListener() {
    print("Running TournamentListener");
    _icons = _newIcons;
    _alreadyClicked = true;
    _stopwatch = Stopwatch();
    _inWait = false;
    _allFound = false;
  }

  bool get allFound => _allFound;

  bool get inWait => _inWait;

  double get balancePercentage => _balancePercentage;

  bool get alreadyClicked => _alreadyClicked;

  Stopwatch get stopwatch => _stopwatch;

  List<LocalIcon> get icons => _icons;

  void iconClick(LocalIcon i) async {
    _icons[i.iconNo] = i.copyWith(isCheck: true);
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      notifyListeners();
    }
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
            int iconFoundCount =
                _icons.where((element) => element.isFound).length;
            _balancePercentage = iconFoundCount / _icons.length;
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
  List<IconData> y = List.from(x.take(6));
  List<IconData> z = y + y;
  z.shuffle();
  return List.generate(
      12, (index) => LocalIcon(iconCode: z[index].codePoint, iconNo: index));
}
