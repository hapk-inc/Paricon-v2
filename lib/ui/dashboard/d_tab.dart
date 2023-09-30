import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../routes/my_route.dart';
import '../../theme/my_color.dart';
import 'cards_collection.dart';
import 'daily_dashboard_table.dart';
import 'dashboard_carousel.dart';
import 'dashboard_title_x.dart';
import 'recent_player.dart';

class DashboardT extends StatelessWidget {
  const DashboardT({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.all(12.r),
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 10,
          mainAxisSpacing: 9.r,
          crossAxisSpacing: 4.5.r,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 3,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: russianViolet,
                  borderRadius: BorderRadius.circular(9.r),
                ),
                padding: EdgeInsets.all(3.r),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.r),
                  /* title: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Engage and Unlock your Mind's Potential",
                      maxLines: 2,
                      style: TextStyle(fontSize: 18.r),
                    ),
                    trailing: OutlinedButton(
                      onPressed: () =>
                          context.router.push(const TournamentRoute()),
                      child: Text(
                        "Play Now",
                        style: TextStyle(color: lavenderBush, fontSize: 15.r),
                      ),
                    ),
                  ),*/
                  title: AutoSizeText(
                    "Engage and Unlock your Mind's Potential",
                    maxLines: 2,
                    style: TextStyle(fontSize: 15.r),
                  ),
                  trailing: OutlinedButton(
                    onPressed: () =>
                        context.router.push(const TournamentRoute()),
                    child: Text(
                      "Play Now",
                      style: TextStyle(color: lavenderBush, fontSize: 15.r),
                    ),
                  ),
                  subtitle: Text(
                    "Challenge yourself in the Puzzle Universe",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w100,
                      fontSize: 12.r,
                      height: 2.4,
                      color: lavenderBush,
                    ),
                  ),
                ),
              ),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 2.4,
              child: Tile(index: 0),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 1.2,
              child: Tile(index: 2),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 6,
              mainAxisCellCount: 1.2,
              child: Tile(index: 1),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 8.1,
              child: DailyDashboardTable(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 2.1,
              child: RecentPlayer(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 2.4,
              child: CardCollection(),
            ),
          ],
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final int index;
  const Tile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.grey);
  }
}

class DashboardT1 extends StatelessWidget {
  const DashboardT1({super.key});

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
