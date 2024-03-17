import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/auth_provider.dart';
import '../logic/t_score.dart';
import '../logic/tournament_database.dart';
import '../logic/user_provider.dart';
import '../model/best_d.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

@RoutePage()
class ViewLeaderBoardPage extends ConsumerStatefulWidget {
  const ViewLeaderBoardPage({super.key});

  @override
  ConsumerState createState() => _ViewLeaderBoardPageState();
}

class _ViewLeaderBoardPageState extends ConsumerState<ViewLeaderBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ghostWhite,
      appBar: _appBar,
      body: FirestoreListView(
        query: ref.watch(bestDQueryProvider(true)),
        itemBuilder: (_, doc) => LTile(doc),
      ),
    );
  }
}

class LTile extends ConsumerWidget {
  //final int index;
  final QueryDocumentSnapshot<BestD> doc;
  const LTile(this.doc, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BestD bestD = doc.data();
    final MyUser? myUser = ref.watch(xUserProvider(doc.id)).value;
    final List<String> bestDList = ref.watch(bestDListProvider).value ?? [];
    final User? user = ref.watch(authUserProvider).value;

    final bool isMe = (user?.uid ?? "") == doc.id;
    final int index = bestDList.indexOf(doc.id);

    return Container(
      height: 75.h,
      color: isMe ? lavenderWeb : null,
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      // margin: EdgeInsets.only(bottom: 3.r),
      child: GridTileBar(
        leading: SizedBox(
          width: 75.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${index + 1}.".padLeft(3, '0'),
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 15.r),
              ),
              CircleAvatar(
                radius: 24.r,
                //backgroundColor: violetBlue,
                child: myUser?.avatar == null
                    ? Text(
                        (myUser?.name.substring(0, 2) ?? "XX").toUpperCase(),
                        style:
                            TextStyle(fontFamily: 'WendyOne', fontSize: 18.r),
                      )
                    : RandomAvatar(
                        myUser?.avatar ?? mockString(1),
                        // trBackground: true,
                      ),
              )
            ],
          ),
        ),
        trailing: SizedBox(
          width: 90.w,
          child: AutoSizeText.rich(
            TextSpan(
              children: [
                showTScore(
                  bestD.bestD,
                  minute: federalBlue,
                  mm: gray,
                  tSize: 18,
                  sSize: 12,
                )
              ],
            ),
            textAlign: TextAlign.end,
          ),
        ),
        title: AutoSizeText.rich(
          TextSpan(
            text: firstCaps(myUser?.name ?? ""),
            children: [
              TextSpan(
                text: " #${myUser?.id ?? 000}",
                style: TextStyle(
                    fontSize: 9.6.r, color: gray, fontWeight: FontWeight.w300),
              )
            ],
            style: TextStyle(
                color: federalBlue,
                fontFamily: 'Montserrat',
                // fontWeight: FontWeight.w600,
                fontSize: 15.r,
                height: 2.1.r),
          ),
          maxLines: 1,
          maxFontSize: 13.5,
          stepGranularity: 1.5,
          minFontSize: 9,
        ),
        /*  subtitle: Container(
          height: 24.h,
          alignment: Alignment.centerLeft,
          child: bestD.tCount == 2
              ? Text(
                  "FIRST TIME",
                  style: TextStyle(
                    color: emerald,
                    fontSize: 9.6.r,
                    fontFamily: 'Montserrat',
                  ),
                )
              : null,
        ),*/
      ),
    );
  }
}

AppBar get _appBar => AppBar(
      toolbarHeight: 75.h,
      leadingWidth: 45.w,
      elevation: 7.5.r,
      title: const Text("All-time Scoreboard", maxLines: 1),
    );
