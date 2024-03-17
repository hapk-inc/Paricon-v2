import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../theme/my_theme.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

final _pTheme = SlidingPanelTheme();

class UseAvatarCode extends ConsumerWidget {
  const UseAvatarCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;

    return Container(
      padding: _pTheme.slidingPanelPadding * 0.75,
      decoration: BoxDecoration(
        color: magnolia1,
        borderRadius: _pTheme.slidingPanelFullRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Earn New avatar",
            style: TextStyle(color: majorelleBlue),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 7.5.h),
            child: Text(
              "Share your code with your friends "
              "and receive a bonus avatar as a thanks from us for the referral.",
              style: settingSubText.copyWith(color: tropicalIndigo),
            ),
          ),
          Gap(30.r),
          AspectRatio(
            aspectRatio: 4.8,
            child: DottedBorder(
              stackFit: StackFit.expand,
              borderType: BorderType.RRect,
              padding: EdgeInsets.zero,
              dashPattern: const [9, 3],
              color: tropicalIndigo,
              radius: Radius.circular(15.r),
              strokeWidth: 1.5.r,
              child: GridTileBar(
                //contentPadding: EdgeInsets.zero,
                //dense: true,
                title: AutoSizeText(
                  myUser?.avatarCode ?? "",
                  style: TextStyle(fontSize: 30.r),
                  maxLines: 1,
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    "COPY CODE",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.r,
                      color: violetBlue,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
