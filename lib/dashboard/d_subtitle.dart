import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../logic/auth_provider.dart';
import '../logic/card_avatar_notifier.dart';
import '../logic/dashboard_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

class DSubtitle extends ConsumerWidget {
  final MyUser myUser;
  const DSubtitle(this.myUser, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? fUser = ref.watch(authUserProvider).value;

    return StaggeredGridTile.fit(
      crossAxisCellCount: 20,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: AutoSizeText.rich(
          TextSpan(
            children: [
              if (myUser.avatar == null)
                TextSpan(
                  text: ref.read(welcomeSubtitleProvider),
                  children: [
                    TextSpan(
                      text: "click here",
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => ref.read(setCardAvatarProvider(fUser!.uid)),
                      style: const TextStyle(color: darkPastelGreen),
                    ),
                  ],
                )
              else
                TextSpan(text: ref.read(goodDayProvider))
            ],
          ),
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 2,
          minFontSize: 12,
          maxFontSize: 15,
        ),
      ),
    );
  }
}

class DSubtitle1 extends ConsumerWidget {
  final MyUser myUser;
  const DSubtitle1(this.myUser, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? fUser = ref.watch(authUserProvider).value;

    return StaggeredGridTile.fit(
      crossAxisCellCount: 20,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        alignment: Alignment.centerLeft,
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            fontSize: 12.r,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 3.r,
            color: tropicalIndigo,
          ),
          textAlign: TextAlign.start,
          duration: const Duration(milliseconds: 300),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: myUser.avatar == null
                ? AutoSizeText.rich(
                    TextSpan(
                      children: [
                        ...[
                          TextSpan(text: ref.read(welcomeSubtitleProvider)),
                          TextSpan(
                            text: "click here",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  ref.read(setCardAvatarProvider(fUser!.uid)),
                            style: const TextStyle(color: darkPastelGreen),
                          ),
                        ],
                      ],
                    ),
                    maxLines: 2,
                    minFontSize: 6,
                    maxFontSize: 15,
                  )
                : AutoSizeText(
                    ref.read(goodDayProvider),
                    maxLines: 1,
                    style: const TextStyle(letterSpacing: 0),
                    minFontSize: 9,
                    maxFontSize: 12,
                  ),
          ),
        ),
      ),
    );
  }
}
