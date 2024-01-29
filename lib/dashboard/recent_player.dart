import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/user_activity_provider.dart';
import '../model/user_activity.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

class RecentPlayer extends ConsumerWidget {
  const RecentPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final User fUser = ref.watch(authUserProvider).value!;
    final tTheme = Theme.of(context).textTheme.titleLarge!;

    return StaggeredGridTile.fit(
      crossAxisCellCount: 20,
      child: Container(
        height: 120.h,
        alignment: Alignment.center,
        child: FirebaseAnimatedList(
          scrollDirection: Axis.horizontal,
          sort: (DataSnapshot a, DataSnapshot b) {
            Map<String, dynamic> a1 = Map<String, dynamic>.from(a.value as Map);
            Map<String, dynamic> b1 = Map<String, dynamic>.from(b.value as Map);

            final UserActivity x = UserActivity.fromJson(a1);
            final UserActivity y = UserActivity.fromJson(b1);
            return y.nowTime.compareTo(x.nowTime);
          },
          query: ref.watch(recentUserProvider),
          padding: EdgeInsets.only(left: 15.w, top: 15.h),
          defaultChild: FadeIn(
            child: Center(
              child: Text(
                "Loading",
                style: tTheme.copyWith(fontFamily: 'Poppins', color: gray),
              ),
            ),
          ),
          itemBuilder: (_, DataSnapshot snapshot, Animation<double> animation,
              int index) {
            //if (fUser.uid == snapshot.key!) return Container();

            Map<String, dynamic> json =
                Map<String, dynamic>.from(snapshot.value as Map);
            final UserActivity xUser = UserActivity.fromJson(json);

            return RecentPlayerTile(xUser);
          },
        ),
      ),
    );
  }
}

class RecentPlayerTile extends StatelessWidget {
  final UserActivity xUser;
  const RecentPlayerTile(this.xUser, {super.key});

  @override
  Widget build(BuildContext context) {
    final tTheme = Theme.of(context).textTheme.titleLarge!;

    final DateTime today = DateTime.now();
    final bool notActive = xUser.isActive && (xUser.nowTime.day == today.day);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: EdgeInsets.only(right: 6.r, left: 6.r),
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
                radius: 33.r,
                backgroundColor: violetBlue,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: xUser.avatar == null
                      ? Text(
                          xUser.name!.substring(0, 2).toUpperCase(),
                          style: tTheme.copyWith(
                            color: lightOrange,
                            letterSpacing: 0,
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
          Gap(2.4.r),
          Expanded(
            child: AutoSizeText(
              firstCaps(xUser.name!),
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: federalBlue),
              wrapWords: false,
              maxFontSize: 15,
              minFontSize: 9,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
