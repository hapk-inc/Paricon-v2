import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../logic/recent_user.dart';
import '../model/user_activity.dart';
import 'recent_player_tile.dart';

/*final recentProvider = FutureProvider<List<MyUser>>(
  (ref) async {
    return SQLUser.recentUser;
  },
);*/

class RecentPlayer extends ConsumerStatefulWidget {
  const RecentPlayer({super.key});

  @override
  ConsumerState createState() => _RecentPlayerState();
}

class _RecentPlayerState extends ConsumerState<RecentPlayer> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 20,
      mainAxisCellCount: 5.1,
      child: FirebaseAnimatedList(
        scrollDirection: Axis.horizontal,
        query: ref.read(recentUserProvider),
        padding: EdgeInsets.only(left: 7.5.w),
        sort: (DataSnapshot a, DataSnapshot b) {
          UserActivity x = UserActivity.fromSnapshot(a);
          UserActivity y = UserActivity.fromSnapshot(b);
          return y.nowTime.compareTo(x.nowTime);
        },
        itemBuilder: (_, DataSnapshot snapshot, __, int index) {
          UserActivity userActivity = UserActivity.fromSnapshot(snapshot);

          return RecentPlayerTile(snapshot.key ?? "", userActivity);
        },
      ),
    );
  }
}
