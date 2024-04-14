import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:logger/logger.dart';

import '../../logic/user/bloc.dart';
import '../../model/my_activity.dart';
import '../../model/player.dart';
import 'recent_player/recent_player_tile.dart';

Logger _logger = Logger();

class RecentPlayer extends ConsumerWidget {
  const RecentPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: AspectRatio(
        aspectRatio: 4.5,
        child: FirestoreListView.separated(
          scrollDirection: Axis.horizontal,
          query: ref.watch(recentPlayerProvider),
          padding: EdgeInsets.only(left: 15.w),
          itemBuilder: (_, doc) {
            Player player = Player.fromSnapshot(doc);
            MyActivity activity = MyActivity.fromSnapshot(doc);
            _logger.d(player);
            _logger.d(activity);
            return RecentPlayerTile(doc.id, player, activity);
          },
          separatorBuilder: (_, __) => const SizedBox(width: 0.3),
        ),
      ),
    );
  }
}
