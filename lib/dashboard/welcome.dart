import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/auth_provider.dart';
import '../logic/card_avatar_notifier.dart';
import '../logic/dashboard_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

class Welcome extends ConsumerWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final User? fUser = ref.watch(authUserProvider).value;

    final bool showTile = myUser == null || fUser == null;

    return Container(
      margin: EdgeInsets.only(left: 7.5.r, right: 7.5.r, bottom: 7.5.r),
      decoration: BoxDecoration(
        color: majorelleBlue,
        borderRadius: BorderRadius.circular(7.2.r),
      ),
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Center(
            child:
                FadeIn(child: showTile ? Container() : const _TitleSubtitle()),
          ),
          if (!showTile)
            Positioned(
              right: -30.r,
              bottom: -60.r,
              height: 150.r,
              width: 150.r,
              child: SlideInUp(
                delay: const Duration(milliseconds: 500),
                child: FadeIn(
                  child: Stack(
                    children: [
                      if (myUser.avatar != null)
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 48.r,
                          child: RandomAvatar(
                            myUser.avatar!,
                            trBackground: true,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _TitleSubtitle extends ConsumerWidget {
  const _TitleSubtitle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final User? fUser = ref.watch(authUserProvider).value;

    final bool showTile = myUser == null || fUser == null;

    return showTile
        ? Container()
        : ListTile(
            title: Container(
              alignment: Alignment.bottomLeft,
              height: 60.h,
              child: AutoSizeText(
                ref.read(welcomeTitleProvider(
                    toBeginningOfSentenceCase(myUser.name) ?? "")),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: lightOrange),
                maxLines: 1,
                minFontSize: 15,
                maxFontSize: 30,
              ),
            ),
            subtitle: SizedBox(
              //color: Colors.amber,
              height: 75.h,
              child: AutoSizeText.rich(
                TextSpan(
                  children: [
                    if (myUser.avatar == null) ...[
                      TextSpan(
                          text: ref.read(welcomeSubtitleProvider),
                          style: TextStyle(height: 2.1.r)),
                      TextSpan(
                        text: "click here",
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () => ref.read(setCardAvatarProvider(fUser.uid)),
                        style: TextStyle(color: darkPastelGreen, height: 2.1.r),
                      ),
                    ] else ...[
                      const TextSpan(text: "Hope you're having a good day")
                    ]
                  ],
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: lightOrange),
                ),
              ),
            ),
          );
  }
}
