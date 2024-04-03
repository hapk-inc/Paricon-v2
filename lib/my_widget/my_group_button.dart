import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';

import '../values/colors.dart';

class MyGroupButton extends StatelessWidget {
  final GroupButtonController groupButtonController;
  final dynamic Function(dynamic, int, bool)? onSelected;
  final List<dynamic> buttons;

  const MyGroupButton(
      {required this.groupButtonController,
      required this.buttons,
      required this.onSelected,
      super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GroupButton(
      controller: groupButtonController,
      isRadio: true,
      onSelected: onSelected,
      maxSelected: 1,
      buttons: buttons,
      options: GroupButtonOptions(
        mainGroupAlignment: MainGroupAlignment.start,
        spacing: 15.r,
        textPadding: EdgeInsets.symmetric(horizontal: 18.w),
        unselectedColor: lavender,
        selectedColor: majorelleBlue,
        borderRadius: BorderRadius.circular(7.2.r),
        buttonHeight: 42.h,
        unselectedTextStyle:
            textTheme.bodyMedium?.copyWith(color: tropicalIndigo),
        selectedTextStyle: textTheme.bodyMedium?.copyWith(color: ghostWhite),
      ),
    );
  }
}
