import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../model/my_activity.dart';
import '../../model/player.dart';

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
          const AspectRatio(aspectRatio: 1.5, child: CircleAvatar()),
          Text(
            toBeginningOfSentenceCase(player.name) ?? "",
            style: textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
