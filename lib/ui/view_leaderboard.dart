import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/theme/my_theme.dart';
import 'package:random_avatar/random_avatar.dart';
import '../logic/my_names.dart';

import 'package:toggle_switch/toggle_switch.dart';

import '../logic/auth_provider.dart';
import '../logic/t_score.dart';
import '../logic/tournament_database.dart';
import '../logic/user_provider.dart';
import '../model/best_d.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

@RoutePage()
class ViewLeaderBoardPage extends ConsumerWidget {
  const ViewLeaderBoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(authUserProvider).value;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 81.h,
        titleSpacing: 0,
        backgroundColor: lavenderWeb,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ToggleSwitch(
            totalSwitches: 2,
            //changeOnTap: false,
            labels: const ["Last Played", "All time"],
            minHeight: 54.h,
            minWidth: 150.w,
            customWidths: [156.w, 120.w],
            //onToggle: (index) =>
            //    ref.read(levelProvider.notifier).state = RoomLevel.values[index!],
            inactiveBgColor: lavenderWeb,
            inactiveFgColor: frenchGray,

            activeBgColor: const [ghostWhite1],
            activeFgColor: violetBlue,
            animate: false,
            animationDuration: 150,
            dividerColor: coolGray,
            dividerMargin: 0.3.r,
            customTextStyles: [
              TextStyle(
                fontFamily: 'Poppins',
                fontSize: 21.r,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: FirestoreListView(
          query: ref.watch(bestDQueryProvider(true)),
          itemBuilder:
              (BuildContext context, QueryDocumentSnapshot<BestD> doc) {
            return LeaderBoardTile(
              doc,
              isMe: (user?.uid ?? "") == doc.id,
            );
          },
          /*   builder: (_, FirestoreQueryBuilderSnapshot<BestD> snapshot, __) {
            if (snapshot.isFetching) {
              return const CircularProgressIndicator();
            }
            debugPrint("70--${snapshot.docs.length}");
            return AnimatedList(
              itemBuilder: (_, index, anim) => LeaderBoardTile(
                snapshot.docs[index],
                isMe: (user?.uid ?? "") == snapshot.docs[index].id,
              ),
              initialItemCount: snapshot.docs.length,
            );
          },
       */
        ),
      ),
    );
  }
}

class LeaderBoardTile extends ConsumerWidget {
  final bool isMe;
  final QueryDocumentSnapshot<BestD> bestDSnapshot;
  const LeaderBoardTile(this.bestDSnapshot, {super.key, this.isMe = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BestD bestD = bestDSnapshot.data();
    final MyUser? myUser = ref.watch(xUserProvider(bestDSnapshot.id)).value;
    //final tTheme = Theme.of(context).textTheme;
    final List<String> bestDList = ref.watch(bestDListProvider).value ?? [];
    final int myRank = bestDList.indexOf(bestDSnapshot.id);
    return Container(
      //color: cornellRed,
      height: 90.h,
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.45.r, color: frenchGray),
          ),
          color: isMe
              ? violetBlue
              : myRank == 0
                  ? xantHous.withOpacity(0.75)
                  : null

          /*gradient: !isMe
            ? null
            :  LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  violetBlue,
                  violetBlue,
                ],
              ),*/
          ),
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 1.5.r),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: myUser == null
            ? null
            : LeaderBoardListTile(myUser, bestD, isMe, myRank),
      ),
    );
  }
}

class LeaderBoardListTile extends StatelessWidget {
  final MyUser myUser;
  final BestD bestD;
  final bool isMe;
  final int myRank;
  const LeaderBoardListTile(this.myUser, this.bestD, this.isMe, this.myRank,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final tTheme = Theme.of(context).textTheme;
    return ListTile(
      contentPadding: EdgeInsets.only(right: 12.w),
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      leadingAndTrailingTextStyle: tTheme.bodyMedium,
      leading: Container(
        width: 72.w,
        height: double.maxFinite,
        alignment: Alignment.center,
        //color: federalBlue,
        child: Row(
          children: [
            if (isMe)
              VerticalDivider(width: 0, thickness: 4.5.w, color: federalBlue),
            const Spacer(),
            CircleAvatar(
              radius: 30.r,
              backgroundColor: myRank == 0 ? violetBlue : lavenderWeb,
              child: myUser.avatar == null
                  ? Text(
                      myUser.name.substring(0, 2).toUpperCase(),
                      style: tTheme.bodyMedium?.copyWith(fontSize: 24.r),
                    )
                  : RandomAvatar(mockString(), trBackground: true),
            ),
          ],
        ),
      ),
      horizontalTitleGap: 24.r,
      titleTextStyle: tTheme.bodyMedium!.copyWith(
        fontFamily: 'Montserrat',
        letterSpacing: 0,
        height: 2.4.r,
        fontSize: 15.r,
        color: isMe ? ghostWhite1 : null,
      ),
      subtitleTextStyle: TextStyle(
        height: 0,
        fontFamily: 'Poppins',
        fontSize: 12.r,
        fontWeight: FontWeight.w200,
        color: isMe ? ghostWhite1 : federalBlue,
      ),
      title: Text(
        firstCaps(myUser.name),
        maxLines: 1,
        style: TextStyle(fontSize: myRank == 0 ? 18.r : 15.r),
      ),
      subtitle: Text(
        DateTime.now().difference(bestD.lastPlayed) < const Duration(days: 3)
            ? "Last seen Recently"
            : DateFormat.yMMMd().format(bestD.lastPlayed),
      ),
      trailing: Container(
        width: 135.w,
        height: 48.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 1.5.h),
        decoration: BoxDecoration(
          // color: cornellRed,
          borderRadius: BorderRadius.circular(7.5.r),
          border:
              Border.all(width: 0.75.r, color: isMe ? ghostWhite1 : frenchGray),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RichText(
              text: showTScore(
                bestD.bestD,
                minute: isMe ? lavenderWeb : violetBlue,
                mm: periwinkle,
                tSize: myRank == 0 ? 18 : 15,
                sSize: 12,
              ),
            ),
            VerticalDivider(indent: 7.5.h, endIndent: 7.5.h),
            Text(
              (myRank + 1).toString().padLeft(2, '0'),
              style: TextStyle(
                color: isMe ? ghostWhite1 : violetBlue,
                fontFamily: 'LuckiestGuy',
                fontSize: 18.r,
              ),
            )
          ],
        ),
      ),
    );
  }
}
