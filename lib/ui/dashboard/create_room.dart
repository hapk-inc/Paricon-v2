/*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../enums/enums.dart';
import '../../logic/panel/dashboard_bloc.dart';
import '../../my_widget/my_group_button.dart';
import '../../values/colors.dart';
import '../game_room.dart';
import '../my_theme.dart';

final SlidingPanelTheme _panelTheme = SlidingPanelTheme();

class CreateRoom extends ConsumerWidget {
  const CreateRoom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 450.h,
      decoration: BoxDecoration(borderRadius: _panelTheme.slidingPanelRadius),
      child: Column(
        children: [
          Container(
            height: 450.h * 0.75,
            padding: _panelTheme.slidingPanelPadding,
            child: Column(
              children: [
                Gap(15.r),
                Row(
                  children: [
                    Text(
                      "Choose Level and Type",
                      style: textTheme.headlineLarge
                          ?.copyWith(color: caputMortuum, fontSize: 15),
                    ),
                    const Spacer(),
                    Icon(Icons.info_outline, size: 21.r, color: frenchGray)
                  ],
                ),
                Gap(30.r),
                MyGroupButton(
                  groupButtonController:
                      ref.read(boardLevelGroupControllerProvider),
                  buttons: List.from(
                    BoardLevel.values.map(
                      (e) => toBeginningOfSentenceCase(e.name),
                    ),
                  ),
                  onSelected: (_, __, ___) {},
                ),
                Gap(30.r),
                MyGroupButton(
                  groupButtonController:
                      ref.read(boardTypeGroupControllerProvider),
                  buttons: List.from(
                    BoardType.values.map(
                      (e) => toBeginningOfSentenceCase(e.name),
                    ),
                  ),
                  onSelected: (_, __, ___) {},
                ),
                Gap(30.r),
                Row(
                  children: [
                    Text(
                      "Invite friends to join",
                      style: textTheme.headlineLarge?.copyWith(color: gray),
                    ),
                    const Spacer(),
                    Icon(Icons.info_outline, size: 21.r, color: frenchGray)
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          FilledButton(
            onPressed: () {
              //ref.read(dashboardPanelProvider.notifier).state =
              //    const GameRoom();
            },
            child: const Text("Create Now"),
          )
        ],
      ),
    );
  }
}
*/
