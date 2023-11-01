import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/auth.dart';
import '../logic/user_datastore.dart';
import '../model/my_user.dart';
import '../model/p_user.dart';
import '../theme/my_color.dart';

class ShortLeaderBoard extends ConsumerWidget {
  const ShortLeaderBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User firebaseUser = ref.read(firebaseUserProvider);
    return FirestoreQueryBuilder(
      pageSize: 50,
      query: ref
          .read(recentUserCollectionReference)
          .where('bestDuration', isNull: false)
          .orderBy('bestDuration'),
      builder: (_, snapshot, __) {
        debugPrint("Has Data ${snapshot.hasData}");
        if (!snapshot.hasData) return Container();

        debugPrint("Check Tournament DataTable");
        debugPrint("Checking Snapshot Length ${snapshot.docs.length}");

        final int overallPlayers = snapshot.docs.length;
        final bool haveIPlayed =
            snapshot.docs.any((element) => element.id == firebaseUser.uid);
        debugPrint("haveIPlayed $haveIPlayed");
        int myRank = 0;
        if (haveIPlayed) {
          myRank = snapshot.docs
              .indexWhere((element) => element.id == firebaseUser.uid);
        }
        List<QueryDocumentSnapshot<PUser>> showPlayers = overallPlayers <= 4
            ? snapshot.docs
            : !haveIPlayed
                ? snapshot.docs.sublist(overallPlayers - 4, overallPlayers)
                : snapshot.docs.sublist(myRank - 3, myRank + 1);

        return LayoutBuilder(
          builder: (_, p) => ClipRRect(
            borderRadius: BorderRadius.circular(7.5.r),
            child: DataTable(
              horizontalMargin: 6.w,
              columnSpacing: 3.w,
              headingRowHeight: p.maxHeight * 0.18,
              dataRowMinHeight: p.maxHeight * 0.21,
              dataRowMaxHeight: p.maxHeight * 0.21,
              headingTextStyle: TextStyle(
                fontSize: 12.r,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                color: giantsOrange,
              ),
              dataTextStyle: TextStyle(
                fontSize: 15.r,
                color: richBlack,
                fontFamily: 'Poppins',
              ),
              columns: [
                DataColumn(
                  label: SizedBox(
                    width: p.maxWidth * 0.15,
                    child: const Text("Rank"),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: p.maxWidth * 0.39,
                    child: const Text("Name"),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: p.maxWidth * 0.36,
                    child: const Text("Duration"),
                  ),
                ),
              ],
              rows: List.of(
                showPlayers.map(
                  (e) {
                    final String userId = e.id;
                    final MyUser xUser = e.data().myUser;
                    final isTScoreMine = firebaseUser.uid == userId;
                    final playerRank = snapshot.docs.indexOf(e);
                    return DataRow(
                      color: MaterialStatePropertyAll(
                          isTScoreMine ? bitterSweet : null),
                      cells: [
                        DataCell(
                          Container(
                            width: p.maxWidth * 0.15,
                            margin: EdgeInsets.only(left: p.maxWidth * 0.03),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "$playerRank".padLeft(2, '0'),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontSize: 14.r,
                                color: isTScoreMine ? lightOrange : cardinal,
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: p.maxWidth * 0.39,
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              xUser.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 10.5.r,
                                color: isTScoreMine ? lightOrange : hookerGreen,
                                fontFamily: 'Montserrat',
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            width: p.maxWidth * 0.36,
                            child: AutoSizeText.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "${xUser.bestDuration!.inMinutes.toString().padLeft(2, '0').padLeft(2, '0')}"
                                        " : ${"${xUser.bestDuration!.inSeconds}".padLeft(2, '0')} ",
                                  ),
                                  TextSpan(
                                    text:
                                        "${xUser.bestDuration!.inMilliseconds ~/ 100}",
                                    style: TextStyle(
                                      fontSize: 10.8.r,
                                      color:
                                          isTScoreMine ? lightOrange : oldRose,
                                    ),
                                  )
                                ],
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color:
                                      isTScoreMine ? lightOrange : caputMortuum,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
