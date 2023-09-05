import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../logic/dot_notifier.dart';
import '../logic/s_size.dart';

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
    final dot = ref.watch(dotNotifierProvider);

    return Scaffold(
      appBar: sSize == ScreenSize.phone
          ? AppBar(
              toolbarHeight: 81.h,
              leading: const MyLogo(),
              leadingWidth: 210.w,
              elevation: 9,
            )
          : null,
      /*floatingActionButton: CircleAvatar(
        radius: 30.r,
        child: FloatingActionButton(
          backgroundColor: majorelleBlue,
          onPressed: () {},
          child: Icon(Icons.cabin, size: 27.r),
        ),
      ),*/
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: 75.h,
        backgroundColor: majorelleBlue,
        elevation: 9,
        icons: const [
          FontAwesomeIcons.trophy,
          FontAwesomeIcons.userGroup,
          FontAwesomeIcons.addressCard,
          // FontAwesomeIcons.chartSimple,
          FontAwesomeIcons.userLarge,
        ],
        activeIndex: dot,
        activeColor: lavenderBush,
        iconSize: 27.r,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 30.r,
        rightCornerRadius: 30.r,
        onTap: (index) {
          ref.read(dotNotifierProvider.notifier).state = index;
        },
        //other params
      ),
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
