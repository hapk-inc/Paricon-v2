import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

final panelProvider = Provider((_) => PanelController());

final dOpacityProvider = StateNotifierProvider<DOpacity, double>(
  (_) => DOpacity(),
);

class DOpacity extends StateNotifier<double> {
  DOpacity() : super(0.0);
}
