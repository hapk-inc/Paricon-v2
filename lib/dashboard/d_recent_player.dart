import 'package:animate_do/animate_do.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../logic/user_activity_provider.dart';
import '../model/user_activity.dart';
import 'd_loader.dart';
import 'recent_player_tile.dart';

class RecentPlayer extends ConsumerWidget {
  const RecentPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => StaggeredGridTile.fit(
        crossAxisCellCount: 20,
        child: Container(
          height: 108.h,
          alignment: Alignment.center,
          child: FirebaseAnimatedList(
            scrollDirection: Axis.horizontal,
            sort: (DataSnapshot a, DataSnapshot b) {
              Map<String, dynamic> a1 =
                  Map<String, dynamic>.from(a.value as Map);
              Map<String, dynamic> b1 =
                  Map<String, dynamic>.from(b.value as Map);

              final UserActivity x = UserActivity.fromJson(a1);
              final UserActivity y = UserActivity.fromJson(b1);
              return y.nowTime.compareTo(x.nowTime);
            },
            query: ref.watch(recentUserProvider),
            padding: EdgeInsets.only(left: 15.w, top: 15.h),
            defaultChild: const DLoader("Checking for Recent Players"),
            itemBuilder:
                (_, DataSnapshot snapshot, Animation<double> animation, __) {
              Map<String, dynamic> json =
                  Map<String, dynamic>.from(snapshot.value as Map);
              final UserActivity xUser = UserActivity.fromJson(json);

              return FadeInRight(
                child: RecentPlayerTile(snapshot.key ?? "", xUser),
              );
            },
          ),
        ),
      );
}
