import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enums/enums.dart';

final ChangeNotifierProvider<DashboardNotifier> dashboardNotifierProvider =
    ChangeNotifierProvider<DashboardNotifier>(
  (ref) => DashboardNotifier(ref),
);

class DashboardNotifier extends ChangeNotifier {
  //late PanelController panelController;
  final Ref ref;
  int _buttonIndex = 0;
  BoardLevel? _level;
  BoardType? _type;
  PlayerCount? _player;

  DashboardNotifier(this.ref);

  int get buttonIndex => _buttonIndex;

  set buttonIndex(int value) {
    if (_buttonIndex == value) return;
    _buttonIndex = value;
    notifyListeners();
  }

  BoardType? get type => _type;

  set type(BoardType? value) {
    if (_type == value) return;
    _type = value;
    notifyListeners();
  }

  BoardLevel? get level => _level;

  set level(BoardLevel? value) {
    if (_level == value) return;
    _level = value;
    notifyListeners();
  }

  PlayerCount? get player => _player;

  set player(PlayerCount? value) {
    if (_player == value) return;
    _player = value;
    notifyListeners();
  }
}
