import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';

import '../logic/auth.dart';
import '../logic/tournament_datastore.dart';
import '../logic/user_datastore.dart';
import '../model/t_score.dart';
import 'daily_challenge_score_tile.dart';
import 'my_list_tile.dart';

class TodayLeaderBoardListView extends ConsumerWidget {
  const TodayLeaderBoardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final List<TScore> todayScores = ref.watch(todayTScoreProvider);
    final String myId = ref.read(firebaseUserProvider).uid;
    //final List<TScore> yesterdayScores = ref.read(yesterdayScoreProvider);
    final List<TScore> todayUniqueTScores =
        ref.watch(todayUniqueTScoreProvider);
    final List<TScore> dateSortList = List.from(todayUniqueTScores);
    print(dateSortList.length);
    dateSortList.sort((a, b) => b.playedAt!.compareTo(a.playedAt!));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            alignment: Alignment.centerLeft,
            height: 80.h * dateSortList.length,
            width: 450,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              children: dateSortList
                  .map(
                    (e) => ref.watch(xUserProvider(e.userId!)).when(
                          data: (data) {
                            return FadeInRight(
                              delay: Duration(
                                  milliseconds: mockInteger(500, 1000)),
                              child: SizedBox(
                                height: 80.h,
                                child: DailyChallengeScoreTile(
                                  timeStamp: DateFormat.jm()
                                      .format(e.playedAt ?? DateTime.now()),
                                  avatarString: data.avatar,
                                  subtitle: mockString(),
                                  name: myId == e.userId! ? "You" : data.name,
                                  duration: e.tDuration!,
                                ),
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
        const Space20(),
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
