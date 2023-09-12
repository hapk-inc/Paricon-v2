import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/auth.dart';
import 'package:paricon/my_widgets/my_names.dart';
import 'package:paricon/routes/my_route.dart';
import '../../logic/dot_notifier.dart';
import '../../theme/my_color.dart';
import 'package:random_avatar/random_avatar.dart';

import '../dashboard/daily_dashboard_table.dart';
import '../dashboard/recent_player.dart';

class DashboardP extends ConsumerStatefulWidget {
  const DashboardP({super.key});

  @override
  ConsumerState createState() => _DashboardPState();
}

class _DashboardPState extends ConsumerState<DashboardP>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 4,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      dotNotifierProvider,
      (previous, next) {
        debugPrint(next.toString());
        _tabController.animateTo(next);
      },
    );

    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            _TournamentState(),
            _OnlinePlayerState(),
            _MyCardListState(),
            _ProfileDetailState(),
          ],
        ),
      ),
    );
  }
}

class _ProfileDetailState extends ConsumerWidget {
  const _ProfileDetailState({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 2.7,
            child: Container(
              color: frenchGray.withOpacity(0.3),
              alignment: Alignment.centerLeft,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                dense: true,
                leading: Text(
                  toBeginningOfSentenceCase(myRandomName()) ?? "Play Games",
                  style: TextStyle(
                    fontSize: 16.r,
                    color: spaceCadet,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                trailing: Text(
                  "#${mockInteger(100000, 999999)}",
                  style: TextStyle(
                    fontSize: 16.r,
                    color: barnRed,
                    fontFamily: 'Cabin',
                    //fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 0.3,
              child: Container()),
          /* StaggeredGridTile.count(
            crossAxisCellCount: 6,
            mainAxisCellCount: 4.5,
            child: Container(
              //color: barnRed,
              alignment: Alignment.center,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 18.w),
                dense: true,
                title: AutoSizeText(
                  "${mockInteger(1, 200)}".padLeft(2, '0'),
                  style: TextStyle(
                    fontSize: 36.r,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    color: battleshipGray,
                    letterSpacing: 0.3,
                  ),
                  maxLines: 1,
                ),
                subtitle: Text(
                  "My Rank",
                  style: TextStyle(
                    fontSize: 12.r,
                    fontFamily: 'Poppins',
                    color: battleshipGray,
                  ),
                ),
                isThreeLine: false,
                minVerticalPadding: 0,
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 7,
            mainAxisCellCount: 4.5,
            child: Container(
              //color: barnRed,
              alignment: Alignment.center,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 18.w),
                dense: true,
                title: AutoSizeText(
                  "${"${mockInteger(1, 5)}".padLeft(2, '0')}:${mockInteger(1, 59).toString().padLeft(2, "0")}",
                  style: TextStyle(
                    fontSize: 27.r,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    color: battleshipGray,
                    letterSpacing: 0,
                  ),
                  maxLines: 1,
                ),
                subtitle: Text(
                  "Best Score",
                  style: TextStyle(
                    fontSize: 12.r,
                    fontFamily: 'Poppins',
                    color: battleshipGray,
                  ),
                ),
                isThreeLine: false,
                minVerticalPadding: 0,
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 7,
            mainAxisCellCount: 4.5,
            child: Container(
              //color: barnRed,
              alignment: Alignment.center,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 18.w),
                dense: true,
                title: AutoSizeText(
                  "${"${mockInteger(1, 5)}".padLeft(2, '0')}:${mockInteger(1, 59).toString().padLeft(2, "0")}",
                  style: TextStyle(
                    fontSize: 24.r,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    color: battleshipGray,
                    letterSpacing: 0,
                  ),
                  maxLines: 1,
                ),
                subtitle: Text(
                  "Debut Score",
                  style: TextStyle(
                    fontSize: 9.r,
                    fontFamily: 'Poppins',
                    color: battleshipGray,
                  ),
                ),
                isThreeLine: false,
                minVerticalPadding: 0,
              ),
            ),
          ),*/
          StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 4.5,
              child: Container()),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 3,
            child: Container(
              color: frenchGray.withOpacity(0.3),
              alignment: Alignment.centerLeft,
              // alignment: Alignment.centerLeft,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                dense: true,
                leading: AspectRatio(
                  aspectRatio: 1,
                  child: Lottie.asset(
                    "assets/email.json",
                    repeat: false,
                  ),
                ),
                title: Text(
                  "${myRandomName().toLowerCase()}@gmail.com",
                  style: TextStyle(
                    fontSize: 14.r,
                    color: russianViolet,
                    fontFamily: 'Poppins',
                    //letterSpacing: 0.15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 0.3,
              child: Container()),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 21,
            child: Container(
                //color: spaceCadet,
                ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 2.7,
            child: Container(
              color: frenchGray.withOpacity(0.3),
              alignment: Alignment.centerLeft,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                dense: true,
                leading: InkWell(
                  onTap: () => ref.read(signOutProvider),
                  child: Text(
                    "Log out",
                    style: TextStyle(
                      fontSize: 16.r,
                      color: spaceCadet,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                trailing: Text(
                  "Log out from this device",
                  style: TextStyle(
                    fontSize: 16.r,
                    color: barnRed,
                    fontFamily: 'Cabin',
                    //fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyCardListState extends StatelessWidget {
  const _MyCardListState({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 2.4,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                "My Cards",
                style: TextStyle(
                  fontSize: 16.r,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 4.8,
            child: ColoredBox(
              color: raisinBlack,
              child: Container(
                //height: 50.h,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                margin: EdgeInsets.symmetric(vertical: 18.h),
                child: TextFormField(
                  enabled: true,
                  expands: true,
                  maxLines: null,
                  maxLength: 8,

                  //minLines: 1,
                  style: TextStyle(
                    fontSize: 18.r,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                    color: teaRed,
                  ),
                  decoration: InputDecoration(
                    counterText: "",
                    suffix: InkWell(
                      onTap: () {},
                      child: Text(
                        "VALIDATE",
                        style: TextStyle(
                          fontSize: 15.r,
                          fontFamily: 'Poppins',
                          letterSpacing: 0,
                          fontWeight: FontWeight.w700,
                          color: tiffanyBlue,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(color: citron, width: 0.6.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: frenchGray, width: 0.6.r),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: barnRed),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    labelText: 'Enter Code to Join Room',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14.r,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0,
                      color: hunyadiYellow,
                    ),
                  ),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 24,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 15.h),
              child: MasonryGridView.count(
                crossAxisCount: 4,
                padding: EdgeInsets.all(3.6.r),
                itemCount: mockInteger(4, 11),
                itemBuilder: (_, i) => Tile(
                  index: i,
                  extent: mockInteger(1500, 1600) * .001 * 90.h,
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 4.5,
            child: Container(
              alignment: Alignment.center,
              color: platinum,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: LayoutBuilder(
                builder: (_, p1) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      // flex: 2,
                      child: Stack(
                        children: [
                          Center(
                            child: AutoSizeText(
                              "'${mockString(6).toUpperCase()}'",
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 30.r,
                                fontFamily: 'LilitaOne',
                                color: barnRed,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 15.w),
                        minVerticalPadding: 0,
                        title: Container(
                          height: 24.h,
                          //color: Colors.red,
                          alignment: Alignment.centerLeft,
                          child: const FittedBox(
                            child: AutoSizeText(
                              "Share this code",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                color: gunMetal, fontSize: 72,
                                //decorationThickness: 40,
                              ),
                            ),
                          ),
                        ),
                        subtitle: Container(
                          height: 20.h,
                          //color: Colors.amber,
                          alignment: Alignment.centerLeft,
                          child: const FittedBox(
                            child: AutoSizeText(
                              "to collect new and cool avatar",
                              style: TextStyle(
                                color: battleshipGray,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
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
    /*final child = AnimatedContainer(
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
    );*/
    final child1 = AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: extent,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(3.6.r),
        color: [
          olivine,
          pacificCyan,
          scarlet,
          hunyadiYellow
        ][mockInteger(0, 3)],
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: -10.5.h,
              right: 0,
              height: 90.h,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RandomAvatar(mockString(), trBackground: true),
              ),
            ),
          ],
        ),
      ),
    );

    return child1;
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

class _OnlinePlayerState extends StatelessWidget {
  const _OnlinePlayerState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 2.4,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                "Play Games",
                style: TextStyle(
                  fontSize: 16.r,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 4.8,
            child: ColoredBox(
              color: raisinBlack,
              child: Container(
                //height: 50.h,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                margin: EdgeInsets.symmetric(vertical: 18.h),
                child: TextFormField(
                  enabled: true,
                  expands: true,
                  maxLines: null,
                  maxLength: 8,

                  //minLines: 1,
                  style: TextStyle(
                    fontSize: 18.r,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                    color: teaRed,
                  ),
                  decoration: InputDecoration(
                    counterText: "",
                    suffix: InkWell(
                      onTap: () {},
                      child: Text(
                        "VALIDATE",
                        style: TextStyle(
                          fontSize: 15.r,
                          fontFamily: 'Poppins',
                          letterSpacing: 0,
                          fontWeight: FontWeight.w700,
                          color: tiffanyBlue,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(color: citron, width: 0.6.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: frenchGray, width: 0.6.r),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: barnRed),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    labelText: 'Enter Code to Join Room',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14.r,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0,
                      color: hunyadiYellow,
                    ),
                  ),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 2.4,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                "Recently Users",
                style: TextStyle(
                  fontSize: 16.r,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 4.2,
            child: RecentPlayer(),
          ),
        ],
      ),
    );
  }
}

class _TournamentState extends ConsumerWidget {
  const _TournamentState();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 2.4,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                "Tournament",
                style: TextStyle(
                  fontSize: 16.r,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 4.8,
            child: ColoredBox(
              color: raisinBlack,
              child: Container(
                //height: 50.h,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                margin: EdgeInsets.symmetric(vertical: 18.h),
                child: TextFormField(
                  enabled: true,
                  expands: true,
                  maxLines: null,
                  maxLength: 8,

                  //minLines: 1,
                  style: TextStyle(
                    fontSize: 18.r,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                    color: teaRed,
                  ),
                  decoration: InputDecoration(
                    counterText: "",
                    suffix: InkWell(
                      onTap: () {},
                      child: Text(
                        "CONFIRM",
                        style: TextStyle(
                          fontSize: 15.r,
                          fontFamily: 'Poppins',
                          letterSpacing: 0,
                          fontWeight: FontWeight.w700,
                          color: tiffanyBlue,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(color: citron, width: 0.6.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: frenchGray, width: 0.6.r),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: barnRed),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    labelText: 'Enter Code to register new tournament',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14.r,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0,
                      color: hunyadiYellow,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SpaceStaggeredGrid(),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 18,
            child: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: LayoutBuilder(
                builder: (_, p1) => CarouselSlider(
                  items: [
                    Container(
                      alignment: Alignment.center,
                      color: barnRed,
                      child: Column(
                        children: [
                          Lottie.asset('assets/tournament_trophies.json'),
                          ElevatedButton(
                            onPressed: () =>
                                context.router.push(TournamentRoute()),
                            child: Text("Play Now"),
                          )
                        ],
                      ),
                    ),
                    Container(color: darkCyan),
                  ],
                  options: CarouselOptions(
                    height: p1.maxHeight,
                    viewportFraction: 0.81,
                    enlargeFactor: 0.21,
                    enableInfiniteScroll: false,
                    padEnds: false,
                    enlargeCenterPage: true,
                  ),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 2.4,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                "Recently Played",
                style: TextStyle(
                  fontSize: 16.r,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 15,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: const DailyDashboardTable(),
            ),
          ),
        ],
      ),
    );
  }
}

class SpaceStaggeredGrid extends StatelessWidget {
  const SpaceStaggeredGrid({super.key});

  @override
  Widget build(BuildContext context) => StaggeredGridTile.count(
        crossAxisCellCount: 20,
        mainAxisCellCount: 1.2,
        child: Container(),
      );
}

//Choose a block to tap, remember it,
// and then click on the next block to find its match.

//"Pick a block, make a mental note of it,
// and then locate its corresponding pair."
