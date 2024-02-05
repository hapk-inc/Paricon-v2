import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:paricon/theme/my_theme.dart';

import '../logic/auth_provider.dart';
import '../logic/t_score.dart';
import '../logic/tournament_database.dart';
import '../model/my_user.dart';
import '../model/t_duration.dart';
import '../theme/my_color.dart';

const List<double> _colSize = [0.12, 0.42, 0.36];
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
            final MyUser? xUser = ref.watch(xUserProvider(tD.userId)).value;

            final int myRank = bestDList.indexOf(tD.userId);
            // final
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
                      child: Text(colName[index]),
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

/*  Container(
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),

            //color: cornellRed,
            alignment: Alignment.centerLeft,
            child: DefaultTextStyle(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18.r,
                color: chocolateCosmos,
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(seconds: 3),
                animatedTexts: [
                  RotateAnimatedText(
                    'Recently Played',
                    alignment: Alignment.centerLeft,
                    rotateOut: false,
                    duration: const Duration(milliseconds: 500),
                  ),
                  RotateAnimatedText(
                    'This week 3 players played so far',
                    alignment: Alignment.centerLeft,
                    rotateOut: false,
                    duration: const Duration(milliseconds: 500),
                  ),
                  RotateAnimatedText(
                    'Your rank is ',
                    alignment: Alignment.centerLeft,
                    rotateOut: false,
                    duration: const Duration(milliseconds: 500),
                  ),
                ],
              ),
            ),
          ),*/

DataRow _dataRow(bool isMe, BoxConstraints constraints, int myRank,
    MyUser? xUser, TDuration tD) {
  final double pW = constraints.maxWidth;
  return DataRow(
    color: MaterialStatePropertyAll(isMe ? bitterSweet : null),
    cells: [
      DataCell(
        Container(
          width: pW * _colSize[0],
          margin: EdgeInsets.only(left: pW * 0.03),
          alignment: Alignment.centerLeft,
          child: Text(
            "${myRank + 1}".padLeft(2, '0'),
            style: TextStyle(color: isMe ? lightOrange : cardinal),
          ),
        ),
      ),
      DataCell(
        Container(
          width: pW * _colSize[1],
          alignment: Alignment.centerLeft,
          child: AutoSizeText(
            xUser == null ? "" : firstCaps(xUser.name),
            style: TextStyle(color: isMe ? lightOrange : hookerGreen),
            maxLines: 1,
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
  final Duration tDuration;
  final bool isMe;
  const ShowPlayedDuration(this.tDuration, this.isMe, {super.key});

  @override
  Widget build(BuildContext context) => AutoSizeText.rich(
        showTScore(
          tDuration,
          tSize: 15,
          sSize: 10.8,
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
            fontWeight: FontWeight.w600,
            color: isMe ? lavenderWeb : gray,
            fontSize: 9.r,
            letterSpacing: 0.r,
          ),
        ),
      );
}
