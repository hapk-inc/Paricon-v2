import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';

import '../logic/card_notifier.dart';
import '../theme/my_color.dart';

class EarnFirstAvatar extends ConsumerWidget {
  const EarnFirstAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        children: [
          Container(
            height: 150.h,
            alignment: Alignment.center,
            // width: double.maxFinite,
            color: magnolia,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  [
                    "Earn your first avatar",
                    "Claim your debut avatar",
                    "Achieve your initial avatar"
                  ][mockInteger(0, 2)],
                  style: TextStyle(
                    //fontFamily: 'Poppins',
                    color: drabDarkBrown,
                    fontSize: 21.r,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(15.r),
                ApplyNowButton()
              ],
            ),
          ),
          Gap(7.5.r),
        ],
      );
}

class ApplyNowButton extends ConsumerWidget {
  const ApplyNowButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(federalBlue),
      ),
      onPressed: () => ref.read(oneCardProvider("").future),
      child: const Text(
        "APPLY NOW",
        style: TextStyle(color: magnolia),
      ),
    );
  }
}
