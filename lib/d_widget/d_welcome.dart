import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/dashboard_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../my_widget/my_logo.dart';
import '../theme/my_color.dart';
import 'd_show_profile_detail.dart';

class DWelcome extends ConsumerWidget {
  const DWelcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.read(myUserProvider).value;
    return OpenContainer(
      closedElevation: 0,
      middleColor: majorelleBlue,
      tappable: false,
      closedBuilder: (BuildContext context, void Function() action) =>
          Container(
        decoration: BoxDecoration(
          color: majorelleBlue,
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        margin: EdgeInsets.all(9.r),
        padding: EdgeInsets.only(top: 30.r, left: 15.r, right: 15.r),
        constraints: const BoxConstraints.expand(),
        child: myUser == null ? null : DashboardTitleSubTitle(action),
      ),
      //closedColor: majorelleBlue,
      openColor: majorelleBlue,
      openBuilder: (_, void Function({Object? returnValue}) action) =>
          ShowProfileDetail(action),
    );
  }
}

class DashboardTitleSubTitle extends ConsumerWidget {
  final void Function() action;
  const DashboardTitleSubTitle(this.action, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.read(myUserProvider).value;
    return Stack(
      children: [
        const Center(child: Opacity(opacity: 0.12, child: MyLogo())),
        Positioned(
          right: -30.r,
          bottom: -60.r,
          height: 150.r,
          width: 150.r,
          child: SlideInUp(
            delay: const Duration(seconds: 1),
            child: myUser!.avatar == null
                ? Container()
                : SlideInUp(
                    delay: const Duration(seconds: 3),
                    child: FadeIn(
                      child: Stack(
                        children: [
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
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: AutoSizeText(
                    ref.read(welcomeTitleProvider(
                        toBeginningOfSentenceCase(myUser.name) ?? "")),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: lightOrange,
                          fontSize: 24.r,
                          //   height: 2.1,
                        ),
                    maxLines: 1,
                    minFontSize: 21,
                    maxFontSize: 30,
                  ),
                ),
                InkWell(
                  //onTap: () => Scaffold.of(context).openDrawer(),
                  onTap: action,
                  child: Icon(
                    Icons.edit,
                    size: 18.r,
                    color: mistyRose,
                  ),
                )
              ],
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: ref.read(welcomeSubtitleProvider)),
                    const TextSpan(
                      text: "click here",
                      /*recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => Scaffold.of(context).openDrawer(),*/
                      style: TextStyle(color: darkPastelGreen),
                    ),
                  ],
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: lightOrange),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

String welcomeString(String s) {
  return ["Greetings, $s.", "Hey, $s!", "Hello, $s!"][mockInteger(0, 2)];
}

String get newAvatarString {
  return [
    "You've earned a cool new avatar. "
        "To use it as your profile picture, just ",
    "To set it as your profile picture, simply ",
    "Make it your profile picture with a single ",
    "Just one click away from using it as your profile picture — "
  ][mockInteger(0, 3)];
}
