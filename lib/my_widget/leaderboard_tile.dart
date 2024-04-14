import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../logic/auth/bloc.dart';
import '../logic/leaderboard/notifier.dart';
import '../logic/user/bloc.dart';
import '../model/user_record.dart';
import '../values/colors.dart';

class LeaderBoardTile extends ConsumerWidget {
  final UserRecord record;
  const LeaderBoardTile(this.record, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LeaderBoardNotifier leaderBoardNotifier =
        ref.watch(leaderBoardNotifierProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final User? user = ref.watch(authUserProvider).value;

    final bool isFirst = leaderBoardNotifier.rank(record.id!) == 1;
    return GridTileBar(
      leading: AnimatedFlipCounter(
        value: leaderBoardNotifier.rank(record.id!),
        suffix: ".",
        wholeDigits: 2,
        textStyle: textTheme.headlineMedium?.copyWith(
          color: isFirst ? ghostWhite : null,
        ),
      ),
      //horizontalTitleGap: 15.w,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(7.5.r),
          ref.watch(playerProvider(record.id ?? "x")).maybeWhen(
                orElse: () => Container(),
                data: (data) => Text(
                  data?.name ?? "User#",
                  maxLines: 1,
                  style: textTheme.headlineMedium?.copyWith(
                    color: isFirst ? ghostWhite : null,
                  ),
                ),
              ),
          if (record.id == (user?.uid ?? "")) ...<Widget>[
            Gap(7.5.r),
            Text(
              "- You",
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12.r,
                color: isFirst ? ghostWhite : hookerGreen,
              ),
            )
          ],
          if (leaderBoardNotifier.rank(record.id!) == 1) ...[
            Gap(7.5.r),
            SizedBox.square(
              dimension: 24.r,
              child: Lottie.asset('lottie/trophy.json'),
            ),
          ]
        ],
      ),
      //  dense: true,
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
                      suffix: " :",
                      wholeDigits: 2,
                      textStyle: textTheme.headlineLarge?.copyWith(
                        color: isFirst ? ghostWhite : null,
                      ),
                    ),
                    SizedBox.square(dimension: 4.5.r),
                    AnimatedFlipCounter(
                      value: record.timeTaken.inSeconds % 60,
                      wholeDigits: 2,
                      textStyle: textTheme.headlineLarge?.copyWith(
                        color: isFirst ? ghostWhite : null,
                      ),
                    ),
                    SizedBox.square(dimension: 4.5.r),
                    AnimatedFlipCounter(
                      value: record.timeTaken.inMilliseconds % 1000,
                      wholeDigits: 3,
                      mainAxisAlignment: MainAxisAlignment.end,
                      //padding: EdgeInsets.only(top: 1.5.r),
                      textStyle: textTheme.headlineSmall?.copyWith(
                        color: isFirst ? ghostWhite : frenchGray,
                        fontSize: 9.r,
                      ),
                    ),
                  ],
                ),
                if (record.recordDifference != "") ...[
                  Gap(7.5.r),
                  Text(
                    record.recordDifference,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 9.r,
                      height: 0,
                      color: isFirst ? ghostWhite : cornellRed,
                    ),
                  )
                ]
              ],
            ),
            const Spacer(),
            Text(
              record.lastPlayedDifference,
              style: textTheme.headlineSmall?.copyWith(
                color: isFirst ? ghostWhite : frenchGray,
              ),
            )
          ],
        ),
      ),
    );
  }
}
