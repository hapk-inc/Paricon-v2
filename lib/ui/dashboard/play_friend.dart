import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../my_widget/staggered_gap.dart';
import '../../router/my_route.dart';
import '../../values/colors.dart';
import '../../my_widget/create_room.dart';
import 'play_friend/play_friend_text.dart';

class PlayFriend extends ConsumerWidget {
  const PlayFriend({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SingleChildScrollView(
        child: FadeIn(
          child: StaggeredGrid.count(
            crossAxisCount: 15,
            mainAxisSpacing: 15.r,
            children: const [
              //DPlayFriend(),
              StaggeredGap(),
              CreateRoom(),
              StaggeredGap(),
              PlayFriendBtn(), StaggeredGap(),
              DPlayFriend(),
            ],
          ),
        ),
      );
}

class PlayFriendBtn extends StatelessWidget {
  const PlayFriendBtn({super.key});

  @override
  Widget build(BuildContext context) => StaggeredGridTile.fit(
        crossAxisCellCount: 15,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ElevatedButton(
            style: const ButtonStyle(
              /*shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),*/
              backgroundColor: MaterialStatePropertyAll(hookerGreen),
            ),
            onPressed: () => context.router.push(const GameRoomRoute()),
            child: const Text("Create Room"),
          ),
        ),
      );
}
