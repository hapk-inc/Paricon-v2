import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/auth_provider.dart';
import '../logic/user_provider.dart';
import '../model/p_user.dart';
import '../my_widget/show_t_score.dart';
import '../theme/my_color.dart';

class ShortLeaderBoard extends ConsumerWidget {
  const ShortLeaderBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? firebaseUser = ref.watch(authUserProvider).value;

    return firebaseUser == null
        ? Container()
        : FirestoreQueryBuilder<PUser>(
            query: ref
                .read(bestDurationCollReferenceProvider)
                .where('bestDuration', isNull: false)
                .orderBy('bestDuration'),
            builder: (BuildContext context,
                FirestoreQueryBuilderSnapshot<PUser> snapshot, Widget? child) {
              if (!snapshot.hasData) return Container();
              debugPrint("Overall T-Played ${snapshot.docs.length}");
              List<QueryDocumentSnapshot<PUser>> overallTList =
                  List.from(snapshot.docs);

              return ShowListTable(overallTList);
            },
          );
  }
}

class ShowListTable extends ConsumerWidget {
  final List<QueryDocumentSnapshot<PUser>> overallTList;
  const ShowListTable(this.overallTList, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? firebaseUser = ref.watch(authUserProvider).value;

    if (firebaseUser == null) return Container();

    late List<QueryDocumentSnapshot<PUser>> showList;
    if (overallTList.length < 5) {
      showList = overallTList;
    } else {
      late int myRank;
      bool haveIPlayed = overallTList.any((e) => e.id == firebaseUser.uid);
      myRank = haveIPlayed
          ? overallTList.indexWhere((e) => e.id == firebaseUser.uid)
          : 0;
      final int tLength = overallTList.length;
      showList = !haveIPlayed
          //? overallTList.docs.sublist(overallPlayers - 4, overallPlayers)
          ? overallTList.sublist(tLength - 4, tLength)
          : myRank < 4
              ? overallTList.sublist(0, 5)
              : (myRank - 3).isNegative
                  ? overallTList.sublist(0, myRank + 1)
                  : overallTList.sublist(myRank - 3, myRank + 1);
    }

    return Align(
      alignment: Alignment.topCenter,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double pH = constraints.maxHeight;
          final double pW = constraints.maxWidth;

          return DataTable(
            horizontalMargin: 6.w,
            columnSpacing: 3.w,
            headingRowHeight: pH * 0.18,
            dataRowMinHeight: pH * 0.21,
            dataRowMaxHeight: pH * 0.21,
            headingTextStyle: TextStyle(
              fontSize: 12.r,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              color: giantOrange,
            ),
            dataTextStyle: TextStyle(
              fontSize: 15.r,
              color: richBlack,
              fontFamily: 'Poppins',
            ),
            columns: [
              DataColumn(
                label: SizedBox(
                  width: pW * 0.15,
                  child: const Text("Rank"),
                ),
              ),
              DataColumn(
                label: SizedBox(
                  width: pW * 0.39,
                  child: const Text("Name"),
                ),
              ),
              DataColumn(
                label: SizedBox(
                  width: pW * 0.36,
                  child: const Text("Duration"),
                ),
              ),
            ],
            rows: List.from(
              showList.map(
                (e) {
                  final String i = e.id;
                  final bool isMe = firebaseUser.uid == i;
                  final PUser pUser = e.data();
                  final int r = (overallTList.indexWhere((e) => e.id == i) + 1);
                  return _showListTableRow(pUser, r, isMe, constraints);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

DataRow _showListTableRow(
    PUser pUser, int r, bool isMe, BoxConstraints constraints) {
  final double pW = constraints.maxWidth;

  return DataRow(
    color: MaterialStatePropertyAll(isMe ? bitterSweet : null),
    cells: [
      DataCell(
        Container(
          width: pW * 0.15,
          margin: EdgeInsets.only(left: pW * 0.03),
          alignment: Alignment.centerLeft,
          child: Text(
            "$r".padLeft(2, '0'),
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14.r,
              color: isMe ? lightOrange : cardinal,
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          width: pW * 0.39,
          alignment: Alignment.centerLeft,
          child: AutoSizeText(
            pUser.name,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 10.5.r,
              color: isMe ? lightOrange : hookerGreen,
              fontFamily: 'Montserrat',
            ),
            maxLines: 1,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: pW * 0.36,
          child: pUser.bestDuration == null
              ? Container()
              : AutoSizeText.rich(
                  showTScore(
                    pUser.bestDuration!,
                    minute: isMe ? lightOrange : caputMortuum,
                    mm: isMe ? lightOrange : oldRose,
                  ),
                ),
        ),
      ),
    ],
  );
}
