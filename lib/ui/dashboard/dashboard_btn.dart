import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:group_button/group_button.dart';

import '../../values/colors.dart';

class DashboardBtn extends ConsumerWidget {
  const DashboardBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle hMedium = textTheme.headlineMedium!;
    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 15.w),
        child: Container(
          height: 54.h,
          alignment: Alignment.centerLeft,
          child: GroupButton(
            controller: GroupButtonController(selectedIndex: 0),
            buttons: const ['Daily Match', 'Play Friend'],
            options: GroupButtonOptions(
              direction: Axis.horizontal,
              mainGroupAlignment: MainGroupAlignment.start,
              spacing: 7.5.w,
              textPadding: EdgeInsets.symmetric(horizontal: 15.w),
              unselectedColor: lavender,
              selectedColor: majorelleBlue,
              borderRadius: BorderRadius.circular(4.5.r),
              buttonHeight: 36.h,
              buttonWidth: 105.w,
              unselectedTextStyle: hMedium.copyWith(color: majorelleBlue),
              selectedTextStyle: hMedium.copyWith(color: ghostWhite),
            ),
          ),
        ),
      ),
    );
  }
}
