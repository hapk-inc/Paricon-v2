import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<SettingPanelNotifier, Widget>
    settingPanelNotifierProvider =
    StateNotifierProvider<SettingPanelNotifier, Widget>(
        (_) => SettingPanelNotifier());

class SettingPanelNotifier extends StateNotifier<Widget> {
  SettingPanelNotifier() : super(Container());

  @override
  set state(Widget value) => super.state = value;
}
