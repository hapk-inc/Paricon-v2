import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/auth.dart';
import '../logic/tournament_datastore.dart';
import '../logic/user_datastore.dart';
import '../model/t_score.dart';

class TodayLeaderBoardListView extends ConsumerWidget {
  const TodayLeaderBoardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TScore> todayUniqueTScores =
        ref.watch(todayUniqueTScoreProvider);
    print("todayUniqueTScores ${todayUniqueTScores.length}");
    return ListView(
      padding: const EdgeInsets.all(4),
      children: todayUniqueTScores
          .map(
            (e) => Card(
              elevation: 1,
              margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              color: Colors.deepPurple.shade100,
              /* color: Colors
                  .primaries[mockInteger(0, Colors.primaries.length - 1)]
                  .shade50
                  .withOpacity(0.7),*/
              child: Container(
                height: 900.h * 0.1,
                alignment: Alignment.center,
                //width: 90,
                decoration: const BoxDecoration(
                  //color: Colors.red,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white70,
                      width: 0.5,
                    ),
                  ),
                ),

                child: ref.watch(xUserProvider(e.userId!)).when(
                      data: (data) => Row(
                        children: [
                          Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Container(
                              //color: Colors.teal,
                              padding: const EdgeInsets.all(4),
                              child: RandomAvatar(
                                data.avatar,
                                height: 45,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: FittedBox(
                              alignment: Alignment.centerRight,
                              child: AutoSizeText.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: e.tDuration!.inMinutes
                                          .toString()
                                          .padLeft(2, '0'),
                                      style: const TextStyle(
                                          color: Colors.deepPurple),
                                    ),
                                    TextSpan(
                                      text:
                                          ": ${"${e.tDuration!.inSeconds % 60}".padLeft(2, '0')}",
                                      style: TextStyle(
                                          color: Colors.deepPurple.shade700,
                                          fontWeight: FontWeight.bold
                                          //fontSize: 2.sp,
                                          ),
                                    ),
                                  ],
                                ),
                                style: const TextStyle(fontFamily: 'Orbitron'),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: FractionallySizedBox(
                                    widthFactor: 1,
                                    heightFactor: 0.5,
                                    child: FittedBox(
                                      alignment: Alignment.centerRight,
                                      child: AutoSizeText(
                                        DateFormat.jm().format(e.playedAt!),
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                          fontFamily: 'BrunoAceSC',
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        //maxFontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: FractionallySizedBox(
                                    widthFactor: 0.9,
                                    heightFactor: 0.475,
                                    child: FittedBox(
                                      alignment: Alignment.centerRight,
                                      child: AutoSizeText(
                                        data.name,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      error: (error, stackTrace) {
                        print(error);
                        return Text("Error");
                      },
                      loading: () => Container(),
                    ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class TodayLeaderBoardListView1 extends ConsumerWidget {
  const TodayLeaderBoardListView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final List<TScore> todayScores = ref.watch(todayTScoreProvider);
    final String myId = ref.read(firebaseUserProvider).uid;
    //final List<TScore> yesterdayScores = ref.read(yesterdayScoreProvider);
    final List<TScore> todayUniqueTScores =
        ref.watch(todayUniqueTScoreProvider);
    final List<TScore> dateSortList = List.from(todayUniqueTScores);
    print("26-->${dateSortList.length}");
    dateSortList.sort((a, b) => b.playedAt!.compareTo(a.playedAt!));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 80.h * dateSortList.length,
            width: 450,
            child: ListView(
              // physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 18.w, right: 18.w),
              children: dateSortList
                  //.take(3)
                  .map(
                    (e) => ref.watch(xUserProvider(e.userId!)).when(
                          data: (data) {
                            return FadeInRight(
                              delay: Duration(
                                  milliseconds: mockInteger(500, 1000)),
                              child: SizedBox(
                                height: 80.h,
                                /*DailyChallengeScoreTile(
                                  timeStamp: DateFormat.jm()
                                      .format(e.playedAt ?? DateTime.now()),
                                  avatarString: data.avatar,
                                  subtitle: mockString(),
                                  name: myId == e.userId! ? "You" : data.name,
                                  duration: e.tDuration!,
                                )*/
                              ),
                            );
                          },
                          error: (error, stackTrace) {
                            return Container();
                          },
                          loading: () => Container(),
                        ),
                  )
                  .toList(),
            ),
          ),
        ),

/*        DashboardSubHeader(),
        SizedBox(
          height: 75.h * yesterdayScores.length,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            children: yesterdayScores
                .map(
                  (e) => ref.watch(xUserProvider(e.userId!)).when(
                        data: (data) => SizedBox(
                          height: 75.h,
                          child: FadeInRight(
                            delay:
                                Duration(milliseconds: mockInteger(500, 1000)),
                            child: DailyChallengeScoreTile(
                                timeStamp: DateFormat.jm()
                                    .format(e.playedAt ?? DateTime.now()),
                                avatarString: data.avatar,
                                name: data.name,
                                duration: e.tDuration!),
                          ),
                        ),
                        error: (error, stackTrace) {
                          return Container();
                        },
                        loading: () => Container(),
                      ),
                )
                .toList(),
          ),
        ),*/
      ],
    );
  }
}
