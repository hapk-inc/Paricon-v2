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

/*
class UseAvatarCode1 extends ConsumerWidget {
  const UseAvatarCode1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    return ListTile(
      isThreeLine: true,
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 1.5.w),
      titleTextStyle:
          TextStyle(fontFamily: 'WendyOne', color: federalBlue, height: 2.1.r),
      subtitleTextStyle:
          TextStyle(fontFamily: 'Poppins', height: 2.4.r, color: federalBlue),
      title: Text(
        "Earn a new Avatar",
        style: TextStyle(fontSize: 36.r),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(7.5),
          const Text(
            " Share your code with your friends "
            "and receive a bonus avatar as a thanks from us for the referral.",
            style: TextStyle(color: gray),
          ),
          const Gap(22.5),
          AspectRatio(
            aspectRatio: 5.1,
            child: DottedBorder(
              stackFit: StackFit.expand,
              borderType: BorderType.RRect,
              padding: EdgeInsets.zero,
              dashPattern: [15.r, 3.r],
              color: gray,
              radius: Radius.circular(15.r),
              strokeWidth: 0.9.r,
              child: GridTileBar(
                //contentPadding: EdgeInsets.zero,
                //dense: true,
                title: Text(
                  myUser?.avatarCode ?? "",
                  style: TextStyle(
                      fontSize: 30.r, letterSpacing: 1.8.r, height: 0),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    "TAP TO COPY",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13.5.r,
                        color: oldRose),
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
*/
