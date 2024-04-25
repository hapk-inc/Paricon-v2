import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<DashboardNotifier> dashboardNotifierProvider =
    ChangeNotifierProvider<DashboardNotifier>(
  (ref) => DashboardNotifier(ref),
);

class DashboardNotifier extends ChangeNotifier {
  final Ref ref;
  int _buttonIndex = 0;

  DashboardNotifier(this.ref);

  int get buttonIndex => _buttonIndex;

  set buttonIndex(int value) {
    if (_buttonIndex == value) return;
    _buttonIndex = value;
    notifyListeners();
  }
}
