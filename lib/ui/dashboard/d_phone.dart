import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'cards_collection.dart';
import 'daily_dashboard_table.dart';
import 'dashboard_carousel.dart';
import 'dashboard_title_x.dart';
import 'recent_player.dart';

class DashboardP extends StatelessWidget {
  const DashboardP({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.all(6.r),
        child: StaggeredGrid.count(
          crossAxisCount: 20,
          children: const [
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 2.4,
              child: DashboardTitleX("Tournament"),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 18,
              child: DashboardCarousel(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 2.4,
              child: DashboardTitleX("Recently Played"),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 16.5,
              child: DailyDashboardTable(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 2.4,
              child: DashboardTitleX("Recently Joined"),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 4.2,
              child: RecentPlayer(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 3,
              child: DashboardTitleX("My Card Collection"),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 6,
              child: CardCollection(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 3,
              child: SizedBox(),
            ),
          ],
        ),
      );
}
