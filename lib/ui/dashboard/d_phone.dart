import 'package:auto_route/auto_route.dart';
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

class DashboardP extends StatelessWidget {
  const DashboardP({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.teal,
      padding: EdgeInsets.all(12.r),
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 10,
          mainAxisSpacing: 9.r,
          crossAxisSpacing: 4.5.r,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 3.6,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: russianViolet,
                  borderRadius: BorderRadius.circular(7.5.r),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.r),
                  title: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Engage and Unlock your Mind's Potential",
                      maxLines: 2,
                      style: TextStyle(fontSize: 15.r),
                    ),
                    trailing: OutlinedButton(
                      onPressed: () =>
                          context.router.push(const TournamentRoute()),
                      child: Text(
                        "Play Now",
                        style: TextStyle(color: lavenderBush, fontSize: 12.r),
                      ),
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
              mainAxisCellCount: 3,
              child: Tile(index: 0),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 1.2,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text("CREATE GAME")),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 6,
              mainAxisCellCount: 1.2,
              child:
                  OutlinedButton(onPressed: () {}, child: Text("CREATE GAME")),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 9.6,
              child: DailyDashboardTable(),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 0.6,
              child: DashboardTitleX("Recently Played"),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 2.1,
              child: RecentPlayer(),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 3,
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

class DashboardP1 extends StatelessWidget {
  const DashboardP1({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.all(6.r),
        child: StaggeredGrid.count(
          crossAxisCount: 20,
          children: const [
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 2.1,
              child: DashboardTitleX("Tournament"),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 16,
              child: DashboardCarousel(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 2.1,
              child: DashboardTitleX("Recently Played"),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 16,
              child: DailyDashboardTable(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 2.1,
              child: DashboardTitleX("Recently Joined"),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 4.02,
              child: RecentPlayer(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 2.1,
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
