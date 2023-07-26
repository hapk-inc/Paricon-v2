import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';

import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../my_widgets/my_logo.dart';
import '../../my_widgets/my_names.dart';
import '../../routes/my_route.dart';

final _panelController = PanelController();

class DashboardP extends ConsumerStatefulWidget {
  const DashboardP({super.key});

  @override
  ConsumerState createState() => _DashboardPState();
}

class _DashboardPState extends ConsumerState<DashboardP>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state.name);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SlidingUpPanel(
        controller: _panelController,
        minHeight: 0,
        body: const _DashboardP(),
        panel: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}

class _DashboardP extends StatelessWidget {
  const _DashboardP();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 210.h,
          collapsedHeight: 100.h,
          toolbarHeight: 99.h,
          leadingWidth: 0,
          titleSpacing: 0,
          elevation: 8,
          centerTitle: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.w),
              bottomRight: Radius.circular(15.w),
            ),
          ),
          title: const _DashboardHeader(),
          flexibleSpace: const _DashboardLogo(),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 18.h,
            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 9.h),
            child: const FittedBox(
              alignment: Alignment.centerLeft,
              child: Text(
                "Recently Played",
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 90.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 3.w, top: 3.h),
              children: List.generate(10, (index) => const _RecentPlayerTile()),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 171.h,
            margin:
                EdgeInsets.only(left: 9.w, top: 6.h, right: 3.w, bottom: 12.h),
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: const Color(0xffEDF2F4),
              borderRadius: BorderRadius.circular(3.w),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const _TopPlayersTile(),
                ...List.generate(5, (index) => const _GenVTile())
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 45.h,
            margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 10.5.h),
            child: ElevatedButton(
              onPressed: () => context.router.push(const TournamentRoute()),
              child: const Text(
                "Click here to play tournament",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 18.h,
            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 9.h),
            child: const FittedBox(
              alignment: Alignment.centerLeft,
              child: Text(
                "LeaderBoard",
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: _DashboardLeaderBoard()),
        //SliverToBoxAdapter(child: SizedBox(height: 15.h)),
        const SliverToBoxAdapter(child: _PlayWithFriendTile()),
        const SliverToBoxAdapter(child: _PickAvatarTile()),
        //SliverToBoxAdapter(child: SizedBox(height: 15.h)),
      ],
    );
  }
}

class _PickAvatarTile extends StatelessWidget {
  const _PickAvatarTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165.h,
      margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: const Color(0xffF5E0A1),
        borderRadius: BorderRadius.circular(6.w),
      ),
      padding: EdgeInsets.all(6.w),
      /*child: LayoutBuilder(
        builder: (context, p1) => Stack(
          children: [
            Text("Share the code and"),
            Text("Get your own avatar"),
          ],
        ),
      ),*/
    );
  }
}

class _PlayWithFriendTile extends StatelessWidget {
  const _PlayWithFriendTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: const Color(0xffa3d9ff),
        borderRadius: BorderRadius.circular(6.w),
      ),
      padding: EdgeInsets.all(6.w),
      child: LayoutBuilder(
        builder: (context, p1) => Row(
          children: [
            Flexible(child: Lottie.asset('assets/friends_joystick.json')),
            SizedBox(width: 15.w),
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 0.9,
                child: FittedBox(
                  child: AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Play with\n",
                          style: TextStyle(
                            fontSize: p1.maxWidth * 0.025,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff17255A),
                          ),
                        ),
                        TextSpan(
                          text: "Friends",
                          style: TextStyle(
                            fontSize: p1.maxWidth * 0.05,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Montserrat',
                            color: const Color(0xff18206F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GenVTile extends StatelessWidget {
  const _GenVTile();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      //color: Colors.red,
      child: LayoutBuilder(
        builder: (_, p1) => Stack(
          fit: StackFit.passthrough,
          children: [
            Positioned(
              width: p1.maxWidth * 0.9,
              left: p1.maxWidth * 0.05,
              bottom: p1.maxHeight * 0.05,
              height: p1.maxHeight * 0.75,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff427AA1),
                  borderRadius: BorderRadius.circular(p1.maxWidth * 0.045),
                ),
              ),
            ),
            Positioned(
              width: p1.maxWidth * 0.9,
              left: p1.maxWidth * 0.05,
              bottom: p1.maxHeight * 0.05,
              height: p1.maxHeight * 0.85,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(p1.maxWidth * 0.045),
                child: GridTile(
                  footer: Container(
                    height: p1.maxHeight * 0.175,
                    color: const Color(0xffA5BE00),
                    padding: EdgeInsets.symmetric(
                        vertical: p1.maxHeight * 0.03,
                        horizontal: p1.maxWidth * 0.1),
                    child: FittedBox(
                      alignment: Alignment.centerRight,
                      child: AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "${myRandomName()} "),
                            TextSpan(
                                text: "${mockInteger(111111, 999999)}",
                                style:
                                    TextStyle(fontSize: p1.maxHeight * 0.12)),
                          ],
                        ),
                        style: TextStyle(
                            color: const Color(0xff090C08),
                            fontSize: p1.maxHeight * 0.2,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Positioned(
                        top: -p1.maxHeight * 0.01,
                        left: p1.maxWidth * 0.025,
                        child: Text(
                          "${mockInteger(1, 8)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: p1.maxWidth * 0.5,
                            color: const Color(0xff064789),
                            fontFamily: 'LilitaOne',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: p1.maxWidth * 0.1,
                        width: p1.maxWidth,
                        left: p1.maxWidth * 0.1,
                        height: p1.maxHeight * 0.75,
                        child: RandomAvatar(
                          mockString(),
                          trBackground: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopPlayersTile extends StatelessWidget {
  const _TopPlayersTile();

  @override
  Widget build(BuildContext context) => Container(
        width: 150.w,
        alignment: Alignment.center,
        child: LayoutBuilder(
          builder: (_, p1) => AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Top\nPlayers\n",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    fontSize: p1.maxHeight * 0.25,
                  ),
                ),
                TextSpan(
                  text: "Best scores",
                  style: TextStyle(
                    color: const Color(0xffD80032),
                    fontSize: p1.maxHeight * 0.1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: " this season",
                  style: TextStyle(
                    fontSize: p1.maxHeight * 0.1,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
              style: const TextStyle(
                color: Color(0xff2B2D42),
                fontFamily: 'Cabin',
              ),
            ),
          ),
        ),
      );
}

class _DashboardLeaderBoard extends StatelessWidget {
  const _DashboardLeaderBoard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
      margin: EdgeInsets.symmetric(horizontal: 9.w),
      decoration: BoxDecoration(
        color: const Color(0xffceeddb),
        borderRadius: BorderRadius.circular(3.w),
      ),
      child: LayoutBuilder(
        builder: (_, p1) => DataTable(
          columnSpacing: 0,
          horizontalMargin: p1.maxWidth * 0.025,
          checkboxHorizontalMargin: 0,
          headingRowHeight: p1.maxHeight * 0.125,
          dataRowMaxHeight: p1.maxHeight * 0.175,
          dataRowMinHeight: p1.maxHeight * 0.1,
          headingTextStyle: TextStyle(
            fontFamily: 'Poppins',
            color: const Color(0xff85baa1),
            fontSize: p1.maxWidth * 0.04,
          ),
          dataTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: p1.maxWidth * 0.035,
            color: const Color(0xff2a0c4e),
          ),
          columns: [
            DataColumn(
              label: Container(
                //color: Colors.red,
                width: p1.maxWidth * 0.275,
                alignment: Alignment.center,
                child: const Text('NAME', textAlign: TextAlign.center),
              ),
            ),
            DataColumn(
              label: Container(
                alignment: Alignment.center,
                //color: Colors.blue,
                width: p1.maxWidth * 0.125,
                child: const Text(
                  'RANK',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            DataColumn(
              label: Container(
                alignment: Alignment.center,
                width: p1.maxWidth * 0.25,
                child: const FittedBox(
                  child: AutoSizeText(
                    'SUBMITTED ON',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            DataColumn(
              label: Container(
                width: p1.maxWidth * 0.2,
                alignment: Alignment.center,
                //color: Colors.indigo,
                child: const AutoSizeText(
                  'TIME',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
          rows: [
            ...List.generate(
              5,
              (index) => DataRow(
                cells: [
                  DataCell(
                    SizedBox(
                      width: p1.maxWidth * 0.275,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: p1.maxWidth * 0.04,
                            child: RandomAvatar(mockString()),
                          ),
                          SizedBox(width: 6.w),
                          Expanded(
                            child: Text(
                              myRandomName(),
                              maxLines: 1,
                              style: const TextStyle(
                                fontFamily: 'Cabin',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      alignment: Alignment.center,
                      width: p1.maxWidth * 0.125,
                      child: Text(
                        "#${mockInteger(1, 10)}",
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff9e2b25),
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: p1.maxWidth * 0.25,
                      alignment: Alignment.center,
                      child: Text(
                        "July ${mockInteger(1, 30)}, 12:30 PM",
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: p1.maxWidth * 0.03,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: p1.maxWidth * 0.2,
                      alignment: Alignment.centerRight,
                      child: FittedBox(
                        child: AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      "0${mockInteger(1, 5)}:${mockInteger(10, 59)}"),
                              TextSpan(
                                  text: ":${mockInteger(100, 599)}",
                                  style:
                                      TextStyle(fontSize: p1.maxWidth * 0.02)),
                            ],
                          ),
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Color(0xff280c4e),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _HighScore extends StatelessWidget {
  final Color tileColor;
  const _HighScore({Key? key, required this.tileColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      margin: EdgeInsets.only(right: 9.w, left: 6.w),
      decoration: BoxDecoration(
        //color: const Color(0xff1F0322),
        //color: const Color(0xff616569),
        //color: const Color(0xffD36582),
        //color: const Color(0xff19647E),
        color: tileColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(9.w),
          bottomRight: Radius.circular(6.w),
          bottomLeft: Radius.circular(6.w),
          topLeft: Radius.circular(6.w),
        ),
        //border: Border.all(width: .3.w),
      ),
      child: LayoutBuilder(
        builder: (context, p1) => Stack(
          //overflow: Overflow.visible,
          //clipBehavior: Clip.hardEdge,
          //clipBehavior: Clip.values[1],
          children: [
            Positioned(
              top: p1.maxHeight * 0.05,
              left: p1.maxWidth * 0.05,
              width: p1.maxWidth * 0.7,
              height: p1.maxHeight * 0.125,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  myRandomName(),
                  maxLines: 1,
                  //style: const TextStyle(color: Color(0xff2B2D42)),
                  //style: const TextStyle(color: Color(0xff85C7DE)),
                  style: const TextStyle(color: Color(0xffB3E9C7)),
                  //style: const TextStyle(color: Color(0xff1A3A3A)),
                ),
              ),
            ),
            Positioned(
              top: p1.maxHeight * 0.2,
              left: p1.maxWidth * 0.04,
              width: p1.maxWidth * 0.7,
              height: p1.maxHeight * 0.15,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text:
                              "0${mockInteger(1, 5)} : ${mockInteger(10, 59)}"),
                      TextSpan(
                        text: " : ${mockInteger(10, 59)}",
                        style: TextStyle(fontSize: p1.maxWidth * 0.125),
                      ),
                    ],
                  ),
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    //color: Color(0xff2B2D42),
                    //color: Color(0xff85C7DE),
                    color: Color(0xffC2F8CB),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Positioned(
              left: -p1.maxWidth * 0.175,
              bottom: -p1.maxHeight * 0.21,
              width: p1.maxWidth * 0.775,
              height: p1.maxHeight * 0.9,
              child: RandomAvatar(mockString(), trBackground: true),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentPlayerTile extends StatelessWidget {
  const _RecentPlayerTile();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.925,
      child: LayoutBuilder(
        builder: (_, p1) => Column(
          children: [
            Flexible(
              flex: 4,
              child: Stack(
                children: [
                  Positioned(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.7,
                    bottom: p1.maxWidth * 0.05,
                    child: const CircleAvatar(
                      backgroundColor: Color(0xff724cf9),
                    ),
                  ),
                  Positioned(
                    bottom: p1.maxWidth * 0.075,
                    height: p1.maxHeight * 0.8,
                    width: p1.maxWidth,
                    child: RandomAvatar(mockString(), trBackground: true),
                  )
                ],
              ),
            ),
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 0.85,
                widthFactor: 1,
                child: FittedBox(
                  child: AutoSizeText(
                    myRandomName(),
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xff1f2232),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardLogo extends StatelessWidget {
  const _DashboardLogo();

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      titlePadding: EdgeInsets.only(bottom: 15.h),
      title: LayoutBuilder(
        builder: (_, p1) {
          double aR = p1.maxHeight / p1.maxWidth;

          double x = aR < 0.4 ? 0.1 : aR + 0.3;
          return Column(
            children: [
              const Spacer(flex: 2),
              Flexible(
                child: FadeIn(
                  delay: const Duration(seconds: 1),
                  child: AnimatedOpacity(
                    opacity: x >= 0.0 && x <= 1.0 ? x : 1,
                    duration: const Duration(milliseconds: 100),
                    child: const FractionallySizedBox(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: MyLogo(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 99.h,
      child: LayoutBuilder(
        builder: (_, p1) => Row(
          children: [
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.75,
                child: FadeIn(
                  delay: const Duration(milliseconds: 500),
                  child: InkWell(
                    onTap: () {
                      if (!_panelController.isPanelOpen) {
                        _panelController.open();
                      } else {
                        _panelController.close();
                      }
                    },
                    child: CircleAvatar(
                      child: RandomAvatar(mockString()),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: p1.maxHeight * 0.35,
                      child: FittedBox(
                        child: FadeIn(
                          delay: const Duration(milliseconds: 500),
                          child: AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "${myRandomName()} "),
                                TextSpan(
                                  text: "#${mockInteger(111111, 999999)}",
                                  style: const TextStyle(
                                      fontSize: 9, fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                            style: const TextStyle(fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: p1.maxHeight * 0.012),
                    SizedBox(
                      height: p1.maxHeight * 0.2,
                      child: FittedBox(
                        child: FadeInRight(
                          delay: const Duration(seconds: 1),
                          child: const AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "Hope you had a great day"),
                              ],
                            ),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
