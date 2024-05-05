import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../my_widget/no_internet.dart';
import '../app/net_notifier.dart';
import '../panel/bloc.dart';

final ChangeNotifierProvider<DashboardNotifier> dashboardNotifierProvider =
    ChangeNotifierProvider<DashboardNotifier>(
  (ref) => DashboardNotifier(ref),
);

Logger _logger = Logger();

class DashboardNotifier extends ChangeNotifier {
  final Ref ref;
  int _buttonIndex = 0;
  double _panelH = 360.h;

  DashboardNotifier(this.ref);

  @override
  void addListener(VoidCallback listener) {
    ref.listen(
      netConnectedNotifierProvider.select((value) => value),
      (previous, next) {
        final int prev = previous ?? 0;
        PanelController pc = ref.read(dashboardPanelControllerProvider);
        _logger.i("24--netConnectedNotifierProvider $next");
        if (next.isNegative && !prev.isNegative) {
          ref.read(panelNotifierProvider.notifier).state = const NoInternet();
          if (pc.isPanelClosed) pc.open();
        } else {
          if (prev.isNegative) if (pc.isPanelOpen) pc.close();
        }
      },
    );

    super.addListener(listener);
  }

  int get buttonIndex => _buttonIndex;

  set buttonIndex(int value) {
    if (_buttonIndex == value) return;
    _buttonIndex = value;
    notifyListeners();
  }

  double get panelH => _panelH;

  set panelH(double value) {
    if (_panelH == value) return;
    _panelH = value;
    notifyListeners();
  }
}
