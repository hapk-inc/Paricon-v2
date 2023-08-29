import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:paricon/logic/s_size.dart';

class EveryoneFriends extends ConsumerWidget {
  const EveryoneFriends({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    final bool isTab = sSize == ScreenSize.tab;
    return Container(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GroupButton(
          options: GroupButtonOptions(
            direction: Axis.horizontal,
            crossGroupAlignment: CrossGroupAlignment.start,
            borderRadius: BorderRadius.circular(6.r),
            buttonWidth: isTab ? 84.w : 84.w,
            unselectedTextStyle: TextStyle(fontSize: isTab ? 13.5.r : 12.6.r),
            selectedTextStyle: TextStyle(fontSize: isTab ? 13.5.r : 12.6.r),
            textPadding: EdgeInsets.symmetric(horizontal: 9.w),
            buttonHeight: 36.h,
            spacing: 6.w,
            elevation: 3,
          ),
          buttons: const ["EveryOne", "My Friends"],
        ),
      ),
    );
  }
}
