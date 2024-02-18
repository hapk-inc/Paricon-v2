import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import '../router/my_route.dart';

import '../logic/auth_provider.dart';
import '../logic/t_score.dart';
import '../logic/tournament_database.dart';
import '../model/my_user.dart';
import '../model/t_duration.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

const List<double> _colSize = [0.10, 0.44, 0.36];
const List<String> colName = ['Rank', 'Name', 'Duration'];

const int tableCount = 5;

class OpenChallengeTable extends ConsumerWidget {
  const OpenChallengeTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TDuration> recentTourList =
        ref.watch(recentTourListProvider).value ?? [];
    final User? fUser = ref.watch(authUserProvider).value;

    final List<String> bestDList = ref.watch(bestDListProvider).value ?? [];

    List<DataRow> dRow(BoxConstraints constraints) => List.generate(
          recentTourList.length <= tableCount
              ? recentTourList.length
              : tableCount,
          (index) {
            final TDuration tD = recentTourList[index];
            final bool isMe = tD.userId == fUser!.uid;
            final MyUser? xUser = ref.watch(xPlayerProvider(tD.userId)).value;

            final int myRank = bestDList.indexOf(tD.userId);

            return _dataRow(isMe, constraints, myRank, xUser, tD);
          },
        );

    return Container(
      height: 315.h,
      color: lightOrange,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: LayoutBuilder(
          builder: (_, BoxConstraints constraints) {
            final double pW = constraints.maxWidth;

            return Theme(
              data: Theme.of(context).copyWith(dividerColor: charcoal),
              child: DataTable(
                horizontalMargin: 12.w,
                dividerThickness: 0.6.r,
                columnSpacing: 3.w,
                headingRowHeight: 45.h,
                dataRowMinHeight: 48.h,
                dataRowMaxHeight: 54.h,
                headingTextStyle: TextStyle(
                  fontSize: 15.r,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: giantOrange,
                ),
                dataTextStyle: TextStyle(
                  fontSize: 13.5.r,
                  color: richBlack,
                  fontFamily: 'Montserrat',
                ),
                columns: List.generate(
                  3,
                  (index) => DataColumn(
                    label: Container(
                      color: index == 3 ? chocolateCosmos : null,
                      width: pW * _colSize[index],
                      child: index == 2
                          ? Row(
                              children: [
                                Text(colName[index]),
                                const Spacer(),
                                InkWell(
                                  onTap: () => context.router
                                      .push(const ViewLeaderBoardRoute()),
                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                      fontSize: 12.r,
                                      color: gray,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Text(colName[index]),
                    ),
                  ),
                ),
                rows: recentTourList.isEmpty ? [] : dRow(constraints),
              ),
            );
          },
        ),
      ),
    );
  }
}

DataRow _dataRow(bool isMe, BoxConstraints constraints, int myRank,
    MyUser? xUser, TDuration tD) {
  final double pW = constraints.maxWidth;
  bool showFirstTime = tD.firstTime &&
      (DateTime.now().difference(tD.playedAt) < const Duration(hours: 12));
  return DataRow(
    color: MaterialStatePropertyAll(isMe ? bitterSweet : null),
    cells: [
      DataCell(
        Container(
          width: pW * _colSize[0],
          margin: EdgeInsets.only(left: pW * 0.03),
          alignment: Alignment.centerLeft,
          child: AnimatedFlipCounter(
            value: myRank + 1,
            textStyle: TextStyle(
              color: isMe ? lightOrange : cardinal,
              letterSpacing: 0,
            ),
            wholeDigits: 2,
          ),
        ),
      ),
      DataCell(
        Container(
          width: pW * _colSize[1],
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: showFirstTime ? 90.w : double.infinity,
                ),
                child: AutoSizeText(
                  xUser == null ? "" : firstCaps(xUser.name),
                  style: TextStyle(
                    color: isMe ? lightOrange : hookerGreen,
                    letterSpacing: 0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (showFirstTime) ...[
                Gap(15.r),
                AnimatedTextKit(
                  pause: Duration(seconds: mockInteger(1, 5)),
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'First\nTime',
                      textStyle: TextStyle(
                        fontSize: 10.5.r,
                        fontFamily: 'LuckiestGuy',
                        letterSpacing: 0.72.r,
                        height: 1.5.r,
                      ),
                      colors: isMe ? [ghostWhite, ghostWhite] : colorizedColor,
                    ),
                  ],
                  totalRepeatCount: isMe ? 1 : 3,
                  //repeatForever: true,
                  onTap: () {
                    debugPrint("Tap Event");
                  },
                ),
              ]
            ],
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: pW * _colSize[2],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShowPlayedDuration(tD.tDuration, isMe),
              ShowPlayedAt(tD.playedAt, isMe),
            ],
          ),
        ),
      ),
    ],
  );
}

class ShowPlayedDuration extends StatelessWidget {
  final Color? color;
  final Duration tDuration;
  final bool isMe;
  const ShowPlayedDuration(this.tDuration, this.isMe, {this.color, super.key});

  @override
  Widget build(BuildContext context) => AutoSizeText.rich(
        showTScore(
          tDuration,
          tSize: 15,
          sSize: 10.8,
          minute: color ?? (isMe ? lightOrange : caputMortuum),
          mm: color ?? (isMe ? lightOrange : oldRose),
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
            fontWeight: FontWeight.w300,
            color: isMe ? lavenderWeb : gray,
            fontSize: 9.r,
            letterSpacing: 0.r,
          ),
        ),
      );
}
