import 'package:flutter/material.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/*

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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

    final int listSize = leaderBoardNotifier.list.length;

    //final sizeNotifier = ref.watch(sizeProvider.notifier);

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

    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: Container(
        height: 330.h,
        color: magnolia,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listSize > 6 ? 6 : listSize,
          itemBuilder: (_, index) {
            final UserRecord record = leaderBoardNotifier.list[index];
            return Container(
                color: leaderBoardNotifier.rank(record.id!) == 1
                    ? violetBlue
                    : index.isEven
                    ? magnolia
                    : ghostWhite,
                alignment: Alignment.center,
                height: 54.h,
                padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                child: LeaderBoardTile(record));
          },
        ),
      ),
    );
  }
}
*/
