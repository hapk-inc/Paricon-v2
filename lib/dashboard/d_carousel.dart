import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';

import '../logic/auth_provider.dart';
import '../logic/first_user.dart';
import '../logic/tournament_listener.dart';
import '../logic/user_provider.dart';
import '../model/my_duration.dart';
import '../model/p_user.dart';
import '../my_widget/show_t_score.dart';
import '../router/my_route.dart';
import '../theme/my_color.dart';

class DCarousel extends ConsumerWidget {
  const DCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyDuration? myDuration = ref.watch(myUserDurationProvider).value;
    final QueryDocumentSnapshot<PUser>? firstUser =
        ref.watch(firstRankProvider).value;

    return Padding(
      padding: EdgeInsets.only(left: 7.5.w),
      child: CarouselSlider(
        items: [
          CarouselContainer(
            mChild: Stack(
              children: [
                Positioned(
                  bottom: -45.r,
                  right: -75.r,
                  height: 240.r,
                  width: 240.r,
                  child: Lottie.asset('lottie/trophies.json', repeat: false),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(15.r),
                    Container(
                      height: 48.r,
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(horizontal: 9.r),
                      alignment: Alignment.centerLeft,
                      child: AnimatedTextKit(
                        pause: const Duration(seconds: 9),
                        animatedTexts: ["Exciting", "Engaging", "Challenging"]
                            .map(
                              (e) => RotateAnimatedText(
                                e,
                                duration: const Duration(milliseconds: 300),
                                alignment: Alignment.centerLeft,
                                textStyle: TextStyle(
                                  fontFamily: 'DelaGothic',
                                  fontWeight: FontWeight.w900,
                                  fontSize: e.length > 8 ? 27.r : 30.r,
                                  color: [
                                    bitterSweet,
                                    cerise,
                                    amaranthPurple
                                  ][mockInteger(0, 2)],
                                ),
                                rotateOut: false,
                              ),
                            )
                            .toList(),
                        repeatForever: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 9.r, vertical: 1.5.r),
                      child: RichText(
                        text: TextSpan(
                          children: const [
                            TextSpan(text: "puzzles await you. "),
                            TextSpan(text: "Are you ready for the challenge?"),
                          ],
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: caputMortuum,
                                    fontFamily: 'Poppins',
                                    fontSize: 12.r,
                                    height: 2.1.r,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ),
                    Gap(15.r),
                    if (myDuration != null)
                      Container(
                        margin: EdgeInsets.all(9.r),
                        child: FadeIn(
                          delay: const Duration(seconds: 3),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 15.r),
                              ),
                              backgroundColor:
                                  const MaterialStatePropertyAll(bitterSweet),
                            ),
                            onPressed: () {
                              ref.refresh(tournamentListenerNotifierProvider);
                              context.router.push(const TournamentRoute());
                            },
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              child: Text(
                                myDuration.lastGamePlayed == null
                                    ? "Play Now"
                                    : "Play your first game",
                                style: TextStyle(
                                  color: ghostWhite,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.r,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                )
              ],
            ),
          ),
          CarouselContainer(
            mChild: ClipRRect(
              borderRadius: BorderRadius.circular(7.5.r),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.symmetric(vertical: 6.r),
                      child: const ShortLeaderBoard(),
                    ),
                    Positioned(
                      bottom: -45.r,
                      left: -165.r,
                      height: 240.r,
                      width: 240.r,
                      child:
                          Lottie.asset('lottie/trophies.json', repeat: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /*OpenContainer(
            closedElevation: 0.r,
            closedColor: lightOrange,
            openColor: lightOrange,
            closedBuilder: (_, void Function() action) => CarouselContainer(
              mChild: Stack(
                children: [
                  Positioned(
                    right: -36.r,
                    width: 210.r,
                    top: -18.r,
                    bottom: -18.r,
                    child: Lottie.asset(
                      'lottie/trophy.json',
                      fit: BoxFit.fitHeight,
                      repeat: false,
                    ),
                  ),
                  Positioned(
                    bottom: 15.r,
                    left: 15.r,
                    child: InkWell(
                      onTap: action,
                      child: Text(
                        "View LeaderBoard",
                        style: TextStyle(
                          fontSize: 12.r,
                          fontFamily: 'Montserrat',
                          color: caputMortuum.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                  if (firstUser != null)
                    Positioned(
                      top: 30.r,
                      left: 15.r,
                      right: 3.r,
                      child: AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "1. ${firstUser.data().name}",
                            ),
                            TextSpan(
                              text: " #${firstUser.data().id}",
                              style: TextStyle(
                                fontSize: 12.r,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                              ),
                            )
                          ],
                        ),
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: caputMortuum),
                      ),
                    ),
                ],
              ),
            ),
            openBuilder: (_, void Function({Object? returnValue}) action) =>
                const ViewLeaderBoard(),
          )*/
        ],
        options: CarouselOptions(
          padEnds: false,
          enableInfiniteScroll: false,
          viewportFraction: 0.6,
          aspectRatio: 1.5,
          enlargeCenterPage: true,
          enlargeFactor: 0.27,
        ),
      ),
    );
  }
}

class CarouselContainer extends StatelessWidget {
  final Widget mChild;
  const CarouselContainer({required this.mChild, super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(right: 7.5.w),
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: lightOrange,
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        child: mChild,
      );
}

class ShortLeaderBoard extends ConsumerWidget {
  const ShortLeaderBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? firebaseUser = ref.watch(authUserProvider).value;
    if (firebaseUser == null) return Container();

    return FirestoreQueryBuilder<PUser>(
      query: ref
          .watch(bestDurationCollReferenceProvider)
          .where('bestDuration', isNull: false)
          .orderBy('bestDuration'),
      builder: (_, FirestoreQueryBuilderSnapshot<PUser> snapshot, __) {
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
          ? overallTList.sublist(tLength - 4, tLength)
          : myRank < 4
              ? overallTList.sublist(0, 5)
              : (myRank - 3).isNegative
                  ? overallTList.sublist(0, myRank + 1)
                  : overallTList.sublist(myRank - 3, myRank + 1);
    }
    return LayoutBuilder(
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
              fontSize: 13.5.r,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              color: giantOrange),
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
              fontSize: 13.2.r,
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
                    tSize: 15,
                    sSize: 12,
                    minute: isMe ? lightOrange : caputMortuum,
                    mm: isMe ? lightOrange : oldRose,
                  ),
                  maxLines: 1,
                ),
        ),
      ),
    ],
  );
}
