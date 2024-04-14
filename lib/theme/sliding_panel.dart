import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

final Provider<SlidingPanelTheme> slidingPanelProvider = Provider(
  (_) => SlidingPanelTheme(),
);

class SlidingPanelTheme {
  double slidingPanelHeight = 240.h;

  EdgeInsets padding = EdgeInsets.all(24.r);

  BorderRadius panelRadius = BorderRadius.vertical(top: Radius.circular(30.r));

  BorderRadius fullRadius = BorderRadius.circular(15.r);

  Color slidingPanelColor = ghostWhite;

  Color backDrop = richBlack;
}
