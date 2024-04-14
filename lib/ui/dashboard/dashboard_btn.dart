import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:group_button/group_button.dart';

import '../../logic/dashboard/dashboard_bloc.dart';
import '../../values/colors.dart';

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
            controller: GroupButtonController(
                selectedIndex: ref.watch(dButtonNotifierProvider)),
            buttons: const ['Daily Match', 'Play Friend'],
            onSelected: (value, index, isSelected) =>
                ref.watch(dButtonNotifierProvider.notifier).state = index,
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
