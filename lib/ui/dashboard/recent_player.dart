import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:logger/logger.dart';
import 'package:paricon/values/colors.dart';

import '../../enums/enums.dart';
import '../../logic/app/size_provider.dart';
import '../../logic/user/bloc.dart';
import '../../model/my_activity.dart';
import '../../model/player.dart';
import 'recent_player_tile.dart';

Logger _logger = Logger();

class RecentPlayer extends ConsumerWidget {
  const RecentPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: AspectRatio(
        aspectRatio: 4.35,
        child: FirestoreListView.separated(
          scrollDirection: Axis.horizontal,
          query: ref.watch(recentPlayerProvider),
          padding: EdgeInsets.only(left: 15.w),
          itemBuilder: (context, doc) {
            Player player = Player.fromSnapshot(doc);
            MyActivity activity = MyActivity.fromSnapshot(doc);
            _logger.d(player);
            _logger.d(activity);
            return RecentPlayerTile(doc.id, player, activity);
          },
          separatorBuilder: (_, __) => Gap(0.15.w),
        ),
      ),
    );
  }
}

class RecentPlayer1 extends ConsumerWidget {
  const RecentPlayer1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize screenSize = ref.watch(sizeProvider);

    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: AspectRatio(
        aspectRatio: SizeNotifier(screenSize).isP ? 4.8 : 6,
        child: FirestoreListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 15.r),
          query: ref.watch(recentPlayerProvider),
          itemBuilder: (_, QueryDocumentSnapshot<Object?> doc) {
            Player player = Player.fromSnapshot(doc);
            MyActivity activity = MyActivity.fromSnapshot(doc);
            _logger.d(player);
            _logger.d(activity);
            return RecentPlayerTile(doc.id, player, activity);
          },
          separatorBuilder: (_, __) => Gap(12.r),
        ),
      ),
    );
  }
}
