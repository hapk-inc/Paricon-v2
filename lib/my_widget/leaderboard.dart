import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../logic/app/size_provider.dart';
import '../logic/auth/bloc.dart';
import '../logic/leaderboard/bloc.dart';
import '../logic/leaderboard/notifier.dart';
import '../logic/user/bloc.dart';
import '../model/user_record.dart';
import '../values/colors.dart';
import '../values/names.dart';

class LeaderBoard extends ConsumerStatefulWidget {
  const LeaderBoard({super.key});

  @override
  ConsumerState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends ConsumerState<LeaderBoard> {
  late LeaderBoardNotifier leaderBoardNotifier;

  @override
  void initState() {
    leaderBoardNotifier = ref.refresh(leaderBoardNotifierProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final sizeNotifier = ref.watch(sizeProvider.notifier);

    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(3),
          1: FlexColumnWidth(9),
          2: FlexColumnWidth(5),
          3: FlexColumnWidth(3),
        },
        children: [
          _header(sizeNotifier.isP, textTheme),
          ...leaderBoardNotifier.list
              .map((e) => _header(sizeNotifier.isP, textTheme))
        ],
      ),
    );
  }
}

TableRow _header(bool isP, TextTheme textTheme) => TableRow(
      decoration: const BoxDecoration(color: magnolia),
      children: ["Rank", "Name", "Duration", "When"]
          .map(
            (String e) => Container(
              height: isP ? 48.h : 60.h,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 12.w),
              child: Text(
                e,
                maxLines: 1,
                style: textTheme.headlineMedium
                    ?.copyWith(color: e == "When" ? frenchGray : gray),
              ),
            ),
          )
          .toList(),
    );

TableRow leaderBoardTile(int index, UserRecord record, bool isMe,
        TextTheme textTheme, Ref ref, bool isP) =>
    TableRow(
      decoration: BoxDecoration(
          color: index.isEven ? magnolia : magnolia1,
          border: isMe
              ? Border(
                  top: BorderSide(width: 0.75.r, color: tropicalIndigo),
                  bottom: BorderSide(width: 0.75.r, color: tropicalIndigo),
                )
              : null),
      children: List.from(
        [
          Text(
            "${index + 1}".padLeft(2, '0'),
            maxLines: 1,
            style: textTheme.headlineMedium,
          ),
          ref.watch(playerProvider(record.id!)).maybeWhen(
                orElse: () => Container(),
                data: (data) => Text(
                  data?.name ?? "User#",
                  maxLines: 1,
                  style: textTheme.headlineMedium,
                ),
              ),
          Text(
            record.durationString,
            maxLines: 1,
            style: textTheme.headlineLarge,
          ),
          Text(
            "03: 34",
            maxLines: 1,
            style: textTheme.bodySmall,
          )
        ].map(
          (Widget e) => Container(
            height: isP ? 48.h : 60.h,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 12.w),
            child: e,
          ),
        ),
      ),
    );

/*
class LeaderBoard extends ConsumerWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final sizeNotifier = ref.watch(sizeProvider.notifier);
    final User? user = ref.watch(authUserProvider).value;

    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: FirestoreQueryBuilder<UserRecord>(
        query: ref.read(queryLeaderboardProvider),
        builder: (_, snapshot, __) => Table(
          columnWidths: const {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(9),
            2: FlexColumnWidth(5),
            3: FlexColumnWidth(3),
          },
          children: [
            TableRow(
              decoration: const BoxDecoration(color: magnolia),
              children: ["Rank", "Name", "Duration", "When"]
                  .map(
                    (String e) => Container(
                      height: sizeNotifier.isP ? 48.h : 60.h,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 12.w),
                      child: Text(
                        e,
                        maxLines: 1,
                        style: textTheme.headlineMedium
                            ?.copyWith(color: e == "When" ? frenchGray : gray),
                      ),
                    ),
                  )
                  .toList(),
            ),
            ...List.generate(
              snapshot.docs.length,
              (index) {
                final String id = snapshot.docs[index].id;
                UserRecord userRecord = snapshot.docs[index].data();
                final bool isMe = (user?.uid ?? "") == id;
                return TableRow(
                  decoration: BoxDecoration(
                      color: index.isEven ? magnolia : magnolia1,
                      border: isMe
                          ? Border(
                              top: BorderSide(
                                  width: 0.75.r, color: tropicalIndigo),
                              bottom: BorderSide(
                                  width: 0.75.r, color: tropicalIndigo),
                            )
                          : null),
                  children: List.from(
                    [
                      Text(
                        "${index + 1}".padLeft(2, '0'),
                        maxLines: 1,
                        style: textTheme.headlineMedium,
                      ),
                      ref.watch(playerProvider(id)).maybeWhen(
                            orElse: () => Container(),
                            data: (data) => Text(
                              data?.name ?? "User#",
                              maxLines: 1,
                              style: textTheme.headlineMedium,
                            ),
                          ),
                      Text(
                        userRecord.durationString,
                        maxLines: 1,
                        style: textTheme.headlineLarge,
                      ),
                      Text(
                        "03: 34",
                        maxLines: 1,
                        style: textTheme.bodySmall,
                      )
                    ].map(
                      (Widget e) => Container(
                        height: sizeNotifier.isP ? 48.h : 60.h,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 12.w),
                        child: e,
                      ),
                    ),
                  ),
                );
              },
            )
          ],
          */
/*children: List.generate(
            //mockInteger(5, 7),
            7,
            (index) => TableRow(
              decoration: const BoxDecoration(color: magnolia),
              children: ["Rank", "Name", "Duration", "When"]
                  .map(
                    (String e) => Container(
                      height: sizeNotifier.isP ? 54.h : 60.h,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 12.w),
                      child: Text(
                        e,
                        maxLines: 1,
                        style: textTheme.headlineMedium,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),*/ /*

        ),
      ),
    );
  }
}
*/
