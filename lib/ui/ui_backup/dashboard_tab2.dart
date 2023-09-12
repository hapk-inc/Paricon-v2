import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../dashboard/cards_collection.dart';
import '../dashboard/daily_dashboard_table.dart';
import '../dashboard/dashboard_carousel.dart';
import '../dashboard/dashboard_title_x.dart';
import '../dashboard/everyone_friends.dart';
import '../dashboard/no_of_players.dart';
import '../dashboard/recent_player.dart';

class DashboardT extends StatelessWidget {
  const DashboardT({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: Container(color: Colors.pink)),
        Expanded(
          flex: 7,
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(3.sp),
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
                    mainAxisCellCount: 7.5,
                    child: DashboardCarousel1(),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 20,
                    mainAxisCellCount: 1.35,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: DashboardTitleX("adsvadv"),
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 20,
                    mainAxisCellCount: 13.5,
                    child: DailyDashboardTable(),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 20,
                    mainAxisCellCount: 8.4,
                    child: CardsCollection1(),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 20,
                    mainAxisCellCount: 1.35,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: DashboardTitleX("adfaergaerf"),
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 20,
                    mainAxisCellCount: 4.5,
                    child: RecentPlayer(),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class XY extends StatelessWidget {
  const XY({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
