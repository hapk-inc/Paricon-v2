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

class DashboardP extends StatelessWidget {
  const DashboardP({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 6.h),
        child: SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 20,
            crossAxisSpacing: 3.w,
            mainAxisSpacing: 12.h,
            children: const [
              StaggeredGridTile.count(
                crossAxisCellCount: 6,
                mainAxisCellCount: 3.6,
                child: NoOfPlayers(),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 14,
                mainAxisCellCount: 3.6,
                child: EveryoneFriends(),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 20,
                mainAxisCellCount: 7.2,
                child: DashboardCarousel(),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 20,
                mainAxisCellCount: 1.5,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: DashboardTitleX(),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 20,
                mainAxisCellCount: 15,
                child: DailyDashboardTable(),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 20,
                mainAxisCellCount: 9,
                child: CardsCollection(),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 20,
                mainAxisCellCount: 1.5,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: DashboardTitleX(),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 20,
                mainAxisCellCount: 4.14,
                child: RecentPlayers(),
              )
            ],
          ),
        ),
      );
}
