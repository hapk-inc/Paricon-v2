import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/local_icon.dart';
import '../my_widgets/f_icons.dart';

class TournamentNotifier extends ChangeNotifier {
  late List<LocalIcon> _icons;

  late bool _alreadyClicked;
  late bool _inWait;
  bool _allFound = false;

  TournamentNotifier() {
    List<IconData> x = List.from(fIcons);
    x.shuffle();
    List<IconData> y = List.from(x.take(36));
    List<IconData> z = y + y;
    z.shuffle();
    _icons = List.generate(
        72, (index) => LocalIcon(iconCode: z[index].codePoint, iconNo: index));
    _alreadyClicked = true;
    _inWait = false;
  }

  bool get inWait => _inWait;

  bool get allFound => _allFound;

  List<LocalIcon> get icons => _icons;

  set allFound(bool value) {
    if (value != _allFound) {
      _allFound = value;
    }
    notifyListeners();
  }

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
              _icons[e.iconNo] = e.copyWith(isCheck: false, isFound: true);
            }
            allFound = _icons.every((element) => element.isFound);
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

final tournamentNotifierProvider =
    ChangeNotifierProvider((ref) => TournamentNotifier());
