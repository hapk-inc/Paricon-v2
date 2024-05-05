import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';

import '../../../logic/leaderboard/notifier.dart';
import '../../../logic/user/bloc.dart';
import '../../../logic/user/notifier.dart';
import '../../../model/player.dart';
import '../../../model/user_record.dart';
import '../../../my_widget/my_duration.dart';
import '../../../values/colors.dart';
import '../../../values/names.dart';
import 'tile.dart';

class LeaderBoard extends ConsumerStatefulWidget {
  const LeaderBoard({super.key});

  @override
  ConsumerState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends ConsumerState<LeaderBoard> {
  late List<Color> listColor;
  late LeaderBoardNotifier leaderBoardNotifier;

  @override
  void initState() {
    listColor = List.from(iconColor)..shuffle();
    // leaderBoardNotifier = ref.refresh(leaderBoardNotifierProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    leaderBoardNotifier = ref.watch(leaderBoardNotifierProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 36.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          alignment: Alignment.centerLeft,
          child: Text(
            "Overall . . .",
            style: textTheme.titleSmall?.copyWith(color: jasper),
          ),
        ),
        /*AspectRatio(
          aspectRatio: 9,
          child: Container(
            color: xantHous,
            alignment: Alignment.center,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
              title: Text("Overall . . .", style: textTheme.titleSmall),
            ),
          ),
        ),*/
        Gap(15.r),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 7.5.w),
            itemBuilder: (_, index) {
              final userRecord = leaderBoardNotifier.list.elementAt(index);
              return LeaderBoardTile(
                userRecord,
                color: listColor[index % 4],
              );
            },
            separatorBuilder: (_, __) => Gap(7.5.r),
            itemCount: leaderBoardNotifier.list.length,
          ),
        ),
        SizedBox(
            height: (Theme.of(context).appBarTheme.toolbarHeight ?? 120) * 0.3)
      ],
    );
  }
}
