import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:paricon/logic/s_size.dart';

class EveryoneFriends extends ConsumerWidget {
  const EveryoneFriends({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.watch(sizeProvider);
    bool isPhoneTab = sSize == ScreenSize.phone || sSize == ScreenSize.tab;

    return Container(
      //color: Colors.blue,
      alignment: Alignment.centerLeft,
      //padding: EdgeInsets.all(4.5.sp),
      child: GroupButton(
        buttons: const [
          "EveryOne",
          "My Friends",
          //"My Friends",
        ],
        options: GroupButtonOptions(
          buttonHeight: sSize == ScreenSize.phone ? 27.h : 30.h,
          buttonWidth: sSize == ScreenSize.phone
              ? 75.w
              : isPhoneTab
                  ? 60.w
                  : 51.w,
          spacing: 9.w,
          runSpacing: 9.h,
          elevation: 3,
          unselectedColor: const Color(0xffedf2f4),
          selectedColor: const Color(0xffa72608),
          crossGroupAlignment: CrossGroupAlignment.start,
          selectedTextStyle: TextStyle(
            fontSize: sSize == ScreenSize.phone
                ? 9.w
                : isPhoneTab
                    ? 7.8.w
                    : 6.w,
            color: const Color(0xffedf2f4),
            fontFamily: 'Poppins',
            //fontWeight: FontWeight.w100,
          ),
          unselectedTextStyle: TextStyle(
            fontSize: sSize == ScreenSize.phone
                ? 9.w
                : isPhoneTab
                    ? 7.8.w
                    : 6.w,
            color: const Color(0xff2D2327),
            fontFamily: 'Poppins',
            //fontWeight: FontWeight.w100,
          ),
          borderRadius: BorderRadius.circular(3.sp),
        ),
      ),
    );
  }
}
