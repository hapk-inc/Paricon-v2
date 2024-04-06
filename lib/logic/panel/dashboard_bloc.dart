import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_button/group_button.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

final Provider<PanelController> dashboardPanelControllerProvider =
    Provider<PanelController>(
  (_) => PanelController(),
);

final Provider<GroupButtonController> boardLevelGroupControllerProvider =
    Provider<GroupButtonController>(
  (_) => GroupButtonController(selectedIndex: 0),
);

final Provider<GroupButtonController> boardTypeGroupControllerProvider =
    Provider<GroupButtonController>(
  (_) => GroupButtonController(selectedIndex: 0),
);

/*final ChangeNotifierProvider<DashboardPanel> dashboardPanelProvider =
    ChangeNotifierProvider<DashboardPanel>(
  (ref) {
    return DashboardPanel();
  },
);*/

/*final StateNotifierProvider<DashboardPanel, Widget> dashboardPanelProvider =
    StateNotifierProvider<DashboardPanel, Widget>(
  (_) => DashboardPanel(),
);*/

/*class DashboardPanel extends StateNotifier<Widget> {
  DashboardPanel() : super(const BlankContainer());

  @override
  set state(Widget value) => super.state = value;
}*/

/*class DashboardPanel extends ChangeNotifier {
  Widget _panel = const BlankContainer();
  double _height = 420.h;

  Widget get panel => _panel;

  set panel(Widget value) {
    if (_panel == value) return;
    _panel = value;
    notifyListeners();
  }

  double get height => _height;

  set height(double value) {
    if (_height == value) return;
    _height = value;
    notifyListeners();
  }
}

class BlankContainer extends StatelessWidget {
  const BlankContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}*/
