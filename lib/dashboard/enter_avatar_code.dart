import 'package:animated_emoji/animated_emoji.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../router/my_route.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

class EnterAvatarCode extends ConsumerWidget {
  const EnterAvatarCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tTheme = Theme.of(context).textTheme;
    final MyUser? myUser = ref.watch(myUserProvider).value;
    /* final String avatarCodeTxt = myUser == null
        ? ""
        : myUser.avatarCode!
            .split('')
            .map((e) => emojiArr[int.parse(e)])
            .join();*/
    List<Widget> animatedEmojiList = myUser?.avatarCode
            ?.split('')
            .map((e) => animatedEmojiArr[int.parse(e)])
            .toList() ??
        <Widget>[];
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
                      RichText(
                        maxLines: 2,
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: SizedBox.square(
                                dimension: 45.r,
                                child: const AnimatedEmoji(
                                  AnimatedEmojis.wrappedGift,
                                ),
                              ),
                            ),
                            const TextSpan(
                                text: " Gift your friends, a new avatars")
                          ],
                          style: tTheme.bodyMedium!.copyWith(
                            height: 1.8.r,
                            color: drabDarkBrown,
                          ),
                        ),
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
                Container(
                  height: 54.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.5.r),
                    border: Border.all(color: gray, width: 0.75.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7.5.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            key: ValueKey(myUser.avatarCode),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) =>
                                  animatedEmojiList[index],
                              itemCount: 6,
                              separatorBuilder: (_, __) => Gap(1.5.r),
                            ),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 1,
                          child: InkWell(
                            onTap: () =>
                                context.router.push(const PassAvatarRoute()),
                            child: Icon(Icons.group, size: 30.r, color: gray),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
