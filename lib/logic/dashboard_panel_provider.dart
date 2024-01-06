import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final StateNotifierProvider<DPanelOption, Widget> dPanelWidgetProvider =
    StateNotifierProvider<DPanelOption, Widget>(
  (_) => DPanelOption(),
);

class DPanelOption extends StateNotifier<Widget> {
  DPanelOption() : super(Container());

  @override
  set state(Widget value) => super.state = value;
}

//=============================================

final StateNotifierProvider<DPanelHeight, double> dPanelHeightProvider =
    StateNotifierProvider<DPanelHeight, double>(
  (_) => DPanelHeight(),
);

class DPanelHeight extends StateNotifier<double> {
  DPanelHeight() : super(300.h);

  @override
  set state(double value) => super.state = value;
}
