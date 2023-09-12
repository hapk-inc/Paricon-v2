import 'dart:math';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/dot_notifier.dart';
import '../logic/s_size.dart';

import '../my_widgets/app_bar.dart';
import '../my_widgets/my_logo.dart';
import '../theme/my_color.dart';
import 'dashboard/d_iPad.dart';
import 'dashboard/d_phone.dart';
import 'dashboard/d_tab.dart';
import 'dashboard/d_tv.dart';
import 'dashboard/d_web.dart';

@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    //final dot = ref.watch(dotNotifierProvider);

    return Scaffold(
      appBar: buildAppBar(sSize),
      backgroundColor: ghostWhite,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: sSize == ScreenSize.phone
              ? const DashboardP()
              : sSize == ScreenSize.tab
                  ? const DashboardT()
                  : sSize == ScreenSize.iPad
                      ? const DashboardIpad()
                      : sSize == ScreenSize.pc
                          ? const DashboardW()
                          : const DashboardTV(),
        ),
      ),
    );
  }
}
