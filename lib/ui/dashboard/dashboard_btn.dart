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
          labels: const ["Daily Match", "Play Friend"],
          onToggle: (index) =>
              ref.watch(dashboardNotifierProvider).buttonIndex = index ?? 0,
          minWidth: 96.w,
          customWidths: [105.w, 120.w],
          minHeight: 36.h,
          cornerRadius: 4.8.r,
          animate: true,
          animationDuration: 90,
          inactiveBgColor: magnolia,
          activeBgColors: const [
            [jasper],
            [hookerGreen]
          ],
          activeFgColor: ghostWhite,
          inactiveFgColor: charcoal,
          customTextStyles: [
            TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12.r,
            )
          ],
        ),
      ),
    );
  }
}

/*
class DashboardBtn extends ConsumerWidget {
  const DashboardBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 15,
      mainAxisCellCount: 2.4,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 15.w),
        child: Container(
          alignment: Alignment.centerLeft,
          height: 54.h,
          child: GroupButton(
            // controller: GroupButtonController(
            //     selectedIndex: ref.watch(dButtonNotifierProvider)),
            buttons: const ['Daily Match', 'Play Friend'],
            // onSelected: (value, index, isSelected) =>
            //     ref.watch(dButtonNotifierProvider.notifier).state = index,
            options: GroupButtonOptions(
              direction: Axis.horizontal,
              mainGroupAlignment: MainGroupAlignment.start,
              spacing: 7.5.w,
              textPadding: EdgeInsets.symmetric(horizontal: 15.w),
              unselectedColor: lavender,
              selectedColor: majorelleBlue,
              borderRadius: BorderRadius.circular(4.5.r),
              buttonWidth: 99.w,
              buttonHeight: 36.h,
              unselectedTextStyle: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: majorelleBlue),
              selectedTextStyle: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: ghostWhite),
            ),
          ),
        ),
      ),
    );
  }
}
*/
