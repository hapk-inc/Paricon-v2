import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../ui/game_room.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

final ChangeNotifierProvider<DashboardPanelNotifier>
    dashboardPanelNotifierProvider =
    ChangeNotifierProvider<DashboardPanelNotifier>(
  (ref) => DashboardPanelNotifier(ref),
);

class DashboardPanelNotifier extends ChangeNotifier {
  final PanelController panelController = PanelController();
  double _dHeight = 270.h;
  double _dMinHeight = 0.h;
  Widget _dWidget = const CreateGameRoom();
  Widget _dCollapsedWidget = Container();
  final Ref ref;
  num _tab = 0;
  late TabController tabController;
  Widget _openBuilder = Container();

  DashboardPanelNotifier(this.ref) {
    double aR = (900.h / 360.w);
    if (aR > 2.3) {
      debugPrint("Small Screen");
      _dHeight = 300.h;
    }
    debugPrint("Height ${900.h / 360.w}");
  }

  double get dHeight => _dHeight;

  set dHeight(double value) {
    if (_dHeight == value) return;
    _dHeight = value;
    notifyListeners();
  }

  Widget get dWidget => _dWidget;

  set dWidget(Widget value) {
    if (_dWidget == value) return;
    _dWidget = value;
    notifyListeners();
  }

  Widget get openBuilder => _openBuilder;

  set openBuilder(Widget value) {
    if (_openBuilder == value) return;
    _openBuilder = value;
    notifyListeners();
  }

  Widget get dCollapsedWidget => _dCollapsedWidget;

  set dCollapsedWidget(Widget value) {
    if (_dCollapsedWidget == value) return;
    _dCollapsedWidget = value;
    notifyListeners();
  }

  num get tab => _tab;

  set tab(num value) {
    if (_tab == value) return;
    _tab = value;
    notifyListeners();
  }

  double get dMinHeight => _dMinHeight;

  set dMinHeight(double value) {
    if (_dMinHeight == value) return;
    _dMinHeight = value;
    notifyListeners();
  }
}
