import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../logic/app/size_provider.dart';
import '../logic/leaderboard/notifier.dart';
import '../model/user_record.dart';
import '../values/colors.dart';
import 'leaderboard_tile.dart';

class LeaderBoard extends ConsumerStatefulWidget {
  const LeaderBoard({super.key});

  @override
  ConsumerState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends ConsumerState<LeaderBoard> {
  late LeaderBoardNotifier leaderBoardNotifier;

  @override
  Widget build(BuildContext context) {
    leaderBoardNotifier = ref.watch(leaderBoardNotifierProvider);
    final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

    final sizeNotifier = ref.watch(sizeProvider.notifier);

    ref.listen(
      leaderBoardNotifierProvider.select((value) => value.list),
      (previous, next) {
        if (previous != null) {
          List<UserRecord> newList =
              next.where((e) => previous.contains(e)).toList();

          for (var _ in newList) {
            listKey.currentState?.insertItem(0);
          }
        } else {
          debugPrint("Previous is null");
        }
      },
    );

    return StaggeredGridTile.count(
      crossAxisCellCount: 15,
      mainAxisCellCount: (sizeNotifier.isP ? 2.1 : 2.01) *
          (leaderBoardNotifier.list.isEmpty
              ? 1
              : leaderBoardNotifier.list.length),
      child: FadeIn(
        child: AnimatedList(
          physics: const NeverScrollableScrollPhysics(),
          key: listKey,
          initialItemCount: leaderBoardNotifier.list.length > 6
              ? 6
              : leaderBoardNotifier.list.length,
          itemBuilder: (_, index, animation) => AspectRatio(
            aspectRatio: sizeNotifier.isP ? 7.5 : 7.8,
            child: Container(
              color: leaderBoardNotifier
                          .rank(leaderBoardNotifier.list[index].id!) ==
                      1
                  ? linen
                  : index.isEven
                      ? magnolia
                      : magnolia1,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: LeaderBoardTile(leaderBoardNotifier.list[index]),
            ),
          ),
        ),
      ),
    );
  }
}
