import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mock_data/mock_data.dart';

import '../../my_widgets/my_names.dart';

import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../my_widgets/my_list_tile.dart';
import '../../routes/my_route.dart';

class DashboardP extends ConsumerStatefulWidget {
  const DashboardP({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _DashboardPState();
}

//#F5E960

//brown Red #846c5b #c62e65

class _DashboardPState extends ConsumerState<DashboardP> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      panel: const _MyPanel(),
      // collapsed: const _CollapsedScore(),
      //  minHeight: 90.h /*+ 81.h*/,
      minHeight: 81.h,
      maxHeight: 510.h,
      borderRadius: BorderRadius.vertical(top: Radius.circular(9.w)),
      body: Column(
        children: [
          SizedBox(
            height: 805.h,
            child: const _Dashboard(),
          ),
        ],
      ),
    );
  }
}

class _MyPanel extends StatelessWidget {
  const _MyPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffc62e65),
        borderRadius: BorderRadius.vertical(top: Radius.circular(6.w)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /* Flexible(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(12),
              margin: EdgeInsets.only(bottom: 6.w),
              child: LayoutBuilder(
                builder: (_, p1) => ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  minVerticalPadding: 0,
                  trailing: ElevatedButton(
                    onPressed: () =>
                        context.router.push(const TournamentRoute()),
                    child: const Text("Play Tournament"),
                  ),
                  title: Container(
                    height: 33.h,
                    margin: EdgeInsets.only(bottom: 6.h),
                    //color: Colors.red,
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      child: AutoSizeText(
                        "Daily Tournament",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          color: const Color(0xfffde8e9),
                          fontSize: 72,
                          letterSpacing: 1.w,
                          //decorationThickness: 40,
                        ),
                      ),
                    ),
                  ),
                  subtitle: Container(
                    height: 18.h,
                    //color: Colors.amber,
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      child: AutoSizeText(
                        "Tournament No. ${mockInteger(10, 99)}",
                        style: const TextStyle(
                          color: Color(0xfffde8e9),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),*/
          Flexible(
            flex: 4,
            child: ColoredBox(
              color: const Color(0xff846c5b),
              child: ListView(
                children: List.generate(
                  9,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 84.h,
                    //margin: EdgeInsets.symmetric(vertical: 4.5.h),
                    alignment: Alignment.center,
                    color:
                        index.isEven ? Colors.brown : const Color(0xff846c5b),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        SizedBox(width: 6.w),
                        Container(
                          width: 24.w,
                          height: 24.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffF5E960),
                            borderRadius: BorderRadius.circular(6.w),
                          ),
                          padding: EdgeInsets.all(3.w),
                          child: FittedBox(
                            child: Text(
                              "${index + 1}",
                              style: const TextStyle(fontFamily: 'LilitaOne'),
                            ),
                          ),
                        ),
                        SizedBox(width: 18.w),
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: const Color(0xff724cf9),
                          child: RandomAvatar(mockString(), trBackground: true),
                        ),
                        SizedBox(width: 21.w),
                        SizedBox(
                          width: 90.w,
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            minVerticalPadding: 0,
                            dense: true,
                            title: Container(
                              height: 18.h,
                              margin: EdgeInsets.only(bottom: 6.h),
                              //color: Colors.red,
                              alignment: Alignment.centerLeft,
                              child: FittedBox(
                                child: AutoSizeText(
                                  "${myRandomName()} ${myRandomName()}",
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    //fontWeight: FontWeight.w100,
                                    color: Color(0xfffde8e9),
                                    fontSize: 72,
                                    //decorationThickness: 40,
                                  ),
                                ),
                              ),
                            ),
                            subtitle: Container(
                              height: 24.h,
                              //color: Colors.amber,
                              alignment: Alignment.centerLeft,
                              child: FittedBox(
                                child: AutoSizeText(
                                  "0${mockInteger(0, 9)}: ${mockInteger(10, 59)}",
                                  style: const TextStyle(
                                    color: Color(0xfffde8e9),
                                    fontFamily: 'BrunoAceSC',
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CollapsedScore extends StatelessWidget {
  const _CollapsedScore();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffc62e65),
        borderRadius: BorderRadius.vertical(top: Radius.circular(9.w)),
      ),
      padding: EdgeInsets.only(top: 3.h),
      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (_, p1) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    height: p1.maxHeight * 1.1,
                    left: -p1.maxWidth * 0.1,
                    bottom: -p1.maxHeight * 0.1,
                    width: p1.maxWidth * 0.4,
                    child: CircleAvatar(
                      radius: p1.maxHeight,
                      backgroundColor: Colors.transparent,
                      child: RandomAvatar(mockString(), trBackground: true),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: Center(
                child: ListTile(
                  contentPadding: EdgeInsets.only(right: 9.w),
                  minVerticalPadding: 0,
                  dense: true,
                  title: Container(
                    height: 40.h,

                    //color: Colors.red,
                    margin: EdgeInsets.only(top: 6.h),
                    //color: Colors.red,
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      child: AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text:
                                    "0${mockInteger(1, 7)}:${mockInteger(10, 59)}"),
                            TextSpan(
                                text: "  - ${myRandomName()}",
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 48.h)),
                          ],
                        ),
                        style: const TextStyle(
                          fontFamily: 'BrunoAceSC',
                          color: Color(0xfffde8e9),
                          fontSize: 72,
                          //decorationThickness: 40,
                        ),
                      ),
                    ),
                  ),
                  trailing: SizedBox(
                    width: 135.w,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                      child: const AutoSizeText(
                        "Play Tournament",
                        maxLines: 1,
                        minFontSize: 9,
                        maxFontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Dashboard extends StatelessWidget {
  const _Dashboard();

  @override
  Widget build(BuildContext context) => Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 69.w,
            color: const Color(0xffe3bac6),
            child: const _VerticalPlayerList(),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(4),
              child: SingleChildScrollView(
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 3.w,
                  crossAxisSpacing: 3.h,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff1B998B),
                          borderRadius: BorderRadius.circular(6.w),
                        ),
                        padding: EdgeInsets.all(3.w),
                        child: LayoutBuilder(
                          builder: (context, p1) => Stack(
                            children: [
                              Positioned(
                                top: p1.maxHeight * 0.075,
                                left: 0,
                                width: p1.maxWidth,
                                height: p1.maxHeight * 0.35,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.only(left: 6.w),
                                  children: List.generate(
                                    4,
                                    (index) => Align(
                                      widthFactor: 0.7,
                                      child: CircleAvatar(
                                        radius: p1.maxWidth * 0.14,
                                        backgroundColor:
                                            const Color(0xff1B998B),
                                        child: CircleAvatar(
                                          radius: p1.maxWidth * 0.1275,
                                          backgroundColor:
                                              const Color(0xff1F2232),
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
                                bottom: p1.maxHeight * 0.05,
                                height: p1.maxHeight * 0.4,
                                left: p1.maxWidth * 0.05,
                                right: p1.maxWidth * 0.05,
                                //width: p1.maxWidth,
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          // color: const Color(0xffF865B0),
                          borderRadius: BorderRadius.circular(6.w),
                        ),
                        padding: EdgeInsets.all(3.w),
                        alignment: Alignment.centerLeft,
                        child: ListTile(
                          dense: true,
                          contentPadding:
                              EdgeInsets.only(left: 9.w, right: 12.w),
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
                            height: 33.h,
                            child: FittedBox(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "0${mockInteger(1, 5)}:${mockInteger(10, 59)}",
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
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: Container(
                        //padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          color: const Color(0xff433E0E),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6.w),
                            topRight: Radius.circular(6.w),
                            bottomRight: Radius.circular(6.w),
                          ),
                        ),
                        child: LayoutBuilder(
                          builder: (_, p1) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Stack(
                                  children: [
                                    AnimatedPositioned(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      height: p1.maxHeight * 1.1,
                                      left: -p1.maxWidth * 0.225,
                                      bottom: -p1.maxHeight * 0.1,
                                      width: p1.maxWidth * 0.5,
                                      child: CircleAvatar(
                                        radius: p1.maxHeight,
                                        backgroundColor: Colors.transparent,
                                        child: RandomAvatar(mockString(),
                                            trBackground: true),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 6,
                                child: Center(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.only(right: 9.w),
                                    minVerticalPadding: 0,
                                    dense: true,
                                    title: Container(
                                      height: 27.h,
                                      alignment: Alignment.centerLeft,
                                      child: FittedBox(
                                        child: AutoSizeText.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: "0${mockInteger(1, 7)}:"
                                                      "${mockInteger(10, 59)}"),
                                            ],
                                          ),
                                          style: const TextStyle(
                                            fontFamily: 'BrunoAceSC',
                                            color: Color(0xfffde8e9),
                                            fontSize: 72,
                                            //decorationThickness: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                    subtitle: Container(
                                      height: 18.h,
                                      margin: EdgeInsets.only(top: 5.h),
                                      alignment: Alignment.centerLeft,
                                      child: FittedBox(
                                        child: AutoSizeText.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(text: myRandomName()),
                                            ],
                                          ),
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xfffde8e9),
                                            fontSize: 72,
                                            fontWeight: FontWeight.w100,
                                            //decorationThickness: 40,
                                          ),
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
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 4,
                      mainAxisCellCount: 1,
                      child: FadeIn(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xffc62e65),
                              borderRadius: BorderRadius.circular(6.w)),
                          child: LayoutBuilder(
                            builder: (_, p1) => ListTile(
                              dense: true,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.w),
                              minVerticalPadding: 0,
                              trailing: ElevatedButton(
                                onPressed: () => context.router
                                    .push(const TournamentRoute()),
                                child: const Text("Play Tournament"),
                              ),
                              leading: AutoSizeText(
                                "T#${mockInteger(1, 100)}",
                                style: const TextStyle(
                                  fontFamily: 'LilitaOne',
                                  color: Color(0xfffde8e9),
                                  fontSize: 18,
                                ),
                              ),
                              // isThreeLine: true,
                              /*   title: Container(
                                height: 42.h,
                                //margin: EdgeInsets.only(bottom: 6.h),
                                //color: Colors.red,
                                alignment: Alignment.centerLeft,
                                child: FittedBox(
                                  child: AutoSizeText(
                                    "Daily Tournament",
                                    style: TextStyle(
                                      fontFamily: 'LilitaOne',
                                      fontWeight: FontWeight.normal,
                                      color: const Color(0xfffde8e9),
                                      fontSize: 72,
                                      //height: 2.5.h,
                                      letterSpacing: 1.w,
                                      //decorationThickness: 40,
                                    ),
                                  ),
                                ),
                              ),
                              subtitle: Container(
                                height: 15.h,
                                //color: Colors.amber,
                                alignment: Alignment.centerLeft,
                                child: FittedBox(
                                  child: AutoSizeText(
                                    "Tournament No. ${mockInteger(10, 99)}",
                                    style: const TextStyle(
                                      color: Color(0xfffde8e9),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ),
                              ),*/
                            ),
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 3,
                      mainAxisCellCount: 3,
                      child: FadeInRight(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.w),
                              color: const Color(0xff1f2232)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //textDirection: Te,
                            children: [
                              const Flexible(
                                child: AutoSizeText(
                                  "Best Scores",
                                  style: TextStyle(
                                      color: Color(0xfffde8e9),
                                      fontFamily: 'LilitaOne'),
                                  maxFontSize: 12,
                                  minFontSize: 9,
                                ),
                              ),
                              Flexible(
                                flex: 4,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: DataTable(
                                    columns: [
                                      DataColumn(
                                        label: SizedBox(
                                          width: 120.w,
                                          child: const Text("Name"),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Container(
                                          alignment: Alignment.centerRight,
                                          width: 60.w,
                                          child: const Text("Time Taken"),
                                        ),
                                      ),
                                    ],
                                    columnSpacing: 0,
                                    headingRowHeight: 45.h,
                                    dataRowMinHeight: 42.h,
                                    dataRowMaxHeight: 51.h,
                                    horizontalMargin: 0,
                                    checkboxHorizontalMargin: 0,
                                    dataTextStyle: const TextStyle(
                                        fontFamily: 'Poppins', fontSize: 10),
                                    headingTextStyle: const TextStyle(
                                        fontFamily: 'AbrilFatface',
                                        fontSize: 9),
                                    rows: List.generate(
                                      3,
                                      (index) => DataRow(
                                        cells: [
                                          DataCell(
                                            SizedBox(
                                              width: 108.w,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: AutoSizeText(
                                                      myRandomName(),
                                                      maxLines: 1,
                                                      maxFontSize: 15,
                                                      minFontSize: 6,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          const Color(
                                                              0xff724cf9),
                                                      radius: 12,
                                                      child: RandomAvatar(
                                                          mockString(),
                                                          trBackground: true),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Container(
                                              width: 60.w,
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "0${mockInteger(1, 7)} : ${mockInteger(10, 59)}",
                                                style: const TextStyle(
                                                  fontFamily: 'BrunoAceSC',
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
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
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 4,
                      mainAxisCellCount: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff433E0E),
                            borderRadius: BorderRadius.circular(6.w)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}

/*Unattended tournament, effortless victory.
No participants, guaranteed win.
Empty tournament, easy triumph.
Nobody played, simple win.
No contenders, smooth victory.*/

/*ListView(
            children: [
              /*const Space10(),
              Container(
                height: 100.h,
                alignment: Alignment.center,
                color: const Color(0xff1f2232),
                width: 360.w,
                child: ListTile(
                  tileColor: const Color(0xff1f2232),
                  dense: true,
                  title: Container(
                    margin: EdgeInsets.only(bottom: 9.h),
                    child: const AutoSizeText(
                      "Play your First Game",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        color: Color(0xfffde8e9),
                      ),
                      minFontSize: 6,
                      maxFontSize: 9,
                    ),
                  ),
                  subtitle: ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xffc62e65)),
                    ),
                    child: AutoSizeText(
                      "Play Tournament".toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        letterSpacing: 1.5.w,
                        color: const Color(0xfffde8e9),
                      ),
                      wrapWords: true,
                      maxFontSize: 12,
                      minFontSize: 6,
                    ),
                  ),
                ),
                *//*  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 360.w,
                      child: ListTile(
                        //dense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 9.w),
                        //leading: const TrophyRank(),
                        tileColor: const Color(0xff1f2232),
                        title: const AutoSizeText(
                          //"#T 12",
                          "Play your first tournament",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xfffde8e9),
                          ),
                          maxLines: 1,
                          minFontSize: 6,
                          maxFontSize: 15,
                        ),
                        horizontalTitleGap: 0.w,
                        minVerticalPadding: 0,
                        *//* *//* subtitle: AutoSizeText(
                          "${mockInteger(10, 50)} games played so far",
                          maxLines: 1,
                          minFontSize: 4,
                          maxFontSize: 8,
                          style: TextStyle(
                            color: const Color(0xfffde8e9).withOpacity(0.5),
                            fontWeight: FontWeight.w100,
                          ),
                        ),*//* *//*
                        trailing: Container(
                          width: 126.w,
                          height: 45.h,
                          padding: EdgeInsets.only(left: 9.w),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Color(0xffc62e65)),
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(horizontal: 8)),
                                elevation: MaterialStatePropertyAll(4)),
                            child: FittedBox(
                              child: const AutoSizeText(
                                "Start Tournament",
                                maxLines: 1,
                                maxFontSize: 15,
                                minFontSize: 9,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xfffde8e9),
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),*//*
              ),
              SizedBox(
                //color: Colors.red,
                height: 240.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(4.w),
                  children: [
                    Container(
                      width: 150.w,
                      height: 100.h,
                      //child: ,
                      decoration: BoxDecoration(
                        color: const Color(0xffF5E960),
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Container(
                      width: 240.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                    ),
                  ],
                ),
              ),
              const Space10(),
              const _RecentPlayerList(),*/
            ],
          )*/

class _VerticalPlayerList extends StatelessWidget {
  const _VerticalPlayerList();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 10.h, left: 1.5.w, right: 1.5.w),
      children: List.generate(
          5,
          (index) => AspectRatio(
                aspectRatio: 0.95,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 4,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: const Color(0xff724cf9),
                        child: RandomAvatar(mockString(), trBackground: true),
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
              )),
    );
  }
}

class _RecentPlayerList extends StatelessWidget {
  const _RecentPlayerList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114.h,
      //color: Colors.red,
      padding: EdgeInsets.all(4.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Flexible(
            child: AutoSizeText(
              "Recently Played",
              style: TextStyle(
                color: Color(0xff1f2232),
                fontWeight: FontWeight.bold,
              ),
              minFontSize: 6,
              maxFontSize: 12,
            ),
          ),
          Flexible(
            flex: 3,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 9.w),
              children: List.generate(
                7,
                (index) => Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      child: AspectRatio(
                        aspectRatio: 0.8,
                        child: Center(
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: const Color(0xff724cf9),
                            child:
                                RandomAvatar(mockString(), trBackground: true),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* const Padding(
          padding: EdgeInsets.only(left: 8, top: 8),
          child: AutoSizeText(
            "Last 2 Games",
            style: TextStyle(
              color: Color(0xff1f2232),
              fontWeight: FontWeight.bold,
            ),
            minFontSize: 6,
            maxFontSize: 10,
          ),
        ),
        ...List.generate(
          2,
          (index) => Container(
            height: 90.h,
            //color: Colors.green,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.2, color: Colors.indigo),
              ),
            ),
            alignment: Alignment.center,
            child: ListTile(
              //tileColor: Colors.blue,
              // dense: true,
              leading: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  */ /* const AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "02 June,"),
                        TextSpan(text: "  2023"),
                      ],
                    ),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w100,
                    ),
                    minFontSize: 4,
                    maxFontSize: 6,
                  ),
                  SizedBox(height: 6.h),*/ /*
                  AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "03:34:"),
                        TextSpan(text: " 456", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    style: TextStyle(fontFamily: 'BrunoAceSC'),
                    maxFontSize: 12,
                    minFontSize: 9,
                  ),
                ],
              ),
              horizontalTitleGap: 12.w,
              title: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 18,
                  child: RandomAvatar(mockString()),
                ),
                horizontalTitleGap: 9.w,
                dense: true,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      myRandomName(),
                      style: const TextStyle(fontFamily: 'Poppins'),
                      minFontSize: 9,
                      maxFontSize: 12,
                    ),
                    const AutoSizeText(
                      "You didn't play",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w100,
                      ),
                      minFontSize: 3,
                      maxFontSize: 6,
                    )
                  ],
                ),
                */ /* title: AutoSizeText(
                  myRandomName(),
                  maxLines: 1,
                  style: const TextStyle(fontFamily: 'Poppins'),
                  maxFontSize: 12,
                  minFontSize: 6,
                ),
                minVerticalPadding: 0,
                subtitle: AutoSizeText(
                  mockInteger(0, 1) == 0
                      ? "You didn't played"
                      : "You are at rank ${mockInteger(1, 10)}",
                  maxLines: 1,
                  style: const TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w100),
                  maxFontSize: 9,
                  minFontSize: 6,
                ),*/ /*
              ),
            ),
          ),
        )*/

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
    final child = Container(
      color: backgroundColor ?? Colors.green,
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
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
