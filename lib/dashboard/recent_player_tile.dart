import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../logic/auth_provider.dart';
import '../../model/user_activity.dart';
import '../../theme/my_color.dart';
import '../../theme/my_theme.dart';
import '../logic/s_size.dart';

class RecentPlayerTile extends ConsumerWidget {
  final String id;
  final UserActivity xUser;
  const RecentPlayerTile(this.id, this.xUser, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double aR = (900.h / 360.w);
    if (aR > 2.3) {
      debugPrint("Small Screen");
      //_dHeight = 300.h;
    }
    bool isSmallScreen = aR > 2.3;

    final User? user = ref.watch(authUserProvider).value;
    if (user == null) return Container();
    final DateTime today = DateTime.now();
    final bool notActive = xUser.isActive && (xUser.nowTime.day == today.day);
    final bool isMe = id == user.uid;

    final ScreenSize sSize = ref.watch(sizeProvider);
    //final isPhoneTab = sSize == ScreenSize.phone || sSize == ScreenSize.tab;

    return AnimatedContainer(
      //color: cornellRed,
      constraints: BoxConstraints(maxWidth: 90.w, minWidth: 48.w),
      margin: EdgeInsets.only(right: 7.5.r),
      duration: const Duration(milliseconds: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: notActive ? 1 : 0.3,
            duration: const Duration(milliseconds: 500),
            child: Card(
              elevation: 1.5.r,
              shape: const CircleBorder(),
              child: CircleAvatar(
                radius: sSize != ScreenSize.phone
                    ? 36.r
                    : isSmallScreen
                        ? 30.r
                        : 30.r,
                backgroundColor: (xUser.isPlaying &&
                        DateTime.now().difference(
                                xUser.lastGamePlayed ?? DateTime(2024, 1)) <
                            const Duration(minutes: 30))
                    ? darkPastelGreen
                    : isMe
                        ? federalBlue
                        : violetBlue,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: xUser.avatar == null
                      ? Text(
                          xUser.name!.substring(0, 2).toUpperCase(),
                          style: TextStyle(
                            color: lightOrange,
                            letterSpacing: 0,
                            fontSize: sSize != ScreenSize.phone
                                ? 30.r
                                : isSmallScreen
                                    ? 24.r
                                    : 24.r,
                            height: 0,
                            fontFamily: "WendyOne",
                          ),
                        )
                      : FadeIn(
                          child: RandomAvatar(
                            xUser.avatar!,
                            trBackground: true,
                          ),
                        ),
                ),
              ),
            ),
          ),
          //Gap(2.4.r),
          Expanded(
            child: AutoSizeText(
              (isMe ? " (You) " : "") + firstCaps(xUser.name!),
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: isMe ? federalBlue : violetBlue),
              wrapWords: false,
              stepGranularity: 0.3,
              maxFontSize: 15,
              minFontSize: 9.6,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
