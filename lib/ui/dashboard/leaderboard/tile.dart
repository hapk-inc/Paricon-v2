import 'dart:ui';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../logic/leaderboard/notifier.dart';
import '../../../logic/user/bloc.dart';
import '../../../model/user_record.dart';
import '../../../my_widget/my_duration.dart';
import '../../../values/colors.dart';

class LeaderBoardTile extends ConsumerWidget {
  final UserRecord record;
  final Color color;
  const LeaderBoardTile(this.record, {this.color = aquamarine, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final notifier = ref.read(leaderBoardNotifierProvider);
    //final userNotifier = ref.watch(userNotifierProvider);
    return AspectRatio(
      aspectRatio: 5.1,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        alignment: Alignment.center,
        child: record.id == null
            ? null
            : ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                leading: AnimatedFlipCounter(
                  value: notifier.rank(record.id ?? ""),
                  //value: mockInteger(1, 10),
                  suffix: ".",
                  wholeDigits: 2,
                  textStyle: textTheme.headlineLarge,
                ),
                horizontalTitleGap: 7.5.w,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(radius: 24.r, backgroundColor: color),
                    Gap(12.w),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          ref.watch(xPlayerProvider(record.id ?? ""))?.name ??
                              "No Name",
                          //NameGen.dummyName(),
                          style: textTheme.headlineLarge?.copyWith(
                            color: charcoal,
                          ),
                        ),
                        subtitle: Text(
                          "a few minutes ago",
                          style: textTheme.bodySmall?.copyWith(
                            color: frenchGray,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                trailing: MyDuration(
                  record.recordTimeTaken,
                  //Duration(milliseconds: mockInteger(10000, 99999)),
                  textColor: charcoal,
                  family: 'Montserrat',
                  size: 18,
                ),
              ),
      ),
    );
  }
}
