import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';
import '../../../logic/user/notifier.dart';
import '../../../model/player.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../theme/my_theme.dart';
import '../../../values/colors.dart';
import 'recent_player_detail_dialog.dart';

class RecentPlayerTile extends ConsumerWidget {
  //final String id;
  final Player player;
  //final MyActivity activity;
  const RecentPlayerTile(this.player, {super.key});
  //const RecentPlayerTile(this.id, this.player, {super.key});
  //const RecentPlayerTile(this.id, this.player, this.activity, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return AspectRatio(
      aspectRatio: 0.9,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => RecentPlayerDetailDialog(player),
                ),
                child: DottedBorder(
                  borderType: BorderType.Circle,
                  dashPattern: const [6, 3, 7.5, 3],
                  color: player.todayPlayer ? emerald : frenchGray,
                  strokeWidth: player.todayPlayer ? 1.5 : 0.9,
                  child: CircleAvatar(
                    radius: ref.watch(sizeProvider) == ScreenSize.m ||
                            ref.watch(sizeProvider) == ScreenSize.s
                        ? 24.r
                        : 30.r,
                    child: player.avatar != null
                        ? RandomAvatar(player.avatar ?? mockString(1))
                        : Container(),
                  ),
                ),
              ),
              Gap(15.r),
              Text(
                toBeginningOfSentenceCase(player.name) ?? "",
                style: textTheme.headlineMedium?.copyWith(
                  color: sepia,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
