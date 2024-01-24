import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paricon/ui/game_room.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

/*final StateNotifierProvider<DPanelOption, Widget> dPanelWidgetProvider =
    StateNotifierProvider<DPanelOption, Widget>(
  (_) => DPanelOption(),
);

class DPanelOption extends StateNotifier<Widget> {
  DPanelOption() : super(Container());

  @override
  set state(Widget value) => super.state = value;
}*/

//=============================================

/*final StateNotifierProvider<DPanelHeight, double> dPanelHeightProvider =
    StateNotifierProvider<DPanelHeight, double>(
  (_) => DPanelHeight(),
);

class DPanelHeight extends StateNotifier<double> {
  DPanelHeight() : super(300.h);

  @override
  set state(double value) => super.state = value;
}*/

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
  late TabController _tabController;

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

  TabController get tabController => _tabController;

  set tabController(TabController value) {
    //if (_tabController == value) return;
    _tabController = value;
    //notifyListeners();
  }

  double get dMinHeight => _dMinHeight;

  set dMinHeight(double value) {
    if (_dMinHeight == value) return;
    _dMinHeight = value;
    notifyListeners();
  }
}
