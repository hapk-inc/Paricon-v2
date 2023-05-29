import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/auth.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../my_widgets/daily_challenge_score_tile.dart';
import '../../my_widgets/my_list_tile.dart';
import '../../my_widgets/my_names.dart';
import '../../routes/my_route.dart';

class DashboardP extends ConsumerWidget {
  const DashboardP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SlidingUpPanel(
      body: Column(
        children: [
          SizedBox(
            height: 800.h,
            child: const _DashboardBody(),
          ),
        ],
      ),
      panel: Container(),
      minHeight: 0,
    );
  }
}

class _DashboardBody extends ConsumerWidget {
  const _DashboardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User firebaseUser = ref.read(firebaseUserProvider);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const Space10(),
          Container(
            height: 60.h,
            alignment: Alignment.centerLeft,
            child: FadeInRight(child: const DashboardTab()),
          ),
          const Space10(),
          const Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                _DailyTournament(),
                //_Statistics(),
                _MyBio(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) => ButtonsTabBar(
        radius: 6.w,
        backgroundColor: const Color(0xff1f2232),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16.h,
          color: const Color(0xfffde8e9),
        ),
        unselectedBackgroundColor: const Color(0xffe3bac6),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16.h,
          color: const Color(0xffbc9ec1),
        ),
        tabs: const [
          Tab(text: "Daily Tournament"),
          //Tab(text: "Statistics"),
          Tab(text: "You"),
        ],
      );
}

class _DailyTournament extends ConsumerWidget {
  const _DailyTournament({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Space10(),
        SizedBox(
          //color: Colors.red,
          height: 180.h,
          width: 360.w,
          child: CarouselSlider(
            items: [
              FadeInRight(child: const _OverallGames()),
            ],
            options: CarouselOptions(
              scrollPhysics: const NeverScrollableScrollPhysics(),
              viewportFraction: 0.95,
              disableCenter: true,
              enlargeCenterPage: true,
            ),
          ),
        ),
        Expanded(
          child: Random().nextBool()
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mockInteger(0, 1) == 0
                            ? "Kickstart the tournament by being the pioneer and "
                                "securing a straightforward win."
                            : "Seize the opportunity to claim a simple victory in today's tournament",
                        style: TextStyle(
                            fontFamily: 'LilitaOne',
                            color: const Color(0xff307473),
                            height: 2.5.h
                            //fontWeight: FontWeight.bold,
                            ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox.square(
                            dimension: 200.w,
                            child: FittedBox(
                                child: Lottie.asset('assets/joystick.json')),
                          ),
                        ),
                      )
                      /*Lottie.asset(
                        'assets/joystick.json',
                        width: 200.w,
                        height: 200.w,
                      ),*/
                    ],
                  ),
                )
              : Container(
                  //color: Colors.red,
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    children: [
                      const Space10(),
                      const _TitleX(a: "Recently Played"),
                      SizedBox(
                          height: 120.h, child: const _AvailablePlayerList()),
                      const _TodayPlayerList(),
                    ],
                  ),
                ),
        )
      ],
    );
  }
}

/* Flexible(
                        flex: 3,
                        child: AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Be the ",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextSpan(
                                text: "first",
                                style: TextStyle(
                                  fontSize: 32,
                                  //color: Color(0xff724cf9),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                  text: " to play",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: "and ",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: "Enjoy ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "an ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: "easy",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  // color: Color(0xff724cf9),
                                ),
                              ),
                              TextSpan(
                                text: "victory in today's tournament",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                              color: Color(0xffbc9ec1),
                            ),
                          ),
                          //style: TextStyle(height: 1),
                        ),
                      ),
                      Flexible(
                          child: Container(
                        color: Colors.red,
                      ))*/

class _TodayPlayerList extends StatelessWidget {
  const _TodayPlayerList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: ListView(
        padding: const EdgeInsets.only(right: 4.0),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ...List.generate(
            mockInteger(1, 3),
            <Widget>(index) => FadeInRight(
              delay: Duration(milliseconds: (200 * (index + 1)).toInt()),
              child: SizedBox(
                height: 75.h,
                child: const DailyChallengeScoreTile(),
              ),
            ),
          ),
          ...[
            FadeInRight(
              delay: Duration(milliseconds: 800),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffe3b8c6),
                  borderRadius: BorderRadius.circular(4.w),
                ),
                height: 75.h,
                child: const DailyChallengeScoreTile(),
              ),
            )
          ]
        ],
      ),
    );
  }
}

class _AvailablePlayerList extends StatelessWidget {
  const _AvailablePlayerList();

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      children: List.generate(
          5,
          (index) => AspectRatio(
                aspectRatio: 0.95,
                child: Container(
                  //color: Colors.green.shade100,
                  //margin: const EdgeInsets.only(right: 2.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 5,
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          heightFactor: 1,
                          child: CircleAvatar(
                            backgroundColor: const Color(0xff724cf9),
                            child: RandomAvatar(
                              mockString(),
                              width: 72.h,
                              trBackground: true,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Flexible(
                        flex: 2,
                        child: FractionallySizedBox(
                          widthFactor: 0.9,
                          heightFactor: 0.6,
                          child: FittedBox(
                            child: Text(myRandomName()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}

class _TitleX extends StatelessWidget {
  final String a;
  const _TitleX({required this.a});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: AutoSizeText(
          a,
          style: const TextStyle(
              color: Color(0xff3b1f2b), fontFamily: 'LilitaOne'),
        ),
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.router.push(const TournamentRoute());
      },
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color(0xff0d1821)),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FittedBox(
          child: Text(
            "Play Tournament",
            style: TextStyle(fontFamily: 'LilitaOne', color: Color(0xfffde8e9)),
          ),
        ),
      ),
    );
  }
}

class _OverallGames extends StatelessWidget {
  const _OverallGames();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffe54f6d),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: LayoutBuilder(
        builder: (_, p1) => Stack(
          children: [
            Positioned(
              width: p1.maxWidth * 0.9,
              top: p1.maxHeight * 0.15,
              left: p1.maxWidth * 0.05,
              height: p1.maxHeight * 0.4,
              child: AutoSizeText.rich(
                _randomTournamentText(mockInteger(20, 100)),
              ),
            ),
            Positioned(
              height: p1.maxHeight * 0.25,
              bottom: p1.maxHeight * 0.1,
              right: p1.maxWidth * 0.05,
              width: 150,
              child: const _PlayButton(),
            )
          ],
        ),
      ),
    );
  }
}

TextSpan _randomTournamentText(int value) {
  final int a = mockInteger(0, 2);
  //const int a = 0;
  switch (a) {
    case 0:
      return TextSpan(
        children: [
          TextSpan(text: value.toString()),
          TextSpan(
            text: "\ngames played so far",
            style: TextStyle(fontSize: 24.sp),
          ),
        ],
        style: TextStyle(
          fontSize: 32.sp,
          color: const Color(0xfffde8e9),
          fontFamily: 'LilitaOne',
        ),
      );
    case 1:
      return TextSpan(
        children: [
          const TextSpan(text: "Users have logged\n"),
          TextSpan(
            text: "\n$value",
            style: const TextStyle(fontSize: 24),
          ),
          const TextSpan(text: " games played until now"),
        ],
        style: const TextStyle(
          fontSize: 12,
          height: 0.7,
          color: Color(0xfffde8e9),
          fontFamily: 'LilitaOne',
        ),
      );
    case 2:
      return TextSpan(
        children: [
          const TextSpan(text: "As of now,"),
          TextSpan(
            text: " $value",
            style: const TextStyle(fontSize: 32),
          ),
          const TextSpan(
              text: " games have been\ncompleted in the tournament."),
        ],
        style: const TextStyle(
          fontSize: 16,
          height: 1.2,
          // height: 0.7,
          color: Color(0xfffde8e9),
          fontFamily: 'LilitaOne',
        ),
      );
    default:
      return const TextSpan(
        children: [
          TextSpan(text: "No Text"),
        ],
      );
  }
}

class _Statistics extends ConsumerWidget {
  const _Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Space10(),
        const _TitleX(a: "Yesterday Winners"),
        Container(
          height: 150.h,
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) => Flexible(
                child: Container(
                  color: Colors.white70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.h,
                        color: Colors.blue,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            mockInteger(100, 200).toString(),
                            style: const TextStyle(fontFamily: 'LilitaOne'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _MyBio extends ConsumerWidget {
  const _MyBio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => ref.read(signOutProvider),
      child: Text("Log out"),
    );
  }
}
