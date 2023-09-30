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
import 'everyone_friends.dart';
import 'no_of_players.dart';
import 'recent_player.dart';

class DashboardIpad extends StatelessWidget {
  const DashboardIpad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(9.r),
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 10,
          mainAxisSpacing: 12.r,
          crossAxisSpacing: 9.r,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 13.2,
              child: Tile(index: 0),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 7,
              mainAxisCellCount: 2.1,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: russianViolet,
                  borderRadius: BorderRadius.circular(9.r),
                ),
                padding: EdgeInsets.all(3.r),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.r),
                  title: AutoSizeText(
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
                ),
              ),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2.1,
              child: Tile(index: 0),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 5,
              mainAxisCellCount: 0.9,
              child: Tile(index: 0),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 0.9,
              child: Tile(index: 0),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 9,
              mainAxisCellCount: 1.5,
              child: RecentPlayer(),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 9,
              mainAxisCellCount: 7.2,
              child: DailyDashboardTable(),
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

class DashboardIpad1 extends StatelessWidget {
  const DashboardIpad1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 7.5.r, vertical: 10.h),
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        mainAxisSpacing: 9.r,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 4.5,
            child: Container(
              decoration: BoxDecoration(
                color: russianViolet,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              alignment: Alignment.centerLeft,
              child: ListTile(
                dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 18.r),
                title: Text(
                  "Engage and Unlock your Mind's Potential",
                  maxLines: 2,
                  style: TextStyle(fontSize: 18.r),
                ),
                //isThreeLine: true,
                subtitle: Text(
                  "Challenge yourself in the Puzzle Universe and "
                  "seize victory in competitive tournaments.",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w100,
                    fontSize: 12.r,
                    height: 2.1,
                    color: lavenderBush,
                  ),
                ),
                trailing: OutlinedButton(
                  onPressed: () => context.router.push(const TournamentRoute()),
                  child: Text(
                    "Play Now",
                    style: TextStyle(color: lavenderBush, fontSize: 12.r),
                  ),
                ),
              ),
            ),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 1.2,
            child: DashboardTitleX("Tournament"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 900.h / 360.w > 1.4 ? 16 : 16,
            mainAxisCellCount: 12,
            child: const DailyDashboardTable(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 900.h / 360.w > 1.4 ? 4 : 4,
            mainAxisCellCount: 12,
            child: const SizedBox(),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 1.2,
            child: DashboardTitleX("Recently Joined"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 900.h / 360.w > 1.4 ? 3 : 3,
            child: const RecentPlayer(),
          ),
        ],
      ),
    );
  }
}

class DashboardIpad2 extends StatelessWidget {
  const DashboardIpad2({super.key});

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
            child: DashboardCarousel1(),
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
              child: DashboardTitleX("sdf"),
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
              child: DashboardTitleX("sdfsdf"),
            ),
          ),
          StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 3.0,
              child: RecentPlayer())
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
