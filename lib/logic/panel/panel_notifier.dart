import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ui/dashboard/enter_avatar_code.dart';
import '../dashboard/notifier.dart';

class PanelNotifier extends StateNotifier<Widget> {
  final Ref ref;
  PanelNotifier(this.ref) : super(Container());

  @override
  set state(Widget value) {
    ref.read(dashboardNotifierProvider).panelH =
        value.toString() == "EnterAvatarCode" ? 600.h : 360.h;

    super.state = value;
  }
}
