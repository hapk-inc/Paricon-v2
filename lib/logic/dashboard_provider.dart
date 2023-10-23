import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

final Provider<PanelController> dashboardPanelProvider = Provider(
  (ref) => PanelController(),
);
