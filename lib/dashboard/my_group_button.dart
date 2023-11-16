import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';

import '../logic/dashboard_provider.dart';
import '../theme/my_color.dart';

class MyGroupButton extends ConsumerWidget {
  const MyGroupButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GroupButton(
      buttons: PGroupOption.values
          .map((e) => toBeginningOfSentenceCase(e.name) ?? "")
          .toList(),
      onSelected: (x, index, flag) {
        debugPrint("OnSelected $x");
        ref.watch(pGroupOptionProvider.notifier).state =
            PGroupOption.values[index];
      },
      options: GroupButtonOptions(
        buttonWidth: 75.w,
        buttonHeight: 30.h,
        selectedTextStyle: TextStyle(
          fontFamily: 'Cabin',
          fontSize: 12.r,
          color: ghostWhite,
        ),
        unselectedTextStyle: TextStyle(
          fontFamily: 'Cabin',
          fontSize: 12.r,
          color: ghostWhite,
        ),
        selectedColor: vanDyke,
        unselectedColor: periwinkle,
        borderRadius: BorderRadius.circular(6.r),
      ),
    );
  }
}
