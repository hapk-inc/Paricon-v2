import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';
import '../ui/avatar_others_sharing.dart';

class EnterAvatarCode extends ConsumerWidget {
  const EnterAvatarCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tTheme = Theme.of(context).textTheme;
    final MyUser? myUser = ref.watch(myUserProvider).value;
    return myUser == null
        ? Container()
        : Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.r)),
            margin: EdgeInsets.symmetric(horizontal: 4.5.r),
            padding: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 15.h),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "🎁 Gift your friends, a new avatars 😍",
                        style: tTheme.bodyMedium!.copyWith(
                          height: 1.8.r,
                          color: drabDarkBrown,
                        ),
                        maxLines: 2,
                      ),
                      //Gap(6.r),
                      AutoSizeText(
                        "Share the code below "
                        "and present them with new avatars.",
                        style: tTheme.bodySmall!.copyWith(
                          color: chocolateCosmos,
                          letterSpacing: 0,
                        ),
                        stepGranularity: 1.5,
                        minFontSize: 10.5,
                        maxFontSize: 15,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Gap(30.r),
                OpenContainer(
                  tappable: false,
                  closedBuilder: (_, void Function() action) => Container(
                    height: 54.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.5.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.5.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            key: ValueKey(mockInteger(0, 10)),
                            child: Text(
                              List.generate(
                                  6, (_) => emojiArr[mockInteger(0, 8)]).join(),
                              style: tTheme.bodySmall!.copyWith(
                                fontSize: 21.r,
                                color: drabDarkBrown,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.15.r,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: action,
                            child: Icon(Icons.group, size: 30.r),
                          )
                          /*AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            decoration:
                                const BoxDecoration(color: drabDarkBrown),
                            alignment: Alignment.center,
                            width: 150.w,
                            padding: EdgeInsets.symmetric(horizontal: 4.5.w),
                            child: InkWell(
                              onTap: action,
                              child: AutoSizeText(
                                "SHARE WITH FRIENDS",
                                style: tTheme.bodySmall!.copyWith(
                                  fontSize: 13.5.r,
                                  color: ghostWhite,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxFontSize: 15,
                                minFontSize: 9,
                                maxLines: 1,
                              ),
                            ),
                          )*/
                        ],
                      ),
                    ),
                  ),
                  closedColor: beige,
                  openColor: ghostWhite,
                  openBuilder:
                      (_, void Function({Object? returnValue}) action) =>
                          EnterAvatarCodeBuilder(action),
                )
              ],
            ),
          );
  }
}
