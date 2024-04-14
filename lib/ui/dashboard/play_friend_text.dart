import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../enums/enums.dart';
import '../../logic/app/ai_bloc.dart';
import '../../logic/app/game_match_bloc.dart';
import '../../router/my_route.dart';
import '../../values/colors.dart';

class DPlayFriend extends ConsumerWidget {
  const DPlayFriend({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? sub = ref.watch(subPlayFriendTextProvider).maybeWhen(
          data: (data) => data,
          orElse: () => null,
          error: (error, stackTrace) => "Try multiplayer game",
        );
    final TextTheme textTheme = Theme.of(context).textTheme;
    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
        title: ListTile(
          tileColor: ghostWhite,
          title: AutoSizeText(
            "Play with Friends Online",
            style: textTheme.titleLarge?.copyWith(color: violetBlue),
            maxLines: 1,
            //maxLines: 3,
          ),
          subtitle: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: sub == null
                  ? Container()
                  : Text(
                      "$sub 👥",
                      key: ValueKey(sub),
                      style: textTheme.bodyMedium?.copyWith(color: charcoal),
                      maxLines: 2,
                    ),
            ),
          ),
        ),
        subtitle: SizedBox(
          height: 120.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60.h,
                padding: EdgeInsets.only(left: 15.w),
                decoration: BoxDecoration(
                  color: magnolia,
                  borderRadius: BorderRadius.circular(7.5.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7.5.r),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: AutoSizeText(
                          "Enter room code here. . .",
                          style: textTheme.bodyMedium?.copyWith(color: gray),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => context.router.push(const GameRoomRoute()),
                        child: Container(
                          height: double.maxFinite,
                          alignment: Alignment.center,
                          color: violetBlue,
                          width: 120.w,
                          child: Text(
                            "CREATE ROOM",
                            style: textTheme.headlineMedium!.copyWith(
                              color: ghostWhite,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
