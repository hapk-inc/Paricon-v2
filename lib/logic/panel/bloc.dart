import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'panel_notifier.dart';

final Provider<PanelController> dashboardPanelControllerProvider =
    Provider<PanelController>(
  (_) => PanelController(),
);

final Provider<PanelController> settingsPanelControllerProvider =
    Provider<PanelController>(
  (_) => PanelController(),
);

final Provider<PanelController> roomPanelControllerProvider =
    Provider<PanelController>(
  (_) => PanelController(),
);

final Provider<PanelController> playFriendPanelControllerProvider =
    Provider<PanelController>(
  (_) => PanelController(),
);

final StateNotifierProvider<PanelNotifier, Widget> panelNotifierProvider =
    StateNotifierProvider<PanelNotifier, Widget>(
  (ref) => PanelNotifier(ref),
);
