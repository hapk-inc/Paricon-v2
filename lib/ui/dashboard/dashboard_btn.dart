import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:group_button/group_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../logic/dashboard/notifier.dart';
import '../../values/colors.dart';

class DashboardBtn extends ConsumerWidget {
  const DashboardBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: Container(
        height: 75.h,
        color: magnolia,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 15.w),
          child: GroupButton(
            controller: GroupButtonController(
              selectedIndex: ref.watch(dashboardNotifierProvider).buttonIndex,
            ),
            isRadio: true,
            onSelected: (_, index, __) =>
                ref.read(dashboardNotifierProvider).buttonIndex = index,
            buttons: const [
              "Daily Match",
              "Play Friends",
              "Leaderboard",
              // "My Avatars",
            ],
            options: GroupButtonOptions(
              direction: Axis.horizontal,
              selectedColor: majorelleBlue,
              spacing: 7.5.w,
              buttonWidth: 120.w,
              buttonHeight: 45.h,
              selectedTextStyle: textTheme.headlineLarge?.copyWith(
                color: ghostWhite,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
              unselectedTextStyle: textTheme.headlineLarge?.copyWith(
                color: charcoal,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
              elevation: 0.3,
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
        ),
      ),
    );
  }
}
