import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:paricon/logic/auth/bloc.dart';
import 'package:paricon/values/colors.dart';

import '../logic/leaderboard/notifier.dart';
import '../logic/user/bloc.dart';
import '../model/user_record.dart';

class LeaderBoardTile extends ConsumerWidget {
  final UserRecord record;
  const LeaderBoardTile(this.record, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LeaderBoardNotifier leaderBoardNotifier =
        ref.watch(leaderBoardNotifierProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final User? user = ref.watch(authUserProvider).value;
    return ListTile(
      titleTextStyle: textTheme.headlineLarge,
      leading: AnimatedFlipCounter(
        value: leaderBoardNotifier.rank(record.id!),
        suffix: ".",
        wholeDigits: 2,
        textStyle: textTheme.headlineMedium,
      ),
      horizontalTitleGap: 15.w,
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ref.watch(playerProvider(record.id ?? "x")).maybeWhen(
                    orElse: () => Container(),
                    data: (data) => Text(
                      data?.name ?? "User#",
                      maxLines: 1,
                      style: textTheme.headlineMedium,
                    ),
                  ),
              if (record.id == (user?.uid ?? "")) ...<Widget>[
                Gap(7.2.r),
                Text(
                  "You",
                  style: textTheme.bodySmall?.copyWith(fontSize: 9.r),
                )
              ]
            ],
          ),
          if (leaderBoardNotifier.rank(record.id!) == 1) ...[
            Gap(7.5.r),
            SizedBox.square(
              dimension: 30.r,
              child: Lottie.asset('lottie/trophy.json'),
            ),
          ]
        ],
      ),
      dense: true,
      trailing: Container(
        width: 135.w,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AnimatedFlipCounter(
                      //prefix: "⇣ ",
                      value: record.timeTaken.inMinutes,
                      suffix: " : ",
                      wholeDigits: 2,
                      textStyle: textTheme.headlineLarge,
                    ),
                    SizedBox.square(dimension: 1.5.r),
                    AnimatedFlipCounter(
                      value: record.timeTaken.inSeconds % 60,
                      wholeDigits: 2,
                      textStyle: textTheme.headlineLarge,
                    ),
                  ],
                ),
                Gap(4.8.r),
                Text(
                  record.recordDifference,
                  style: textTheme.headlineSmall?.copyWith(
                    fontSize: 9.r,
                    color: cornellRed,
                  ),
                )
              ],
            ),
            /* SizedBox.square(dimension: 7.5.r),
            Text(record.recordDifference,
                style: textTheme.headlineSmall?.copyWith(
                  color: frenchGray,
                )),*/
            const Spacer(),
            Text(record.lastPlayedDifference, style: textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}
