import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../logic/user_provider.dart';
import '../../model/my_user.dart';
import '../../model/p_user.dart';
import '../../my_widget/my_logo.dart';
import '../../theme/my_color.dart';

class DWelcome extends ConsumerWidget {
  const DWelcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PUser? pUser = ref.watch(pUserMeProvider).value;
    if (pUser == null) return Container();
    final MyUser myUser = pUser.myUser;

    return FadeIn(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: majorelleBlue,
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        margin: EdgeInsets.all(9.r),
        padding: EdgeInsets.only(top: 15.r, left: 15.r, right: 15.r),
        child: Stack(
          children: [
            const Center(child: Opacity(opacity: 0.12, child: MyLogo())),
            Positioned(
              right: -30.r,
              bottom: -60.r,
              height: 150.r,
              width: 150.r,
              child: SlideInUp(
                delay: const Duration(seconds: 1),
                child: myUser!.avatar.isEmpty
                    ? FadeIn(
                        delay: const Duration(seconds: 3),
                        child: Lottie.asset(
                          'lottie/b_male_01.json',
                          repeat: true,
                          //controller: const AlwaysStoppedAnimation<double>(1),
                        ),
                      )
                    : SlideInUp(
                        delay: const Duration(seconds: 3),
                        child: FadeIn(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 48.r,
                                child: RandomAvatar(
                                  myUser.avatar,
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
                        welcomeString(
                            toBeginningOfSentenceCase(myUser.name) ?? ""),
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
                      onTap: () => Scaffold.of(context).openDrawer(),
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
                        TextSpan(text: newAvatarString),
                        TextSpan(
                          text: "click here",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Scaffold.of(context).openDrawer(),
                          style: const TextStyle(color: darkPastelGreen),
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
        ),
      ),
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
