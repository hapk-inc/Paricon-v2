import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/auth.dart';
import '../logic/user_datastore.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

class ShortLeaderBoard extends ConsumerWidget {
  const ShortLeaderBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User firebaseUser = ref.read(firebaseUserProvider);
    final MyUser myUser = ref.read(myUserProvider).value!;
    return FirestoreQueryBuilder(
      query: ref
          .read(recentUserCollectionReference)
          .where('bestDuration', isNull: false)
          .orderBy('bestDuration')
          .limit(4),
      builder: (_, snapshot, __) {
        debugPrint("Check Tournament DataTable");
        debugPrint("Checking Snapshot Length ${snapshot.docs.length}");
        return LayoutBuilder(
          builder: (_, p) => DataTable(
            horizontalMargin: 0,
            columnSpacing: 3.w,
            headingRowHeight: p.maxHeight * 0.15,
            dataRowMinHeight: p.maxHeight * 0.21,
            dataRowMaxHeight: p.maxHeight * 0.21,
            // headingRowColor:
            //     const MaterialStatePropertyAll(Colors.green),
            headingTextStyle: TextStyle(
              fontSize: 12.r,
              fontFamily: 'DelaGothic',
              color: spaceCadet,
            ),
            dataTextStyle: TextStyle(
              fontSize: 15.r,
              color: richBlack,
              fontFamily: 'Poppins',
            ),
            columns: [
              DataColumn(
                label: SizedBox(
                  // color: deepSkyBlue,
                  width: p.maxWidth * 0.18,
                  child: const Text("Rank"),
                ),
              ),
              DataColumn(
                label: SizedBox(
                  width: p.maxWidth * 0.45,
                  //color: deepSkyBlue,
                  child: const Text("Name"),
                ),
              ),
              DataColumn(
                label: SizedBox(
                  width: p.maxWidth * 0.36,
                  //color: deepSkyBlue,
                  child: const Text("Duration"),
                ),
              ),
            ],
            rows: [
              ...List.generate(
                snapshot.docs.length < 5 ? snapshot.docs.length : 4,
                (index) {
                  final String userId = snapshot.docs[index].id;
                  final MyUser xUser = snapshot.docs[index].data();
                  return DataRow(
                    color: MaterialStatePropertyAll(
                        firebaseUser.uid == userId ? columbiaBlue : null),
                    cells: [
                      DataCell(
                        Container(
                          width: p.maxWidth * 0.18,
                          margin: EdgeInsets.only(left: p.maxWidth * 0.03),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${"${index + 1}".padLeft(2, '0')}.",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.r,
                              color: cardinal,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: p.maxWidth * 0.45,
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            xUser.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 10.5.r,
                                color: hookerGreen,
                                fontFamily: 'Montserrat'),
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
                                      " : ${"${xUser.bestDuration!.inSeconds}".padLeft(2, '0')}",
                                  style: const TextStyle(color: caputMortuum),
                                ),
                                TextSpan(
                                  text:
                                      " ${xUser.bestDuration!.inMilliseconds ~/ 100}",
                                  style: TextStyle(
                                    fontSize: 10.8.r,
                                    color: oldRose,
                                  ),
                                )
                              ],
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                color: darkPurple,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
