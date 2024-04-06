import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/values/colors.dart';

import '../../enums/enums.dart';
import '../../logic/app/size_provider.dart';
import '../../model/my_activity.dart';
import '../../model/player.dart';
import '../../values/names.dart';
import 'recent_player_detail_dialog.dart';

class RecentPlayerTile extends ConsumerWidget {
  final String id;
  final Player player;
  final MyActivity activity;
  const RecentPlayerTile(this.id, this.player, this.activity, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return AspectRatio(
      aspectRatio: 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const AspectRatio(
            aspectRatio: 1.5,
            child: CircleAvatar(),
          ),
          Text(
            toBeginningOfSentenceCase(player.name) ?? "",
            //NameGen.dummyName(),
            //mockString(8),
            style: textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}

/*
class RecentPlayerTile extends ConsumerStatefulWidget {
  final String id;
  final Player player;
  final MyActivity activity;
  const RecentPlayerTile(this.id, this.player, this.activity, {super.key});

  @override
  ConsumerState createState() => _RecentPlayerTileState();
}

class _RecentPlayerTileState extends ConsumerState<RecentPlayerTile> {
  @override
  Widget build(BuildContext context) {
    final ScreenSize screenSize = ref.watch(sizeProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return AspectRatio(
      aspectRatio: SizeNotifier(screenSize).isP ? 0.9 : 0.99,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              //splashColor: ghostWhite,
              //hoverColor: ghostWhite,
              //focusColor: ghostWhite,
              radius: 36.r,
              borderRadius: BorderRadius.circular(30.r),
              onTap: () => showDialog(
                context: context,
                builder: (_) => RecentPlayerDetailDialog(widget.player),
              ),
              child: CircleAvatar(radius: 30.r),
            ),
            Gap(9.r),
            Text(
              toBeginningOfSentenceCase(widget.player.name) ?? "",
              style: textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
*/
