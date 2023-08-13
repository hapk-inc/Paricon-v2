import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'cards_collection.dart';
import 'daily_dashboard_table.dart';
import 'dashboard_carousel.dart';
import 'dashboard_title_x.dart';
import 'everyone_friends.dart';
import 'no_of_players.dart';
import 'recent_players.dart';

class DashboardIpad extends StatelessWidget {
  const DashboardIpad({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(3.sp),
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        mainAxisSpacing: 6.w,
        crossAxisSpacing: 6.h,
        children: const [
          StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 2.4,
            child: NoOfPlayers(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 8,
            mainAxisCellCount: 2.4,
            child: EveryoneFriends(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 11,
            mainAxisCellCount: 4.5,
            child: DashboardCarousel(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 9,
            mainAxisCellCount: 7.5,
            child: CardsCollectionWeb(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 0.9,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: DashboardTitleX(),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 11.1,
            child: DailyDashboardTableWeb(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 0.9,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: DashboardTitleX(),
            ),
          ),
          StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 3.0,
              child: RecentPlayers())
        ],
      ),
    );
  }
}

class X extends StatelessWidget {
  const X({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
