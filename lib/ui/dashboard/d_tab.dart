import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'cards_collection.dart';
import 'daily_dashboard_table.dart';
import 'dashboard_carousel.dart';
import 'dashboard_title_x.dart';
import 'recent_player.dart';

class DashboardT extends StatelessWidget {
  const DashboardT({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(6.r),
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        children: [
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 1.8,
            child: DashboardTitleX("Tournament"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 900.h / 360.w > 1.61 ? 10.8 : 9.6,
            child: const DashboardCarousel(),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 1.8,
            child: DashboardTitleX("Recently Played"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 900.h / 360.w > 1.61 ? 13.2 : 12,
            child: const DailyDashboardTable(),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 1.8,
            child: DashboardTitleX("Recently Joined"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 900.h / 360.w > 1.61 ? 3.3 : 3.0,
            child: RecentPlayer(),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 0.3,
            child: SizedBox(),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 1.8,
            child: DashboardTitleX("My Card Collection"),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 5.1,
            child: CardCollection(),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 2.4,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
