import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../logic/auth_provider.dart';
import '../logic/t_score.dart';
import '../logic/tournament_database.dart';
import '../model/best_d.dart';
import '../model/my_user.dart';
import '../model/t_duration.dart';
import '../theme/my_color.dart';

const List<double> _colSize = [0.12, 0.42, 0.36];
const List<String> colName = ['Rank', 'Name', 'Duration'];

class OpenChallengeTable extends ConsumerWidget {
  const OpenChallengeTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TDuration> recentTourList =
        ref.watch(recentTourListProvider).value ?? [];
    final User? fUser = ref.watch(authUserProvider).value;

    final List<String> bestDList = ref.watch(bestDListProvider).value ?? [];

    return Container(
      height: 300.h,
      color: lightOrange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recently Played",
                  style: TextStyle(
                    fontSize: 24.r,
                    color: caputMortuum,
                    fontFamily: 'WendyOne',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                OpenContainer(
                  closedBuilder:
                      (BuildContext context, void Function() action) => Text(
                    "View Leaderboard",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 15.r,
                          fontFamily: 'WendyOne',
                          color: cinerous,
                        ),
                  ),
                  closedColor: lightOrange,
                  middleColor: lightOrange,
                  closedElevation: 0,
                  openColor: lightOrange,
                  openBuilder: (BuildContext context,
                      void Function({Object? returnValue}) action) {
                    return ViewLeaderBoard(action);
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              constraints: const BoxConstraints.expand(),
              child: LayoutBuilder(
                builder: (_, BoxConstraints constraints) {
                  final double pH = constraints.maxHeight;
                  final double pW = constraints.maxWidth;

                  return Theme(
                    data: Theme.of(context).copyWith(dividerColor: charcoal),
                    child: DataTable(
                      horizontalMargin: 12.w,
                      dividerThickness: 0.6.r,
                      columnSpacing: 3.w,
                      headingRowHeight: pH * 0.18,
                      dataRowMinHeight: pH * 0.21,
                      dataRowMaxHeight: pH * 0.21,
                      headingTextStyle: TextStyle(
                        fontSize: 15.r,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: giantOrange,
                      ),
                      dataTextStyle: TextStyle(
                        fontSize: 15.r,
                        color: richBlack,
                        fontFamily: 'Poppins',
                      ),
                      columns: List.generate(
                        3,
                        (index) {
                          return DataColumn(
                            label: Container(
                              color: index == 3 ? chocolateCosmos : null,
                              width: pW * _colSize[index],
                              child: Text(colName[index]),
                            ),
                          );
                        },
                      ),
                      rows: recentTourList.isEmpty
                          ? []
                          : List.generate(
                              recentTourList.length <= 4
                                  ? recentTourList.length
                                  : 4,
                              (index) {
                                final TDuration tD = recentTourList[index];
                                final bool isMe = tD.userId == fUser!.uid;
                                final MyUser? xUser =
                                    ref.watch(xUserProvider(tD.userId)).value;

                                final int myRank = bestDList.indexOf(tD.userId);
                                // final
                                return DataRow(
                                  color: MaterialStatePropertyAll(
                                      isMe ? bitterSweet : null),
                                  cells: [
                                    DataCell(
                                      Container(
                                        width: pW * _colSize[0],
                                        margin:
                                            EdgeInsets.only(left: pW * 0.03),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${myRank + 1}".padLeft(2, '0'),
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.r,
                                            color:
                                                isMe ? lightOrange : cardinal,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Container(
                                        width: pW * _colSize[1],
                                        alignment: Alignment.centerLeft,
                                        child: AutoSizeText(
                                          xUser == null ? "" : xUser.name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13.2.r,
                                            color: isMe
                                                ? lightOrange
                                                : hookerGreen,
                                            fontFamily: 'Montserrat',
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: pW * _colSize[2],
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ShowPlayedDuration(
                                                tD.tDuration, isMe),
                                            ShowPlayedAt(tD.playedAt, isMe),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

final _listKey = GlobalKey<AnimatedListState>();

class ViewLeaderBoard extends ConsumerWidget {
  final void Function({Object? returnValue}) action;

  const ViewLeaderBoard(this.action, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(authUserProvider).value;
    if (user == null) return Container();
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 7.5.r),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: ref.watch(viewLeaderBoardProvider).when(
            data: (d) => Column(
                  children: [
                    SizedBox(
                      height: 60.h,
                      //color: xantHous,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: action,
                            icon: Icon(Icons.close,
                                size: 21.r, color: caputMortuum),
                          ),
                          Text(
                            "View LeaderBoard",
                            style:
                                TextStyle(color: caputMortuum, fontSize: 21.r),
                          )
                        ],
                      ),
                    ),
                    const ViewLeaderBoardHeader(),
                    //  Divider(color: gray, thickness: 0.45.r),
                    Expanded(
                      child: AnimatedList(
                        key: _listKey,
                        itemBuilder:
                            (_, int index, Animation<double> animation) {
                          final BestD best = d.values.elementAt(index);
                          final String xID = d.keys.elementAt(index);
                          final bool isMe = xID == user.uid;
                          return Container(
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: isMe ? giantOrange : lightOrange,
                              borderRadius: BorderRadius.circular(3.r),
                              border: Border(
                                bottom: BorderSide(width: 0.24.r),
                              ),
                            ),
                            child: DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 15.r,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                color: caputMortuum,
                              ),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 7.2.r),
                                      alignment: Alignment.centerLeft,
                                      child: AnimatedFlipCounter(
                                        value: (index + 1),
                                        wholeDigits: 2,
                                        textStyle: TextStyle(
                                            color: isMe
                                                ? lightOrange
                                                : caputMortuum),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 10,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: ref
                                          .watch(xUserProvider(xID))
                                          .maybeWhen(
                                            data: (a) => Text(
                                              a!.name,
                                              style: TextStyle(
                                                  color: isMe
                                                      ? lightOrange
                                                      : caputMortuum),
                                            ),
                                            orElse: () => Container(),
                                          ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 7,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText.rich(
                                        showTScore(
                                          best.bestD,
                                          tSize: 15,
                                          sSize: 10.8,
                                          //family: 'WendyOne',
                                          minute:
                                              isMe ? lightOrange : caputMortuum,
                                          mm: isMe ? lightOrange : oldRose,
                                        ),
                                        maxLines: 1,
                                        style: TextStyle(letterSpacing: 0.3.r),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        initialItemCount: d.length,
                      ),
                    ),
                  ],
                ),
            error: (e, s) => Container(),
            loading: () => Container()),
      ),
    );
  }
}

class ViewLeaderBoardHeader extends StatelessWidget {
  const ViewLeaderBoardHeader({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 36.h,
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 16.5.r,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            color: giantOrange,
          ),
          child: const Row(
            children: [
              Flexible(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Rank"),
                ),
              ),
              Flexible(
                flex: 10,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Name"),
                ),
              ),
              Flexible(
                flex: 7,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Duration"),
                ),
              ),
            ],
          ),
        ),
      );
}

class ShowPlayedDuration extends StatelessWidget {
  final Duration tDuration;
  final bool isMe;
  const ShowPlayedDuration(this.tDuration, this.isMe, {super.key});

  @override
  Widget build(BuildContext context) => AutoSizeText.rich(
        showTScore(
          tDuration,
          tSize: 15,
          sSize: 10.8,
          //family: 'WendyOne',
          minute: isMe ? lightOrange : caputMortuum,
          mm: isMe ? lightOrange : oldRose,
        ),
        maxLines: 1,
        style: TextStyle(letterSpacing: 0.3.r),
      );
}

class ShowPlayedAt extends StatelessWidget {
  final DateTime playedAt;
  final bool isMe;
  const ShowPlayedAt(this.playedAt, this.isMe, {super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(right: 1.5.w),
        child: Text(
          DateTime.now().day == playedAt.day
              ? DateFormat.Hm().format(playedAt)
              : DateFormat.MMMd().format(playedAt),
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
            color: isMe ? lavenderWeb : gray,
            fontSize: 9.r,
            letterSpacing: 0.r,
          ),
        ),
      );
}
