import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

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
                        "Enter their code below "
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
                    height: 48.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.5.r),
                    ),
                    padding: EdgeInsets.only(left: 15.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.5.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            myUser.avatarCode ?? "`",
                            style: tTheme.bodySmall!.copyWith(
                              fontSize: 18.r,
                              color: bloodRed,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.12.r,
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            decoration:
                                const BoxDecoration(color: drabDarkBrown),
                            alignment: Alignment.center,
                            width: 120.w,
                            padding: EdgeInsets.symmetric(horizontal: 4.5.w),
                            child: InkWell(
                              onTap: action,
                              child: AutoSizeText(
                                "VIEW MY AVATAR",
                                style: tTheme.bodySmall!.copyWith(
                                  fontSize: 13.2.r,
                                  color: ghostWhite,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxFontSize: 15,
                                minFontSize: 9,
                                maxLines: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  closedColor: citron,
                  openColor: seaSalt,
                  openBuilder:
                      (_, void Function({Object? returnValue}) action) =>
                          EnterAvatarCodeOpenBuilder(action),
                )
              ],
            ),
          );
  }
}

class EnterAvatarCodeOpenBuilder extends StatelessWidget {
  final void Function({Object? returnValue}) action;
  const EnterAvatarCodeOpenBuilder(this.action, {super.key});

  @override
  Widget build(BuildContext context) {
    final pTheme = SlidingPanelTheme();
    return GridView.custom(
      padding: pTheme.slidingPanelPadding,
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        mainAxisSpacing: 3.r,
        crossAxisSpacing: 3.r,
        pattern: [
          //const WovenGridTile(1, crossAxisRatio: 0.9),
          const WovenGridTile(
            5 / 6,
            crossAxisRatio: 0.9,
            alignment: AlignmentDirectional.centerEnd,
          ),
          const WovenGridTile(1, crossAxisRatio: 0.9),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          color: cornellRed,
          margin: EdgeInsets.all(3.r),
        ),
        childCount: 5,
      ),
    );
  }
}
