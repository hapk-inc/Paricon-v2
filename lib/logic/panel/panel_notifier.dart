import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PanelNotifier extends StateNotifier<Widget> {
  PanelNotifier() : super(Container());

  @override
  set state(Widget value) => super.state = value;
}
