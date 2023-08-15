import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:im_stepper/stepper.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import '../../my_widgets/my_logo.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../logic/auth.dart';
import '../../logic/tournament_datastore.dart';
import '../../logic/tournament_notifier.dart';
import '../../model/t_score.dart';
import '../../my_widgets/elapsed_time_text.dart';
import '../../my_widgets/my_list_tile.dart';
import '../../my_widgets/my_names.dart';
import '../../my_widgets/tournament_grid.dart';
import '../../my_widgets/trophy_rank.dart';

class TournamentP9 extends StatelessWidget {
  const TournamentP9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xffFDE8E9),
        //constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            Container(
              color: const Color(0xff724cf9),
              height: 90.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      heightFactor: 1,
                      child: MyLogo(),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: RandomAvatar(mockString()),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.deepPurple.shade50,
                        BlendMode.modulate,
                      ),
                      child: Lottie.asset('assets/timer.json'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 2.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      mockInteger(100, 600).toString(),
                      style: TextStyle(
                          fontFamily: 'LilitaOne', color: Color(0xff724cf9)),
                    ),
                  ),
                  Container(
                    width: 200.w,
                    padding: EdgeInsets.only(left: 20.w),
                    child: const LinearProgressIndicator(),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Color(0xff1f2232),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(4.0),
                          child: const TrophyRank(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: TournamentGrid(),
              ),
            ),
            Container(
              height: 45.h,
              color: Colors.red,
            )
            /*SizedBox(
              height: 100.h,
              child: DotStepper(
                indicatorDecoration: IndicatorDecoration(),
                lineConnectorDecoration: LineConnectorDecoration(),
                activeStep: 1,
                dotCount: 6,
                spacing: 40.w,
                fixedDotDecoration: FixedDotDecoration(),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}

class TournamentP3 extends StatelessWidget {
  const TournamentP3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xffFFFADE),
        //constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            Container(
              height: 90.h,
              color: Colors.deepPurple,
              child: Row(
                children: [
                  const Flexible(child: MyLogo()),
                  SizedBox(width: 10.w),
                  AspectRatio(
                    aspectRatio: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: RandomAvatar(mockString()),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 60.h,
              color: Colors.deepPurple.shade700,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.deepPurple.shade50,
                        BlendMode.modulate,
                      ),
                      child: Lottie.asset('assets/timer.json'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 2.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      mockInteger(100, 600).toString(),
                      style: TextStyle(
                          fontFamily: 'LilitaOne',
                          color: Colors.amber.shade300),
                    ),
                  ),
                  Container(
                    width: 200.w,
                    padding: EdgeInsets.only(left: 20.w),
                    child: const LinearProgressIndicator(),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(4.0),
                      child: const TrophyRank(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100.h,
              color: Colors.deepPurple.shade400,
              child: const HighScoreList(),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: TournamentGrid(),
              ),
            ),
            Container(
              height: 60.h,
              color: Colors.red,
            )
            /*   Expanded(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15.w),
                    height: 420.w,
                    child: const TournamentGrid(),
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

class HighScoreList extends StatelessWidget {
  const HighScoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
          8,
          (index) => AspectRatio(
                aspectRatio: index == 1 ? 1 : 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            mockInteger(100, 300).toString(),
                            style: const TextStyle(
                                fontFamily: 'LilitaOne', fontSize: 21),
                          ),
                          AutoSizeText(
                            myRandomName(),
                            maxLines: 1,
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 9),
                            maxFontSize: 9,
                            minFontSize: 6,
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      thickness: 0.4,
                      color: Colors.white54,
                      indent: 8,
                      endIndent: 8,
                    )
                  ],
                ),
              )),
    );
  }
}

class HighScoreList4 extends StatelessWidget {
  const HighScoreList4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: Stack(
        children: [
          Positioned.fill(
            left: -270.w,
            child: RotatedBox(
              quarterTurns: -1,
              child: ListWheelScrollView(
                //diameterRatio: 0.1,
                //diameterRatio: 1,
                //overAndUnderCenterOpacity: 2,
                //offAxisFraction: -2,
                itemExtent: 90.w,
                children: [
                  Container(color: Colors.amber),
                  Container(color: Colors.red),
                  Container(color: Colors.blue),
                  Container(color: Colors.green),
                  Container(color: Colors.amber),
                  Container(color: Colors.red),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HighScoreList2 extends StatelessWidget {
  const HighScoreList2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 270.w,
          child: MyListTile(
            leading: CircleAvatar(
              child: RandomAvatar(mockString()),
            ),
            title: "${myRandomName()} is in the lead",
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              mockInteger(100, 600).toString(),
              style: TextStyle(
                  fontFamily: 'LilitaOne',
                  fontSize: 18,
                  color: Colors.deepPurple.shade100),
            ),
          ),
        )
      ],
    );
  }
}

class HighScoreList1 extends StatelessWidget {
  const HighScoreList1({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(2.0),
      children: List.generate(
        6,
        (index) {
          //final bool isChallengePlayer = index == 2;
          return AspectRatio(
            aspectRatio: 1,
            child: AnimatedContainer(
              duration: const Duration(minutes: 500),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(4.0),
              ),
              /* margin: EdgeInsets.only(
                top: isChallengePlayer ? 4 : 0,
                right: isChallengePlayer ? 4.0 : 1.0,
                bottom: isChallengePlayer ? 4 : 0,
              ),*/
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 4,
                    child: Text(
                      mockInteger(100, 222).toString(),
                      style: TextStyle(
                        fontFamily: 'LilitaOne',
                        color: Colors.deepPurple.shade400,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2.0,
                      ),
                      child: FittedBox(
                        child: AutoSizeText(
                          myRandomName(),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.deepPurple.shade300,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        // vertical: 2.0,
                      ),
                      child: FittedBox(
                        child: Text(
                          Random().nextBool() ? "Today" : "Best Record",
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            color: Colors.black87,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/*   const Space10(),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Container(
                    color: const Color(0xffFFFADE),
                    // height: 60.h,
                    width: 240.w,
                    //padding: const EdgeInsets.all(8.0),
                    child:
                        const FittedBox(fit: BoxFit.fitWidth, child: MyLogo()),
                  ),
                  const ColoredBox(color: Colors.orange, child: TrophyRank()),
                  Flexible(
                    child: FractionallySizedBox(
                      heightFactor: 0.8,
                      widthFactor: 0.8,
                      child: RandomAvatar(mockString()),
                    ),
                  )
                ],
              ),
            ),
            const Space10(),
            Container(
              height: 60.h,
              color: Colors.deepPurple,
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Container(
                    //color: Colors.blue,
                    child: Lottie.asset('assets/timer.json'),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "124",
                      style: TextStyle(fontFamily: 'LilitaOne', fontSize: 14),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  const Expanded(
                    child: LinearProgressIndicator(),
                  ),
                  SizedBox(width: 10.w),
                  const AspectRatio(
                    aspectRatio: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "124",
                        style: TextStyle(fontFamily: 'LilitaOne', fontSize: 14),
                      ),
                    ),
                  ),
                  TrophyRank(),
                  /*  Flexible(
                      child: Container(
                          //color: Colors.green,
                          )),
                  Flexible(
                      child: Container(
                          //color: Colors.red.shade50,
                          )),
                  Flexible(
                      child: Container(
                          //color: Colors.brown,
                          )),*/
                ],
              ),
            ),
            /*Container(
              height: 420.w,
              //color: Colors.green,
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: TournamentGrid(),
            ),
            if (900.h - 150.h - 400.w > 100)
              Expanded(
                child: Container(color: Colors.red.shade50),
              )*/*/

class TournamentP2 extends ConsumerWidget {
  const TournamentP2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 180.h,
              color: const Color(0xff724cf9),
              child: Stack(
                children: [
                  Positioned(
                    left: 8,
                    top: 20,
                    width: 20,
                    height: 20,
                    child: InkWell(
                      onTap: () => context.router.pop(),
                      child: const Icon(Icons.chevron_left),
                    ),
                  ),
                  Positioned(
                    right: 27,
                    top: 50,
                    child: Text(
                      "Daily Tournament",
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfffde8e9)),
                    ),
                  ),
                  const Positioned(
                    right: 12,
                    top: 8,
                    width: 200,
                    height: 40,
                    child: MyLogo(),
                  ),
                  /* Positioned(
                      right: 10,
                      top: 5,
                      width: 45,
                      height: 45,
                      child: RandomAvatar(mockString())),
                */
                  Positioned(
                    left: 10,
                    bottom: 10,
                    width: 150,
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 36,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 45,

                                //color: Colors.teal,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    mockInteger(80, 200).toString(),
                                    style: const TextStyle(
                                      fontFamily: 'BrunoAceSC',
                                      color: Color(0xffbc9ec1),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "Rank : ${mockInteger(1, 5)}",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xffe3bac6),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                              //TrophyRank(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(minHeight: 4)
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    width: 60,
                    height: 40,
                    child: Container(
                      //color: Colors.orange,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Best Record",
                            style: TextStyle(fontSize: 9),
                          ),
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                mockInteger(100, 200).toString(),
                                style: const TextStyle(fontFamily: 'LilitaOne'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TournamentGrid(),
              ),
            ),
            Container(
              height: 70.h,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}

class TournamentP1 extends ConsumerStatefulWidget {
  const TournamentP1({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _TournamentPState();
}

class _TournamentPState extends ConsumerState<TournamentP1>
    with SingleTickerProviderStateMixin {
  late DateTime _initialTime;
  Duration _elapsed = Duration.zero;
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();

    _initialTime = DateTime.now();
    _ticker = createTicker((elapsed) {
      final now = DateTime.now();
      setState(() {
        _elapsed = now.difference(_initialTime);
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    ref.invalidate(tournamentNotifierProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(
      tournamentNotifierProvider.select((value) => value.allFound),
      (previous, flag) {
        if (flag && previous != flag) {
          print("Updating Tournament Score");
          ref.read(updateTournamentScoreProvider(_elapsed));
          //ref.invalidate(tournamentNotifierProvider);
          context.router.pop();
        }
      },
    );
    // print("BalanceValue");
    // print(800.h - 420.w - 100.h);

    return Column(
      children: [
        TickerIndicator(myTick: _elapsed),
        Container(
          height: 100.h,
          color: Colors.deepPurpleAccent.shade200,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 9,
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        //color: Colors.teal,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Duration",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.deepPurple.shade200,
                              ),
                            ),
                            ElapsedTimeTextBasic(elapsed: _elapsed),
                          ],
                        ),
                      ),
                    ),
                    const Flexible(child: MyBestRecordTScore()),
                    const Flexible(
                      child: MyBestRecordTodayTScore(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 416.w,
          color: Colors.deepPurple.shade100,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(top: 4.0),
          child: const TournamentGrid(),
        ),
        if (800.h - 420.w - 100.h > 2.0) Expanded(child: TournamentFooter())
      ],
    );
  }
}

class TournamentFooter extends StatelessWidget {
  const TournamentFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent.shade200,
      padding: const EdgeInsets.all(4.0),
      alignment: Alignment.topLeft,
      child: LayoutBuilder(
        builder: (p0, p1) {
          double bottomRatio = p1.maxHeight / p1.maxWidth;
          //print("bottom Ratio $bottomRatio");
          return bottomRatio < 0.5
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: p1.maxHeight * 0.3,
                      width: p1.maxWidth * 0.7,
                      alignment: Alignment.centerLeft,

                      //color: Colors.white70,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          "Today's Tournament",
                          style: TextStyle(
                              color: Colors.deepPurple.shade100,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: p1.maxHeight * 0.2,
                      padding: EdgeInsets.all(4.0),
                      color: Colors.deepPurple,
                      child: Row(
                        children: [
                          Container(
                            width: p1.maxHeight * 0.2,
                            padding: EdgeInsets.all(p1.maxWidth * 0.01),
                            child: const FittedBox(
                              child: Text(
                                "# 1",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: p1.maxHeight * 0.2,
                            child: CircleAvatar(
                              child: RandomAvatar("aa"),
                            ),
                          ),
                          Container(
                            width: p1.maxWidth * 0.5,
                            //color: Colors.blue,
                            padding: EdgeInsets.symmetric(
                              vertical: p1.maxHeight * 0.01,
                              horizontal: p1.maxWidth * 0.025,
                            ),
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                              child: Text(
                                "Naruto Uzumaki",
                                style:
                                    TextStyle(color: Colors.deepPurple.shade50),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              //color: Colors.red,
                              padding: EdgeInsets.symmetric(
                                vertical: p1.maxHeight * 0.01,
                              ),
                              child: const Text(
                                "01: 56",
                                style: TextStyle(
                                    fontFamily: 'Orbitron',
                                    color: Colors.white70),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
        },
      ),
    );
  }
}

class TickerIndicator extends ConsumerWidget {
  final Duration myTick;
  const TickerIndicator({super.key, required this.myTick});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TScore? bestTodayScore;
    final List<TScore> todayTScores = List.from(ref.watch(todayTScoreProvider));

    todayTScores.sort((a, b) => a.tDuration!.compareTo(b.tDuration!));

    final String myId = ref.read(firebaseUserProvider).uid;

    List<TScore> uniqueTodayTScores = [];
    for (var t in todayTScores) {
      if (!uniqueTodayTScores.any((element) => element.userId == t.userId)) {
        uniqueTodayTScores.add(t);
      }
    }

    bestTodayScore = uniqueTodayTScores.firstWhere((e) => e.userId! == myId,
        orElse: () => const TScore());
    if (bestTodayScore.tDuration == null) return Container();
    double percent =
        myTick.inMilliseconds / bestTodayScore.tDuration!.inMilliseconds;
    if (percent >= 1.0) percent = 1.0;
    // print(percent);

    return LinearPercentIndicator(
      width: 360.w,
      lineHeight: 3.h,
      percent: percent,
      animationDuration: 10,
      animation: true,
      onAnimationEnd: () {
        //print("Animation Ends");
        if (percent == 1.0) {
          //ref.invalidate(tournamentNotifierProvider);
          context.router.pop();
        }
      },
      animateFromLastPercent: true,
      backgroundColor: Colors.deepPurple,
      progressColor: Colors.deepPurple.shade50,
      padding: EdgeInsets.zero,
    );
  }
}

class MyBestRecordTodayTScore extends ConsumerWidget {
  const MyBestRecordTodayTScore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TScore? bestTodayScore;
    late int? bestTodayScoreRank;
    final List<TScore> todayTScores = List.from(ref.watch(todayTScoreProvider));

    todayTScores.sort((a, b) => a.tDuration!.compareTo(b.tDuration!));

    final String myId = ref.read(firebaseUserProvider).uid;

    List<TScore> uniqueTodayTScores = [];
    for (var t in todayTScores) {
      if (!uniqueTodayTScores.any((element) => element.userId == t.userId)) {
        uniqueTodayTScores.add(t);
      }
    }

    bestTodayScore = uniqueTodayTScores.firstWhere((e) => e.userId! == myId,
        orElse: () => const TScore());
    bestTodayScoreRank = uniqueTodayTScores.indexOf(bestTodayScore) + 1;

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Today's Duration",
            style: TextStyle(
              fontSize: 9,
              color: Colors.deepPurple.shade100,
              fontWeight: FontWeight.w300,
            ),
          ),
          if (bestTodayScoreRank == 0)
            Text(
              "--",
              style: TextStyle(color: Colors.deepPurple.shade100),
            ),
          if (bestTodayScoreRank != 0)
            ElapsedTimeTextBasic(
              elapsed: bestTodayScore.tDuration!,
            ),
          SizedBox(height: 5.h),
          if (bestTodayScoreRank != 0)
            Text(
              '# $bestTodayScoreRank',
              style: TextStyle(
                fontSize: 10,
                color: Colors.deepPurple.shade50,
                fontWeight: FontWeight.bold,
                fontFamily: 'Orbitron',
              ),
            )
        ],
      ),
    );
  }
}

class MyBestRecordTScore extends ConsumerWidget {
  const MyBestRecordTScore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late TScore bestScore;
    late int bestScoreRank;
    final List<TScore> tScores = List.from(ref.watch(tScoreListProvider));

    tScores.sort((a, b) => a.tDuration!.compareTo(b.tDuration!));

    final String myId = ref.read(firebaseUserProvider).uid;

    List<TScore> uniqueTScores = [];
    for (var t in tScores) {
      if (!uniqueTScores.any((element) => element.userId == t.userId)) {
        uniqueTScores.add(t);
      }
    }

    bestScore = uniqueTScores.firstWhere((e) => e.userId! == myId,
        orElse: () => const TScore());
    bestScoreRank = uniqueTScores.indexOf(bestScore) + 1;

    return Container(
      //color: Colors.teal,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Best Record",
            style: TextStyle(
              fontSize: 9,
              color: Colors.deepPurple.shade100,
              fontWeight: FontWeight.w300,
            ),
          ),
          if (bestScoreRank == 0)
            Text(
              "--",
              style: TextStyle(color: Colors.deepPurple.shade50),
            ),
          if (bestScoreRank != 0)
            ElapsedTimeTextBasic(
              // elapsed: myTScoreList[0].tDuration!,
              elapsed: bestScore.tDuration!,
            ),
          SizedBox(height: 5.h),
          if (bestScoreRank != 0)
            Text(
              "# $bestScoreRank",
              style: TextStyle(
                fontSize: 9,
                color: Colors.deepPurple.shade50,
                fontWeight: FontWeight.bold,
                fontFamily: 'Orbitron',
              ),
            )
        ],
      ),
    );
  }
}

class _TournamentFooter extends StatelessWidget {
  const _TournamentFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent.shade700,
      child: MyListTile(
        title: '${mockInteger(1, 10)}. ${myRandomName()}',
        //title: 'YYYY',
        subtitle: 'xxxxxx',
        leading: RandomAvatar(
          "aaa",
          trBackground: true,
        ),
      ),
    );
  }
}
