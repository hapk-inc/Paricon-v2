import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../enums/enums.dart';
import '../../logic/app/game_match_bloc.dart';
import '../../logic/room/bloc.dart';
import '../../logic/room/create_room.dart';
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
            children: const <Widget>[
                  StaggeredGap(),
                ] +
                [CreateRoom(ref.watch(createRoomNotifierProvider))] +
                const <Widget>[
                  StaggeredGap(),
                  PlayFriendBtn(),
                  StaggeredGap(),
                  DPlayFriend(),
                ],
          ),
        ),
      );
}

class PlayFriendBtn extends ConsumerWidget {
  const PlayFriendBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => StaggeredGridTile.fit(
        crossAxisCellCount: 15,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(darkPurple),
            ),
            //onPressed: () {},
            onPressed: () {
              context.router.push(const GameRoomRoute());

              /*ref.read(createRoomProvider.future).then(
                (flag) {
                  ref.read(idNotifier.notifier).state = flag;
                  ref.read(matchNotifierProvider.notifier).state =
                      GameMatch.playFriend;
                  // if (flag) {
                  context.router.push(const GameRoomRoute());
                  //}
                },
              );*/
            },
            child: const Text("Create Room"),
          ),
        ),
      );
}
