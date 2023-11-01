import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../logic/auth.dart';
import '../../my_widget/my_logo.dart';
import 'd_card_collection.dart';
import 'd_carousel.dart';
import 'd_recent_player.dart';
import 'd_show_today_avatar.dart';
import 'd_welcome.dart';

class DashboardBodyState extends ConsumerWidget {
  const DashboardBodyState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        mainAxisSpacing: 1.r,
        crossAxisSpacing: 1.r,
        children: [
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 8.4,
            child: DWelcome(),
          ),
          buildStaggeredSpace,
          //   buildStaggeredSpace,
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 6.r,
            child: const RecentPlayer(),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 15,
            child: DashCarousel(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 21.r,
            child: const DCardCollection(),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 11.4,
            child: ShowTodayAvatar(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 9.r,
            child: Container(
              padding: EdgeInsets.all(7.5.r),
              alignment: Alignment.center,
              child: Opacity(
                opacity: 0.9,
                child: InkWell(
                  onTap: () => ref.read(signOutProvider),
                  child: const MyLogo(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  StaggeredGridTile get buildStaggeredSpace {
    return const StaggeredGridTile.count(
      crossAxisCellCount: 20,
      mainAxisCellCount: 0.15,
      child: SizedBox(),
    );
  }
}
