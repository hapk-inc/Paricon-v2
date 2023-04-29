import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';

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

class TournamentP extends ConsumerStatefulWidget {
  const TournamentP({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _TournamentPState();
}

class _TournamentPState extends ConsumerState<TournamentP>
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

    return Column(
      children: [
        TickerIndicator(myTick: _elapsed),
        Flexible(
          flex: 3,
          child: Container(
            height: 120.h,
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
        ),
        Flexible(
          flex: 17,
          child: Container(
            color: Colors.deepPurple.shade100,
            padding: const EdgeInsets.all(8.0),
            child: const TournamentGrid(),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(color: Colors.deepPurpleAccent.shade200),
          //child: _TournamentFooter(),
        )
      ],
    );
  }
}

class TickerIndicator extends ConsumerWidget {
  final Duration myTick;
  const TickerIndicator({super.key, required this.myTick});

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
          if (bestTodayScoreRank != 0)
            Text(
              'Rank: $bestTodayScoreRank',
              style: const TextStyle(fontSize: 9, color: Colors.white60),
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
          if (bestScoreRank != 0)
            Text(
              "Rank: $bestScoreRank",
              style: const TextStyle(fontSize: 9, color: Colors.white60),
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
