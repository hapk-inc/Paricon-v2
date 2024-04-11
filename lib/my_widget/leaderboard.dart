import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
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
      mainAxisCellCount: sizeNotifier.isP ? 12.45 : 10.5,
      child: Container(
        color: magnolia1,
        alignment: Alignment.center,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: leaderBoardNotifier.list.length,
          itemBuilder: (context, index) {
            final UserRecord record = leaderBoardNotifier.list[index];
            return SlideInLeft(
              child: FadeIn(
                child: AspectRatio(
                  aspectRatio: sizeNotifier.isP ? 7.5 : 9,
                  child: Container(
                      color: /*leaderBoardNotifier
                                  .rank(leaderBoardNotifier.list[index].id!) ==
                              1
                          ? magnolia1
                          : */
                          index.isEven ? magnolia : magnolia1,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: LeaderBoardTile(record)),
                ),
              ),
            );
          },
        ),
      ),
      /* mainAxisCellCount: (sizeNotifier.isP ? 2.4 : 2.01) *
          (leaderBoardNotifier.list.isEmpty
              ? 1
              : leaderBoardNotifier.list.length),*/
    );
  }
}

/*   child: Container(
        color: xantHous,
        height: sizeNotifier.isP ? 360.h : 420.h,
        alignment: Alignment.topCenter,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: false,
          child: AnimatedList(
            //clipBehavior: Clip.none,
            //shrinkWrap: false,
            reverse: true,
            /*controller: ScrollController(
              initialScrollOffset: 0,
              keepScrollOffset: false,
            ),*/
            key: listKey,
            padding: EdgeInsets.zero,
            initialItemCount: leaderBoardNotifier.list.length > 6
                ? 6
                : leaderBoardNotifier.list.length,
            itemBuilder: (_, index, animation) => SlideTransition(
              position: animation.drive(
                Tween(begin: Offset.zero, end: const Offset(0, 1.0)),
              ),
              child: AspectRatio(
                aspectRatio: sizeNotifier.isP ? 7.5 : 8.1,
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
        ),
      ),*/
