import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/dashboard_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../my_widget/my_logo.dart';
import '../theme/my_color.dart';

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
                          fontSize: 21.r,
                        ),
                    maxLines: 1,
                    minFontSize: 15,
                    maxFontSize: 30,
                  ),
                ),
                Gap(15.r),
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
