import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

final ChangeNotifierProvider<DashboardNotifier> dashboardNotifierProvider =
    ChangeNotifierProvider<DashboardNotifier>(
  (ref) => DashboardNotifier(ref),
);

class DashboardNotifier extends ChangeNotifier {
  //late PanelController panelController;
  final Ref ref;
  int _buttonIndex = 0;

  DashboardNotifier(this.ref) {
    //panelController = PanelController();
  }

  int get buttonIndex => _buttonIndex;

  set buttonIndex(int value) {
    if (_buttonIndex == value) return;
    _buttonIndex = value;
    notifyListeners();
  }
}
