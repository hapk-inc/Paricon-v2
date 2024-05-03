import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';

import '../../logic/leaderboard/notifier.dart';
import '../../logic/user/notifier.dart';
import '../../model/player.dart';
import '../../model/user_record.dart';
import '../../my_widget/my_duration.dart';
import '../../values/colors.dart';
import '../../values/names.dart';

class LeaderBoard extends ConsumerStatefulWidget {
  const LeaderBoard({super.key});

  @override
  ConsumerState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends ConsumerState<LeaderBoard> {
  late List<Color> listColor;
  late LeaderBoardNotifier leaderBoardNotifier;

  @override
  void initState() {
    listColor = List.from(iconColor)..shuffle();
    leaderBoardNotifier = ref.refresh(leaderBoardNotifierProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    leaderBoardNotifier = ref.watch(leaderBoardNotifierProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 9,
          child: Container(
            alignment: Alignment.center,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
              title: Text("Overall . . .", style: textTheme.titleSmall),
            ),
          ),
        ),
        Gap(7.5.h),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 7.5.w),
            itemBuilder: (_, index) {
              final userRecord = leaderBoardNotifier.list.elementAt(index);
              return LeaderBoardTile(
                userRecord,
                color: listColor[index % 4],
              );
            },
            separatorBuilder: (_, __) => Gap(7.5.r),
            itemCount: leaderBoardNotifier.list.length,
          ),
        ),
        SizedBox(height: Theme.of(context).appBarTheme.toolbarHeight)
      ],
    );
  }
}

class LeaderBoardTile extends ConsumerWidget {
  final UserRecord record;
  final Color color;
  const LeaderBoardTile(this.record, {this.color = aquamarine, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final notifier = ref.read(leaderBoardNotifierProvider);
    final userNotifier = ref.watch(userNotifierProvider);
    return AspectRatio(
      aspectRatio: 4.8,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        alignment: Alignment.center,
        child: record.id == null
            ? null
            : ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                leading: AnimatedFlipCounter(
                  value: notifier.rank(record.id ?? ""),
                  //value: mockInteger(1, 10),
                  suffix: ".",
                  wholeDigits: 2,
                  textStyle: textTheme.headlineLarge,
                ),
                horizontalTitleGap: 7.5.w,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(radius: 24.r, backgroundColor: color),
                    Gap(7.5.w),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "No Name",
                          //NameGen.dummyName(),
                          style: textTheme.headlineLarge?.copyWith(
                            color: charcoal,
                          ),
                        ),
                        subtitle: Text(
                          "a few minutes ago",
                          style: textTheme.bodySmall?.copyWith(
                            color: frenchGray,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                trailing: MyDuration(
                  record.recordTimeTaken,
                  //Duration(milliseconds: mockInteger(10000, 99999)),
                  textColor: charcoal,
                  size: 18,
                ),
              ),
      ),
    );
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

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../logic/auth/bloc.dart';
import '../logic/leaderboard/notifier.dart';
import '../logic/user/bloc.dart';
import '../model/user_record.dart';
import '../values/colors.dart';

class LeaderBoardTile extends ConsumerWidget {
  final UserRecord record;
  const LeaderBoardTile(this.record, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LeaderBoardNotifier leaderBoardNotifier =
        ref.watch(leaderBoardNotifierProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final User? user = ref.watch(authUserProvider).value;

    final bool isFirst = leaderBoardNotifier.rank(record.id!) == 1;
    return GridTileBar(
      leading: AnimatedFlipCounter(
        value: leaderBoardNotifier.rank(record.id!),
        suffix: ".",
        wholeDigits: 2,
        textStyle: textTheme.headlineMedium?.copyWith(
          color: isFirst ? ghostWhite : null,
        ),
      ),
      //horizontalTitleGap: 15.w,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(7.5.r),
          ref.watch(playerProvider(record.id ?? "x")).maybeWhen(
                orElse: () => Container(),
                data: (data) => Text(
                  data?.name ?? "User#",
                  maxLines: 1,
                  style: textTheme.headlineMedium?.copyWith(
                    color: isFirst ? ghostWhite : null,
                  ),
                ),
              ),
          if (record.id == (user?.uid ?? "")) ...<Widget>[
            Gap(7.5.r),
            Text(
              "- You",
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12.r,
                color: isFirst ? ghostWhite : hookerGreen,
              ),
            )
          ],
          if (leaderBoardNotifier.rank(record.id!) == 1) ...[
            Gap(7.5.r),
            SizedBox.square(
              dimension: 24.r,
              child: Lottie.asset('lottie/trophy.json'),
            ),
          ]
        ],
      ),
      //  dense: true,
      trailing: Container(
        width: 135.w,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AnimatedFlipCounter(
                      //prefix: "⇣ ",
                      value: record.timeTaken.inMinutes,
                      suffix: " :",
                      wholeDigits: 2,
                      textStyle: textTheme.headlineLarge?.copyWith(
                        color: isFirst ? ghostWhite : null,
                      ),
                    ),
                    SizedBox.square(dimension: 4.5.r),
                    AnimatedFlipCounter(
                      value: record.timeTaken.inSeconds % 60,
                      wholeDigits: 2,
                      textStyle: textTheme.headlineLarge?.copyWith(
                        color: isFirst ? ghostWhite : null,
                      ),
                    ),
                    SizedBox.square(dimension: 4.5.r),
                    AnimatedFlipCounter(
                      value: record.timeTaken.inMilliseconds % 1000,
                      wholeDigits: 3,
                      mainAxisAlignment: MainAxisAlignment.end,
                      //padding: EdgeInsets.only(top: 1.5.r),
                      textStyle: textTheme.headlineSmall?.copyWith(
                        color: isFirst ? ghostWhite : frenchGray,
                        fontSize: 9.r,
                      ),
                    ),
                  ],
                ),
                if (record.recordDifference != "") ...[
                  Gap(7.5.r),
                  Text(
                    record.recordDifference,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 9.r,
                      height: 0,
                      color: isFirst ? ghostWhite : cornellRed,
                    ),
                  )
                ]
              ],
            ),
            const Spacer(),
            Text(
              record.lastPlayedDifference,
              style: textTheme.headlineSmall?.copyWith(
                color: isFirst ? ghostWhite : frenchGray,
              ),
            )
          ],
        ),
      ),
    );
  }
}

*/
