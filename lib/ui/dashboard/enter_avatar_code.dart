import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import '../../logic/panel/bloc.dart';
import '../../values/colors.dart';

class EnterAvatarCode extends ConsumerWidget {
  const EnterAvatarCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gap(15.r),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Enter Avatar code",
              style: textTheme.titleMedium?.copyWith(
                color: jasper,
              ),
            ),
            IconButton(
              onPressed: () =>
                  ref.read(dashboardPanelControllerProvider).close(),
              icon: Icon(Icons.close, size: 21.r, color: frenchGray),
            )
          ],
        ),
        //Gap(4.5.r),
        const Text(
          "Enter 6-Digit code to share new avatar",
          style: TextStyle(color: frenchGray),
        ),
        Gap(30.h),
        Pinput(
          length: 6,
          onCompleted: (value) {},
        ),
        Gap(30.h),
        Expanded(child: Container(color: xantHousLight))
      ],
    );
  }
}
