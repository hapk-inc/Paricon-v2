import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../logic/s_size.dart';
import '../../routes/my_route.dart';
import '../../theme/my_color.dart';
import '../dashboard/daily_dashboard_table.dart';
import '../dashboard/everyone_friends.dart';
import '../dashboard/no_of_players.dart';
import '../dashboard/recent_player.dart';

class __DashboardP extends ConsumerWidget {
  const __DashboardP({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 4,
      child: TabBarView(
        children: [
          Container(
            color: Colors.red,
          ),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class MyCardList extends StatelessWidget {
  const MyCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: Center(
          child: ListTile(
            title: Text(
              "Enter the code to participate "
              "in the tournament",
              style: TextStyle(
                fontFamily: 'Cabin',
                fontSize: 15.r,
                fontWeight: FontWeight.w300,
                color: blackOlive,
              ),
            ),
            subtitle: const __MyTextFormField(),
          ),
        )),
        Expanded(
          flex: 4,
          child: MasonryGridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            padding: EdgeInsets.all(4.5.r),
            itemCount: 9,
            itemBuilder: (_, i) => Tile(
              index: i,
              extent: mockInteger(1500, 2100) * .001 * 90.h,
            ),
          ),
        ),
      ],
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.green,
        borderRadius: BorderRadius.circular(7.5.r),
      ),
      height: extent,
      child: Center(
        child: CircleAvatar(
          radius: 45.r,
          child: RandomAvatar(mockString()),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}

class OverallPeople extends ConsumerWidget {
  const OverallPeople({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    final bool isTab = sSize == ScreenSize.tab;
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 20,
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
            mainAxisCellCount: 0.3,
            child: Container(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 1.8,
            child: Container(
              //color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
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
            mainAxisCellCount: isTab ? 3.6 : 3.9,
            child: const RecentPlayer(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 0.75,
            child: Container(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 9,
            mainAxisCellCount: 6,
            child: Container(
              color: Colors.amber,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(right: 3.w, bottom: 3.h),
              padding: EdgeInsets.only(left: 3.w, bottom: 3.h),
              child: LayoutBuilder(
                builder: (_, p1) => ListTile(
                  onTap: () {},
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.03),
                  minVerticalPadding: 0,
                  title: Container(
                    height: p1.maxHeight * 0.3,
                    //color: Colors.red,
                    alignment: Alignment.centerLeft,
                    child: const FittedBox(
                      child: AutoSizeText(
                        "Normal",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 72,
                            color: gunMetal,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  subtitle: Container(
                    height: p1.maxHeight * 0.15,
                    //color: Colors.amber,
                    alignment: Alignment.centerLeft,
                    child: const FittedBox(
                      child: AutoSizeText(
                        "Experience a simple game",
                        style: TextStyle(
                          color: gunMetal,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 11,
            mainAxisCellCount: 6,
            child: Container(
              color: Colors.red,
              margin: EdgeInsets.only(right: 3.w, bottom: 3.h),
              padding: EdgeInsets.only(left: 3.w, bottom: 3.h),
              alignment: Alignment.centerLeft,
              child: LayoutBuilder(
                builder: (_, p1) => ListTile(
                  onTap: () {},
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.03),
                  minVerticalPadding: 0,
                  title: Container(
                    height: p1.maxHeight * 0.3,
                    //color: Colors.red,
                    alignment: Alignment.centerLeft,
                    child: const FittedBox(
                      child: AutoSizeText(
                        "Closed",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 72,
                            color: gunMetal,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  subtitle: Container(
                    height: p1.maxHeight * 0.15,
                    //color: Colors.amber,
                    alignment: Alignment.centerLeft,
                    child: const FittedBox(
                      child: AutoSizeText(
                        "No one's getting a peek at your clicks!",
                        style: TextStyle(
                          color: gunMetal,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w100,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 11,
            mainAxisCellCount: 6,
            child: Container(
              color: Colors.blue,
              padding: EdgeInsets.only(left: 3.w, bottom: 3.h),
              margin: EdgeInsets.only(right: 3.w, bottom: 3.h),
              alignment: Alignment.centerLeft,
              child: LayoutBuilder(
                builder: (_, p1) => ListTile(
                  onTap: () {},
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.03),
                  minVerticalPadding: 0,
                  title: Container(
                    height: p1.maxHeight * 0.3,
                    //color: Colors.red,
                    alignment: Alignment.centerLeft,
                    child: const FittedBox(
                      child: AutoSizeText(
                        "Orderwise",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 72,
                            color: gunMetal,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  subtitle: Container(
                    height: p1.maxHeight * 0.15,
                    //color: Colors.amber,
                    alignment: Alignment.centerLeft,
                    child: const FittedBox(
                      child: AutoSizeText(
                        "No one's getting a peek at your clicks!",
                        style: TextStyle(
                          color: gunMetal,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w100,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 9,
            mainAxisCellCount: 6,
            child: Container(
              color: Colors.green,
              margin: EdgeInsets.only(right: 3.w, bottom: 3.h),
              padding: EdgeInsets.only(left: 3.w, bottom: 3.h),
              alignment: Alignment.centerLeft,
              child: LayoutBuilder(
                builder: (_, p1) => ListTile(
                  onTap: () {},
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.03),
                  minVerticalPadding: 0,
                  title: Container(
                    height: p1.maxHeight * 0.3,
                    //color: Colors.red,
                    alignment: Alignment.centerLeft,
                    child: const FittedBox(
                      child: AutoSizeText(
                        "Quick Play",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 72,
                            color: gunMetal,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  subtitle: Container(
                    height: p1.maxHeight * 0.15,
                    //color: Colors.amber,
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      "Connect to random people",
                      style: TextStyle(
                        color: gunMetal,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w100,
                        fontSize: 12.r,
                      ),
                      minFontSize: 6,
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 0.75,
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class ParticipantTournament extends StatelessWidget {
  const ParticipantTournament({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 8.1,
            child: Center(
              child: ListTile(
                title: Text(
                  "Enter the code to participate "
                  "in the tournament",
                  style: TextStyle(
                    fontFamily: 'Cabin',
                    fontSize: 15.r,
                    fontWeight: FontWeight.w300,
                    color: blackOlive,
                  ),
                ),
                subtitle: const __MyTextFormField(),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 21,
            child: LayoutBuilder(
              builder: (_, p1) => CarouselSlider(
                items: List.generate(
                  3,
                  (index) => Card(
                    margin: EdgeInsets.all(15.r),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5.r)),
                    color: gunMetal,
                    elevation: 9,
                    child: Container(
                      padding: EdgeInsets.all(15.r),
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Step into the tournament, "
                            "play and claim your victory",
                            style: TextStyle(
                              fontFamily: 'LilitaOne',
                              color: frenchGray,
                              fontSize: 21.r,
                              fontWeight: FontWeight.w700,
                              height: 1.8,
                            ),
                          ),
                          Lottie.asset(
                            'assets/tournament_trophies.json',
                            repeat: false,
                          ),
                          Container(
                            height: 30.h,
                            width: 90.w,
                            child: ElevatedButton(
                              onPressed: () =>
                                  context.router.push(const TournamentRoute()),
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(gold),
                                  fixedSize:
                                      MaterialStatePropertyAll(Size.zero)),
                              child: Text(
                                "Play Now",
                                style: TextStyle(
                                  fontSize: 12.r,
                                  color: darkPurple,
                                  fontWeight: FontWeight.w800,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                options: CarouselOptions(
                  viewportFraction: 0.81,
                  enableInfiniteScroll: false,
                  height: p1.maxHeight,
                  padEnds: false,
                  enlargeCenterPage: true,
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 1.8,
            child: Container(
              //color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
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
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 15,
            child: DailyDashboardTable(),
          ),
        ],
      ),
    );
  }
}

class __MyTextFormField extends StatelessWidget {
  const __MyTextFormField();

  @override
  Widget build(BuildContext context) => Container(
        height: 60.h,
        margin: EdgeInsets.only(bottom: 18.h, top: 18.h, right: 9.w),
        child: TextFormField(
          enabled: true,
          expands: false,
          maxLines: 1,
          //minLines: 1,
          style: TextStyle(
            fontSize: 15.r,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: gunMetal,
          ),
          decoration: InputDecoration(
            suffix: InkWell(
              onTap: () {},
              child: Text(
                "CONFIRM",
                style: TextStyle(
                  fontSize: 15.r,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: pistachio,
                ),
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(color: spaceCadet, width: 0.6.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: frenchGray, width: 0.6.r),
              borderRadius: BorderRadius.circular(6.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: barnRed),
              borderRadius: BorderRadius.circular(6.r),
            ),
            labelText: 'Enter Tournament Code',
            labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15.r,
              fontWeight: FontWeight.normal,
              color: frenchGray,
            ),
          ),
        ),
      );
}

BorderRadius buildBorderRadius() => BorderRadius.only(
      bottomLeft: Radius.circular(21.r),
      bottomRight: Radius.circular(21.r),
    );
