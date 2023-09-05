import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:paricon/logic/s_size.dart';

import '../../logic/auth.dart';
import '../../my_widgets/my_logo.dart';
import '../../routes/my_route.dart';
import '../../theme/my_color.dart';
import '../dashboard/daily_dashboard_table.dart';
import '../dashboard/everyone_friends.dart';
import '../dashboard/no_of_players.dart';
import '../dashboard/recent_player.dart';

class DashboardP extends ConsumerWidget {
  const DashboardP({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    final bool isTab = sSize == ScreenSize.tab;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: isTab ? 201.h : 210.h,
          leading: const MyLogo(),
          collapsedHeight: 90.h,
          toolbarHeight: 90.h,
          leadingWidth: isTab ? 165.w : 210.w,
          // actions: [],
          elevation: 9,
          centerTitle: false,
          shape: RoundedRectangleBorder(borderRadius: buildBorderRadius()),
          titleSpacing: 0,
          flexibleSpace: const FlexibleSpaceBar(background: __PlayTournament()),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(4.5.r),
            child: StaggeredGrid.count(
              crossAxisCount: 20,
              mainAxisSpacing: 6.h,
              crossAxisSpacing: 6.w,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 5,
                  mainAxisCellCount: isTab ? 4.2 : 3.6,
                  child: const NoOfPlayers(),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 15,
                  mainAxisCellCount: isTab ? 4.2 : 3.6,
                  child: const EveryoneFriends(),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 20,
                  mainAxisCellCount: 1.8,
                  child: Container(
                    //color: Colors.green,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Text(
                      "Recent Played",
                      style: TextStyle(
                        fontSize: 15.r,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 20,
                  mainAxisCellCount: isTab ? 12 : 15,
                  child: const DailyDashboardTable(),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 20,
                  mainAxisCellCount: 1.8,
                  child: Container(
                    //color: Colors.green,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Text(
                      "Recent Users",
                      style: TextStyle(
                        fontSize: 15.r,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 20,
                  mainAxisCellCount: isTab ? 3.6 : 4.14,
                  child: const RecentPlayer(),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 20,
                  mainAxisCellCount: 1.5,
                  child: Container(),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 20,
                  mainAxisCellCount: 6,
                  child: Container(
                    color: Colors.indigo,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 7,
                  mainAxisCellCount: 6,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 6,
                  mainAxisCellCount: 6,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 7,
                  mainAxisCellCount: 6,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 20,
                  mainAxisCellCount: 9,
                  child: Container(
                      //color: Colors.indigo,
                      ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 20,
                  mainAxisCellCount: 3,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () => ref.read(signOutProvider),
                        child: const Text("Sign Out")),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

BorderRadius buildBorderRadius() => BorderRadius.only(
      bottomLeft: Radius.circular(20.4.r),
      bottomRight: Radius.circular(20.4.r),
    );

class __PlayTournament extends ConsumerWidget {
  const __PlayTournament();

  @override
  Widget build(BuildContext context, WidgetRef ref) => LayoutBuilder(
        builder: (_, p1) {
          debugPrint(p1.biggest.aspectRatio.toString());
          final sSize = ref.read(sizeProvider);
          final isTab = sSize == ScreenSize.tab;
          return Container(
            decoration: BoxDecoration(
              borderRadius: buildBorderRadius(),
            ),
            padding: EdgeInsets.all(3.r),
            child: ClipRRect(
              borderRadius: buildBorderRadius(),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  Flexible(
                    flex: 3,
                    child: AnimatedOpacity(
                      opacity: 1,
                      duration: const Duration(milliseconds: 500),
                      child: Stack(
                        children: [
                          Positioned(
                            width: 360.w,
                            top: 0,
                            //top: -15.h,
                            bottom: 0,
                            child: ListTile(
                              minVerticalPadding: 0,
                              dense: true,
                              contentPadding: EdgeInsets.only(
                                left: 15.w,
                                top: isTab ? 3.h : 9.h,
                                right: 9.w,
                              ),
                              title: Text(
                                "Step into the tournament, "
                                "play and claim your victory",
                                style: TextStyle(
                                  fontSize: isTab ? 18.r : 16.r,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  color: eggShell,
                                  height: 1.8,
                                ),
                                maxLines: 2,
                              ),
                              subtitle: Container(
                                margin: EdgeInsets.only(top: 9.h),
                                child: Text(
                                  "100 players have already taken part",
                                  style: TextStyle(
                                    fontSize: 12.r,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w100,
                                    color: lavenderBush,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 21.h,
                            right: 15.w,
                            child: ElevatedButton(
                              onPressed: () {
                                context.router.push(const TournamentRoute());
                              },
                              child: Text(
                                "Play Now",
                                maxLines: 1,
                                style: TextStyle(fontSize: 15.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
