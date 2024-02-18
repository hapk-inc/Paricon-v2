import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/user_provider.dart';
import 'package:random_avatar/random_avatar.dart';

import 'package:toggle_switch/toggle_switch.dart';

import '../dashboard/open_challenge_table.dart';
import '../logic/tournament_database.dart';
import '../model/best_d.dart';
import '../theme/my_color.dart';

@RoutePage()
class ViewLeaderBoardPage extends ConsumerWidget {
  const ViewLeaderBoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 90.h,
        titleSpacing: 0,
        backgroundColor: ghostWhite1,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ToggleSwitch(
            totalSwitches: 2,
            //changeOnTap: false,
            labels: const ["Last Played", "All time"],
            minHeight: 72.h,
            minWidth: 150.w,
            customWidths: [165.w, 135.w],
            //onToggle: (index) =>
            //    ref.read(levelProvider.notifier).state = RoomLevel.values[index!],
            inactiveBgColor: ghostWhite1,
            inactiveFgColor: frenchGray,

            activeBgColor: const [ghostWhite1],
            activeFgColor: richBlack,
            animate: false,
            animationDuration: 150,
            dividerColor: coolGray,
            dividerMargin: 0.3.r,
            customTextStyles: [
              TextStyle(
                fontFamily: 'Poppins',
                fontSize: 27.r,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: FirestoreQueryBuilder(
          query: ref.watch(bestDQueryProvider(true)),
          builder: (_, FirestoreQueryBuilderSnapshot<BestD> snapshot, __) {
            if (snapshot.isFetching) {
              return const CircularProgressIndicator();
            }
            debugPrint("70--" + snapshot.docs.length.toString());
            return AnimatedList(
              itemBuilder: (_, index, anim) =>
                  LeaderBoardTile(snapshot.docs[index]),
              initialItemCount: snapshot.docs.length,
            );
          },
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
    final List<String> bestDList = ref.watch(bestDListProvider).value ?? [];
    final int myRank = bestDList.indexOf(bestDSnapshot.id);

    bool isMoreSize = 900.h / 360.w > 2.3;
    //final i = mockInteger(1, 10);

    return AnimatedContainer(
      height: 75.h,
      margin: EdgeInsets.only(bottom: 1.5.r),
      //color: cornellRed,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.45.r, color: frenchGray),
        ),
        color: isMe ? lightOrange : ghostWhite1,
      ),
      duration: const Duration(milliseconds: 500),
      child: ref.watch(xUserProvider(bestDSnapshot.id)).when(
            data: (xUser) => xUser == null
                ? Container()
                : ListTile(
                    leading: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      alignment: Alignment.centerLeft,
                      width: isMoreSize ? 90.w : 75.w,
                      height: 45.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedFlipCounter(
                            value: myRank + 1,
                            wholeDigits: 2,
                            duration: const Duration(milliseconds: 1200),
                            textStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 13.5.r,
                              color: frenchGray,
                              letterSpacing: 0.3.r,
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: isMoreSize ? 1 : 0.9,
                            child: CircleAvatar(
                              backgroundColor: majorelleBlue,
                              child: xUser.avatar == null
                                  ? Text(
                                      xUser.name.substring(0, 2).toUpperCase(),
                                      style: TextStyle(
                                        fontFamily: 'WendyOne',
                                        color: lightOrange,
                                        fontSize: 18.r,
                                      ),
                                    )
                                  : RandomAvatar(
                                      xUser.avatar ?? mockString(),
                                      trBackground: true,
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                    titleTextStyle: TextStyle(
                      fontSize: 15.r,
                      fontFamily: 'Montserrat',
                      height: 1.5,
                      color: richBlack,
                    ),
                    contentPadding: EdgeInsets.only(left: 15.w, right: 15.w),
                    subtitleTextStyle: TextStyle(
                      fontSize: 9.r,
                      color: gray,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                    title: Text(xUser.name, maxLines: 1),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(bestDSnapshot.data().lastPlayed)),
                    trailing: Container(
                      alignment: Alignment.centerLeft,
                      width: isMoreSize ? 120.w : 108.w,
                      height: 45.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (myRank < 3)
                            CircleAvatar(
                              radius: isMoreSize ? 9.r : 10.5.r,
                              backgroundColor: xantHous,
                              child: Icon(Icons.star, size: 12.r),
                            )
                          else
                            Spacer(),
                          ShowPlayedDuration(
                            bestDSnapshot.data().bestD,
                            true,
                            color: coolGray,
                          )
                        ],
                      ),
                    ),
                  ),
            error: (error, stackTrace) => Container(),
            loading: () => Container(),
          ),
    );
  }
}
