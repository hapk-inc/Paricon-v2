import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/my_widgets/trophy_rank.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../my_widgets/my_list_tile.dart';
import '../../my_widgets/my_names.dart';
import '../../routes/my_route.dart';

class DashboardP extends ConsumerStatefulWidget {
  const DashboardP({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _DashboardPState();
}

class _DashboardPState extends ConsumerState<DashboardP> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 805.h,
      child: const _Dashboard(),
    );
  }
}

class _Dashboard extends ConsumerWidget {
  const _Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _VerticalPlayerList(),
        SizedBox(width: 3.w),
        const Expanded(child: _DState()),
        SizedBox(width: 3.w),
      ],
    );
  }
}

class _DState extends StatelessWidget {
  const _DState();

  @override
  Widget build(BuildContext context) {
    return const __DState();
  }
}

class __DState extends StatelessWidget {
  const __DState();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 1.5.w),
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        mainAxisSpacing: 6.h,
        crossAxisSpacing: 3.w,
        children: [
          const StaggeredGridTile.count(
            crossAxisCellCount: 9,
            mainAxisCellCount: 9,
            child: _HowManyNewPlayers(),
          ),
          StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 9,
              child: Container(
                  // color: Colors.red,
                  )),
          const StaggeredGridTile.count(
            crossAxisCellCount: 9,
            mainAxisCellCount: 6,
            child: _MyTournamentTimer(),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 9,
            mainAxisCellCount: 3,
            child: _MyPlayButton(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 10,
            mainAxisCellCount: 1,
            child: Container(),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 13,
            mainAxisCellCount: 20,
            child: _BestRecordList(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 7,
            mainAxisCellCount: 9,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 9.h),
              child: AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${mockInteger(10, 1000)}",
                      style: const TextStyle(
                        fontFamily: 'LilitaOne',
                        fontSize: 27,
                      ),
                    ),
                    const TextSpan(
                      text: " games played so far",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
                maxFontSize: 18,
                minFontSize: 12,
                wrapWords: true,
                softWrap: true,
                maxLines: 3,
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 7,
            mainAxisCellCount: 10,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 9.h),
              child: AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "${mockInteger(10, 1000)}",
                        style: const TextStyle(
                          fontFamily: 'LilitaOne',
                          fontSize: 24,
                        )),
                    const TextSpan(
                      text: " games played so far",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
                maxFontSize: 18,
                minFontSize: 12,
                wrapWords: true,
                softWrap: true,
                maxLines: 3,
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 6,
            child: Container(
              margin: EdgeInsets.only(top: 3.h),
              decoration: BoxDecoration(
                  color: const Color(0xff9467FF),
                  borderRadius: BorderRadius.circular(3.w)),
              padding: EdgeInsets.only(left: 6.w, top: 6.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: const FittedBox(
                        child: AutoSizeText(
                          "Today Tournament",
                          style: TextStyle(
                              color: Colors.white70, fontFamily: 'LilitaOne'),
                        ),
                      ),
                    ),
                  ),
                  const Flexible(flex: 4, child: _XXY()),
                ],
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 4,
            child: Container(
              //color: Colors.red,
              alignment: Alignment.center,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  4,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.6.w,
                          color: const Color(0xffbc9ec1),
                        ),
                        color: index == 2 ? const Color(0xffe3bac6) : null,
                        borderRadius: BorderRadius.circular(3.w)),
                    // color: Colors.blue,
                    width: 81.w,
                    margin: EdgeInsets.only(right: 9.w),
                    alignment: Alignment.center,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                      minVerticalPadding: 0,
                      dense: true,
                      title: Container(
                        height: 15.h,
                        margin: EdgeInsets.only(bottom: 6.h),
                        //color: Colors.red,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 5,
                              child: FittedBox(
                                child: AutoSizeText(
                                  myRandomName(),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    //fontWeight: FontWeight.w100,
                                    color: Color(0xff1f2232),
                                    fontSize: 72,
                                    //decorationThickness: 40,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Flexible(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: RandomAvatar(mockString()),
                              ),
                            )
                          ],
                        ),
                      ),
                      subtitle: Container(
                        height: 21.h,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              child: AutoSizeText(
                                "${mockInteger(1, 9)}:${mockInteger(10, 59)}",
                                style: const TextStyle(
                                  color: Color(0xff1f2232),
                                  fontFamily: 'BrunoAceSC',
                                ),
                              ),
                            ),
                            /*if (index == 0)
                              const AspectRatio(
                                aspectRatio: 1,
                                child: TrophyRank(),
                              )*/
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          /*StaggeredGridTile.count(
            crossAxisCellCount: 6,
            mainAxisCellCount: 8,
            child: Container(
                */ /* color: const Color(0xff1B998B),
              padding: EdgeInsets.all(6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const AutoSizeText(
                    "Best Streak",
                    style: TextStyle(
                      fontFamily: 'LilitaOne',
                      color: Color(0xfffde8e9),
                    ),
                    minFontSize: 8,
                    maxFontSize: 12,
                  ),
                  //Space10(),
                  ListTile(
                    dense: true,
                    title: SizedBox(
                      height: 36.h,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "x4",
                          style: TextStyle(fontFamily: 'LilitaOne'),
                        ),
                      ),
                    ),
                    subtitle: SizedBox(
                      height: 15.h,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          myRandomName(),
                          style: const TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),*/ /*
                ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 6,
            mainAxisCellCount: 3,
            child: Container(
                //color: const Color(0xff1B998B),
                ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 6,
            mainAxisCellCount: 6,
            child: Container(
                // color: const Color(0xff1B998B),
                ),
          ),*/
        ],
      ),
    );
  }
}

class _BestRecordList extends StatelessWidget {
  const _BestRecordList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 9.h,
        bottom: 6.h,
        right: 3.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.w),
        border: Border.all(width: .3.w),
      ),
      padding: EdgeInsets.all(9.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            "Best Scores Overall..",
            style: TextStyle(
              fontFamily: 'LilitaOne',
              color: Color(0xff1f2232),
            ),
            minFontSize: 8,
            maxFontSize: 12,
          ),
          const Space10(),
          Expanded(
              child: ListView(
            children: List.generate(
                4,
                (index) => Column(
                      children: [
                        Container(
                          height: 57.h,
                          alignment: Alignment.center,
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: const Color(0xff724cf9),
                                child: RandomAvatar(mockString(),
                                    trBackground: true),
                              ),
                              SizedBox(width: 15.w),
                              SizedBox(
                                width: 96.w,
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  minVerticalPadding: 0,
                                  dense: true,
                                  title: Container(
                                    height: 15.h,
                                    margin: EdgeInsets.only(bottom: 6.h),
                                    //color: Colors.red,
                                    alignment: Alignment.centerLeft,
                                    child: FittedBox(
                                      child: AutoSizeText(
                                        "${myRandomName()} ${myRandomName()}",
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          //fontWeight: FontWeight.w100,
                                          color: Color(0xff1f2232),
                                          fontSize: 72,
                                          //decorationThickness: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                  subtitle: Container(
                                    height: 21.h,
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FittedBox(
                                          child: AutoSizeText(
                                            "0${mockInteger(0, 9)}: ${mockInteger(10, 59)}",
                                            style: const TextStyle(
                                              color: Color(0xff1f2232),
                                              fontFamily: 'BrunoAceSC',
                                            ),
                                          ),
                                        ),
                                        if (index == 0)
                                          const AspectRatio(
                                            aspectRatio: 1,
                                            child: TrophyRank(),
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3.h)
                      ],
                    )),
          ))
        ],
      ),
    );
  }
}

class _MyTournamentTimer extends StatelessWidget {
  const _MyTournamentTimer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
      ),
      padding: EdgeInsets.all(3.w),
      alignment: Alignment.centerLeft,
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.only(left: 9.w, right: 12.w),
        title: SizedBox(
          height: 21.h,
          child: const FittedBox(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              "Tournament ends at",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w100,
                color: Color(0xffbc9ec1),
              ),
            ),
          ),
        ),
        subtitle: SizedBox(
          height: 36.h,
          child: FittedBox(
            alignment: Alignment.centerLeft,
            child: AutoSizeText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "0${mockInteger(1, 5)}:${mockInteger(10, 59)}",
                  ),
                  TextSpan(
                    text: ":${mockInteger(10, 55)}",
                    style: const TextStyle(fontSize: 9),
                  )
                ],
              ),
              style: TextStyle(
                fontFamily: 'BrunoAceSC',
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5.w,
                color: const Color(0xffbc9ec1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MyPlayButton extends StatelessWidget {
  const _MyPlayButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
      onPressed: () => context.router.push(const TournamentRoute()),
      child: const AutoSizeText(
        "Play Tournament",
        maxLines: 1,
        maxFontSize: 15,
        minFontSize: 9,
      ),
    );
  }
}

class _XXY extends StatelessWidget {
  const _XXY();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 9.w),
      child: LayoutBuilder(
        builder: (_, p1) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 3,
              fit: FlexFit.loose,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    height: p1.maxHeight,
                    left: -p1.maxWidth * 0.05,
                    bottom: -p1.maxHeight * 0.07,
                    width: p1.maxWidth * 0.3,
                    child: CircleAvatar(
                      radius: p1.maxHeight * 0.8,
                      backgroundColor: Colors.transparent,
                      child: RandomAvatar(mockString(), trBackground: true),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            Flexible(
              flex: 7,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                minVerticalPadding: 0,
                horizontalTitleGap: 0,
                dense: true,
                subtitle: Container(
                  height: 15.h,
                  margin: EdgeInsets.only(top: 3.h),
                  //color: Colors.amber,
                  alignment: Alignment.centerLeft,
                  child: const FittedBox(
                    child: AutoSizeText(
                      "#FirstTime  #Top 10",
                      style: TextStyle(
                        color: Color(0xfffde8e9),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ),
                title: Container(
                  height: 24.h,
                  //color: Colors.red,
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    child: AutoSizeText(
                      myRandomName(),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xfffde8e9),
                      ),
                    ),
                  ),
                ),
                isThreeLine: true,
                /*   trailing: AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "04: ${mockInteger(11, 59)}"),
                      TextSpan(
                          text: " : ${mockInteger(100, 500)}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white54,
                          ))
                    ],
                  ),
                  style: const TextStyle(
                    fontFamily: 'LilitaOne',
                    fontSize: 15,
                    color: Color(0xfffde8e9),
                  ),
                ),*/
              ),
            ),
            Flexible(
              flex: 4,
              child: FittedBox(
                // fit: BoxFit.fill,
                child: AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text:
                              "0${mockInteger(2, 5)}: ${mockInteger(11, 59)}"),
                      TextSpan(
                        text: ": ${mockInteger(100, 500)}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white54,
                        ),
                      )
                    ],
                  ),
                  style: const TextStyle(
                    fontFamily: 'BrunoAceSC',
                    fontSize: 15,
                    color: Color(0xfffde8e9),
                  ),
                  maxLines: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _HowManyNewPlayers extends StatelessWidget {
  const _HowManyNewPlayers();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, p1) => Container(
        decoration: BoxDecoration(
          color: const Color(0xff1B998B),
          borderRadius: BorderRadius.circular(p1.maxWidth * 0.05),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(3.w),
        margin: EdgeInsets.only(bottom: 6.h),
        child: LayoutBuilder(
          builder: (context, p1) => Stack(
            children: [
              Positioned(
                top: p1.maxHeight * 0.075,
                left: 0,
                width: p1.maxWidth,
                height: p1.maxHeight * 0.325,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 6.w),
                  children: List.generate(
                    4,
                    (index) => Align(
                      widthFactor: 0.7,
                      child: CircleAvatar(
                        radius: p1.maxWidth * 0.14,
                        backgroundColor: const Color(0xff1B998B),
                        child: CircleAvatar(
                          radius: p1.maxWidth * 0.1275,
                          backgroundColor: const Color(0xff1F2232),
                          child: RandomAvatar(
                            mockString(),
                            trBackground: true,
                            width: p1.maxWidth * 0.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: p1.maxHeight * 0.1,
                height: p1.maxHeight * 0.3,
                left: p1.maxWidth * 0.05,
                right: p1.maxWidth * 0.05,
                //width: p1.maxWidth,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    "${mockInteger(5, 50)} players\n"
                    "have joined today",
                    minFontSize: 6,
                    wrapWords: true,
                    maxFontSize: 9,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: const Color(0xfffde8e9),
                      fontWeight: FontWeight.normal,
                      height: 2.75.h,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _VerticalPlayerList extends StatelessWidget {
  const _VerticalPlayerList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      color: const Color(0xffe3bac6),
      child: ListView(
        padding: EdgeInsets.only(top: 10.h, left: 1.5.w, right: 1.5.w),
        children: List.generate(
          5,
          (index) => AspectRatio(
            aspectRatio: 0.95,
            child: LayoutBuilder(
              builder: (context, p1) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 4,
                    child: CircleAvatar(
                      radius: p1.maxWidth * 0.35,
                      backgroundColor: const Color(0xff724cf9),
                      child: RandomAvatar(
                        mockString(),
                        trBackground: true,
                      ),
                    ),
                  ),
                  Flexible(
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
                  const Space10(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
