import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../logic/dashboard/notifier.dart';
import '../../values/colors.dart';

class DashboardBtn extends ConsumerWidget {
  const DashboardBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 15.w),
        child: ToggleSwitch(
          initialLabelIndex: ref.watch(dashboardNotifierProvider).buttonIndex,
          radiusStyle: true,
          labels: const ["Daily Match", "Play Friend", "LeaderBoard"],
          onToggle: (index) =>
              ref.watch(dashboardNotifierProvider).buttonIndex = index ?? 0,
          minWidth: 96.w,
          customWidths: [105.w, 108.w, 120.w],
          minHeight: 43.5.h,
          cornerRadius: 4.8.r,
          animate: true,
          animationDuration: 90,
          inactiveBgColor: magnolia,
          activeBgColors: const [
            [jasper],
            [darkPurple],
            [jasper],
          ],
          activeFgColor: ghostWhite,
          inactiveFgColor: charcoal,
          customTextStyles: [
            TextStyle(fontFamily: 'Montserrat', fontSize: 13.2.r)
          ],
        ),
      ),
    );
  }
}
