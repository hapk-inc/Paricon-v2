import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../logic/app/ai_bloc.dart';
import '../../router/my_route.dart';
import '../../values/colors.dart';

class PlayFriendText extends ConsumerWidget {
  const PlayFriendText({super.key});

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
        title: Center(
          child: ListTile(
            tileColor: ghostWhite,
            title: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                "Play with Friends",
                style: textTheme.titleLarge?.copyWith(color: emerald),
                //maxLines: 3,
              ),
            ),
          ),
        ),
        subtitle: sub == null
            ? null
            : AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: AutoSizeText(
                  "👥 $sub 👥",
                  key: ValueKey(sub),
                  style: textTheme.bodyMedium?.copyWith(color: hookerGreen),
                  maxLines: 1,
                ),
              ),
      ),
    );
  }
}

class PlayFriendButton extends ConsumerWidget {
  const PlayFriendButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => StaggeredGridTile.fit(
        crossAxisCellCount: 15,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ElevatedButton(
            onPressed: () => context.router.push(const GameRoomRoute()),
            child: const Text("Create / Join Game"),
          ),
        ),
        /* child: Container(
        //height: 60.h,
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        padding: EdgeInsets.only(left: 15.w),
        decoration: BoxDecoration(
          color: lavender,
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7.5.r),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ButtonBar(
              //buttonHeight: 60.h,
              buttonPadding: EdgeInsets.all(3.6.r),
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              //overflowButtonSpacing: 0,
              children: [
                TextButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    context.router.push(GameRoomRoute());
                    //ref.read(dashboardPanelControllerProvider).open();
                    //ref.read(dashboardPanelProvider.notifier).state =
                    //    const CreateRoom();
                  } */ /*=> context.router.push(const PlayFriendRoute())*/ /*,
                  child: const Text("CREATE ROOM"),
                ),
                VerticalDivider(
                  indent: 7.5.h,
                  endIndent: 7.5.h,
                  color: frenchGray,
                ),
                TextButton(
                  style: const ButtonStyle(
                    maximumSize: MaterialStatePropertyAll(
                        Size.fromHeight(double.maxFinite)),
                  ),
                  onPressed: () {
                    // ref.read(dashboardPanelProvider.notifier).state =
                    //     const EnterRoomCode();
                  },
                  child: const Text("ENTER ROOM CODE"),
                ),
              ],
            ),
          ),
        ),
      ),*/
      );
}
