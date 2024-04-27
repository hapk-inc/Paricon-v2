import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../enums/enums.dart';
import '../../../logic/app/game_match_bloc.dart';
import '../../../logic/room/bloc.dart';
import '../../../router/my_route.dart';
import '../../../values/colors.dart';

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
            onPressed: () => ref.read(createRoomProvider.future).then(
              (id) {
                // ref.read(idNotifier.notifier).state = id;
                ref.read(matchNotifierProvider.notifier).state =
                    GameMatch.playFriend;
                context.router.push(const GameRoomRoute());
              },
            ),
            child: const Text("Create Room"),
          ),
        ),
      );
}
