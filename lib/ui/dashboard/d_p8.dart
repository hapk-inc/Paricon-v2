import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/routes/my_route.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../my_widgets/my_list_tile.dart';
import '../../my_widgets/my_names.dart';

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
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _VerticalPlayerList(),
        Expanded(child: _DState()),
      ],
    );
  }
}

class _VerticalPlayerList extends StatelessWidget {
  const _VerticalPlayerList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      color: const Color(0xffe3bac6),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 6.h),
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
                      radius: p1.maxWidth * 0.375,
                      backgroundColor: const Color(0xff724cf9),
                      child: RandomAvatar(
                        mockString(),
                        trBackground: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 1.5.h),
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

class _DState extends StatelessWidget {
  const _DState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.w),
      child: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) => StaggeredGrid.count(
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
                crossAxisCellCount: 11,
                mainAxisCellCount: 3,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
                  child: const _MyPlayButton(),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 11,
                mainAxisCellCount: 6,
                child: Container(color: Colors.blue),
              ),
              /*  StaggeredGridTile.count(
                crossAxisCellCount: 20,
                mainAxisCellCount: 6,
                child: Container(
                  decoration: BoxDecoration(
                    //color: const Color(0xffc62e65),
                    color: const Color(0xff1f2232),
                    borderRadius: BorderRadius.circular(3.w),
                  ),
                  padding: EdgeInsets.only(right: 6.w, top: 6.h, left: 6.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            "High score so far..",
                            style: TextStyle(
                              fontSize: 6.w,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w100,
                              color: Colors.white54,
                              //letterSpacing: 0.9.w,
                            ),
                            maxFontSize: 10,
                            minFontSize: 8,
                          ),
                          InkWell(
                            onTap: () {
                              print("View All");
                            },
                            child: Container(
                              width: 54.w,
                              height: 21.h,
                              decoration: BoxDecoration(
                                color: const Color(0xffe3bac6),
                                borderRadius: BorderRadius.circular(3.w),
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: 3.w,
                                vertical: 3.h,
                              ),
                              child: const FittedBox(
                                child: Text(
                                  "View All",
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: LayoutBuilder(
                          builder: (_, p1) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                flex: 11,
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  minVerticalPadding: 0,
                                  dense: true,
                                  // isThreeLine: true,
                                  title: Container(
                                    height: p1.maxHeight * 0.4,
                                    //color: Colors.red,
                                    alignment: Alignment.centerLeft,
                                    child: FittedBox(
                                      child: AutoSizeText.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "#${mockInteger(1, 10)}   ",
                                              style: TextStyle(
                                                fontSize: p1.maxWidth * 0.275,
                                                fontFamily: 'LilitaOne',
                                              ),
                                            ),
                                            TextSpan(text: myRandomName()),
                                          ],
                                        ),
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xfffde8e9),
                                          fontSize: 72,
                                          //decorationThickness: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                  */ /* subtitle: Container(
                                    height: p1.maxHeight * 0.25,

                                    //color: Colors.amber,
                                    alignment: Alignment.centerLeft,
                                    child: FittedBox(
                                      child: AutoSizeText(
                                        "${mockInteger(2, 10)} games played till today",
                                        style: const TextStyle(
                                          color: Color(0xfffde8e9),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ),
                                  ),*/ /*
                                  trailing: SizedBox(
                                    width: p1.maxWidth * 0.2,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0, //right: 0,
                                          bottom: -p1.maxHeight * 0.075,
                                          //width: p1.maxWidth,
                                          //height: p1.maxHeight * 0.1,
                                          child: RandomAvatar(
                                            mockString(),
                                            width: p1.maxWidth,
                                            trBackground: true,
                                            height: p1.maxHeight * 1,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Flexible(
                                flex: 4,
                                child: FittedBox(
                                  child: AutoSizeText(
                                    "0${mockInteger(1, 5)}: "
                                    "${mockInteger(11, 59)}",
                                    style: const TextStyle(
                                      fontFamily: 'BrunoAceSC',
                                      color: Color(0xfffde8e9),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),*/
              /*  StaggeredGridTile.count(
                crossAxisCellCount: 20,
                mainAxisCellCount: 12,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 175.w,
                      padding: EdgeInsets.all(6.w),
                      margin: EdgeInsets.only(right: 2.w),
                      decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(6.w),
                        border: Border.all(),
                      ),
                      child: LayoutBuilder(
                        builder: (context, p1) => Column(
                          children: [
                            Flexible(
                              flex: 1,
                              child: FractionallySizedBox(
                                heightFactor: 1,
                                child: Container(
                                  //color: Colors.green,
                                  padding:
                                      EdgeInsets.only(left: 3.w, right: 9.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: p1.maxHeight * 0.35,
                                        child: const FittedBox(
                                          child: AutoSizeText("July 9, 2023"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: p1.maxHeight * 0.15,
                                        child: const FittedBox(
                                          child: AutoSizeText("Live"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: FractionallySizedBox(
                                widthFactor: 1,
                                heightFactor: 0.7,
                                child: Container(
                                  // color: Colors.blue,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.symmetric(
                                    vertical: p1.maxHeight * 0.01,
                                    horizontal: p1.maxWidth * 0.025,
                                  ),
                                  child: FittedBox(
                                    child: AutoSizeText.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "${mockInteger(2, 10)}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: p1.maxHeight * 0.1,
                                            ),
                                          ),
                                          TextSpan(
                                            text: " players played today",
                                            style: TextStyle(
                                              fontSize: p1.maxHeight * 0.05,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                        ],
                                      ),
                                      minFontSize: 36,
                                      maxFontSize: 84,
                                      wrapWords: true,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: FractionallySizedBox(
                                heightFactor: 0.95,
                                child: Row(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: Padding(
                                        padding: EdgeInsets.all(3.w),
                                        child: CircleAvatar(
                                          child: RandomAvatar(mockString()),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: p1.maxWidth * 0.05),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            child: FractionallySizedBox(
                                              heightFactor: 0.75,
                                              child: FittedBox(
                                                alignment: Alignment.centerLeft,
                                                child: AutoSizeText(
                                                  "${mockInteger(1, 5)}:${mockInteger(10, 59)}",
                                                  style: const TextStyle(
                                                    fontFamily: 'BrunoAceSC',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: FittedBox(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                myRandomName(),
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                  //color: Colors.pink,
                                  ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )*/
              /*StaggeredGridTile.count(
                crossAxisCellCount: 20,
                mainAxisCellCount: 8,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      5,
                      (index) => Container(
                            width: 66.w,
                            margin: EdgeInsets.only(right: 3.w),
                            //color: Colors.yellow,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: CircleAvatar(
                                    radius: 27.w,
                                    child: RandomAvatar(mockString()),
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                Flexible(
                                  child: AutoSizeText(
                                    myRandomName(),
                                    style: TextStyle(
                                      fontSize: 9.w,
                                      //fontWeight: FontWeight.w100,
                                    ),
                                    minFontSize: 6,
                                    maxFontSize: 8,
                                    maxLines: 1,
                                    //stepGranularity: 1,
                                  ),
                                ),
                                SizedBox(height: 1.5.h),
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AutoSizeText(
                                        "0${mockInteger(1, 5)}: ${mockInteger(10, 59)}",
                                        style: TextStyle(
                                            fontSize: 12.w,
                                            fontFamily: 'BrunoAceSC'),
                                        minFontSize: 6,
                                        maxLines: 1,
                                        maxFontSize: 9,
                                      ),
                                      if (index == 0)
                                        SizedBox(
                                          width: 12.w,
                                          child: const TrophyRank(),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                ),
              ),*/
              StaggeredGridTile.count(
                  crossAxisCellCount: 20,
                  mainAxisCellCount: 6,
                  child: Container(
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: LayoutBuilder(
                      builder: (_, p2) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            flex: 2,
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              minVerticalPadding: 0,
                              dense: true,
                              isThreeLine: true,
                              title: Container(
                                height: p2.maxHeight * 0.25,
                                //color: Colors.red,
                                alignment: Alignment.centerLeft,
                                child: FittedBox(
                                  child: AutoSizeText(
                                    "${mockInteger(3, 10)} players today so far..",
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white60, fontSize: 72,
                                      //decorationThickness: 40,
                                    ),
                                  ),
                                ),
                              ),
                              subtitle: Column(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: p2.maxHeight * 0.5,
                                    color: Colors.amber,
                                    alignment: Alignment.topLeft,
                                    child: FittedBox(
                                      child: AutoSizeText(
                                        "${mockInteger(1, 5)} : ${mockInteger(10, 59)}",
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontFamily: 'BrunoAceSC',
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 500),
                                  height: p2.maxHeight * 0.8,
                                  left: -p2.maxWidth * 0.05,
                                  bottom: p2.maxHeight * 0.1,
                                  width: p2.maxWidth * 0.4,
                                  child: CircleAvatar(
                                    radius: p2.maxHeight,
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class _BestRecordList extends StatelessWidget {
  const _BestRecordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: p1.maxHeight * 0.1,
            child: const FittedBox(
              child: Text(
                "Best Scores",
                style: TextStyle(fontFamily: 'AbrilFatface'),
              ),
            ),
          ),
          const Space10(),
          Expanded(
            child: ListView(
              children: List.generate(
                3,
                (index) => Container(
                  decoration: BoxDecoration(
                    //color: const Color(0xff1f2232),
                    borderRadius: BorderRadius.circular(p1.maxWidth * 0.015),
                  ),
                  margin: EdgeInsets.only(bottom: p1.maxHeight * 0.025),
                  height: p1.maxHeight * (index == 0 ? 0.172 : 0.125),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    leading: const CircleAvatar(),
                    title: Container(
                      //color: Colors.red,
                      width: p1.maxWidth * 0.4,
                      alignment: Alignment.centerLeft,
                      height: p1.maxHeight * 0.08,
                      margin: EdgeInsets.only(right: p1.maxWidth * 0.1),
                      child: FittedBox(
                        child: AutoSizeText(
                          myRandomName(),
                          maxLines: 1,
                          style: const TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    horizontalTitleGap: p1.maxWidth * 0.02,
                    trailing: SizedBox(
                      //color: Colors.teal,
                      width: p1.maxWidth * 0.3,
                      height: p1.maxHeight * 0.08,
                      child: const FittedBox(
                        child: AutoSizeText(
                          "03:34",
                          style: TextStyle(fontFamily: 'BrunoAceSC'),
                        ),
                      ),
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

class _BestRecordList6 extends StatelessWidget {
  const _BestRecordList6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: p1.maxHeight * 0.1,
            child: const FittedBox(
              child: Text(
                "Best Scores",
                style: TextStyle(fontFamily: 'AbrilFatface'),
              ),
            ),
          ),
          Space10(),
          Expanded(
            child: ListView(
              children: List.generate(
                3,
                (index) => Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff1f2232),
                    borderRadius: BorderRadius.circular(p1.maxWidth * 0.015),
                  ),
                  margin: EdgeInsets.only(bottom: p1.maxHeight * 0.02),
                  height: p1.maxHeight * (index == 0 ? 0.21 : 0.2),
                  child: LayoutBuilder(
                    builder: (_, p2) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                height: p2.maxHeight,
                                left: -p2.maxWidth * 0.05,
                                bottom: -p2.maxHeight * 0.075,
                                width: p2.maxWidth * 0.4,
                                child: CircleAvatar(
                                  radius: p2.maxHeight,
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
                          child: ListTile(
                            dense: true,
                            // isThreeLine: true,
                            contentPadding: EdgeInsets.only(
                              left: p1.maxWidth * 0.035,
                              right: p1.maxWidth * 0.05,
                            ),
                            // minVerticalPadding: 8,
                            title: SizedBox(
                              height: p2.maxHeight * 0.45,
                              child: FittedBox(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  myRandomName(),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xfffde8e9),
                                  ),
                                ),
                              ),
                            ),
                            // subtitle:
                            //     AutoSizeText("${mockInteger(1, 30)}"),
                            trailing: SizedBox(
                              height: p2.maxHeight * 0.4,
                              width: p2.maxWidth * 0.25,
                              child: FittedBox(
                                child: AutoSizeText(
                                  "0${mockInteger(1, 5)}"
                                  ":${mockInteger(10, 59)}",
                                  style:
                                      const TextStyle(fontFamily: 'BrunoAceSC'),
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
            ),
          )
        ],
      ),
    );
  }
}

class _BestRecordList2 extends StatelessWidget {
  const _BestRecordList2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, p1) => Column(
        children: [
          SizedBox(
            height: p1.maxHeight * 0.075,
            child: const FittedBox(
              child: AutoSizeText(
                "Best Scores Overall..",
                style: TextStyle(
                  fontFamily: 'LilitaOne',
                  color: Color(0xff1f2232),
                ),
              ),
            ),
          ),
          const Space10(),
          Expanded(
            child: ListView(
              children: List.generate(
                4,
                (index) => Container(
                  height: p1.maxHeight * 0.18,
                  decoration: BoxDecoration(
                    color: index == 2
                        ? const Color(0xff846c5b)
                        : index <= 2
                            ? const Color(0xffF5E960)
                            : null,
                    borderRadius: BorderRadius.circular(p1.maxWidth * 0.015),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: p1.maxHeight * 0.02),
                  padding: EdgeInsets.all(p1.maxWidth * 0.02),
                  child: Row(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: RandomAvatar(mockString()),
                      ),
                      SizedBox(width: p1.maxWidth * 0.05),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: p1.maxHeight * 0.015,
                            top: p1.maxHeight * 0.015,
                            right: p1.maxWidth * 0.02,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 5,
                                child: FittedBox(
                                  child: AutoSizeText(
                                    myRandomName(),
                                    style: const TextStyle(
                                        // fontWeight: FontWeight.w100,
                                        ),
                                  ),
                                ),
                              ),
                              SizedBox(height: p1.maxHeight * 0.0025),
                              Flexible(
                                flex: 7,
                                child: FittedBox(
                                  child: AutoSizeText.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "0${mockInteger(1, 5)}:"
                                              "${mockInteger(10, 59)}",
                                        ),
                                        TextSpan(
                                          text:
                                              "  -${mockInteger(1, 30)} Sep, 2023",
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        )
                                      ],
                                    ),
                                    style: const TextStyle(
                                      fontFamily: 'BrunoAceSC',
                                      //letterSpacing: 1,
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
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BestRecordList1 extends StatelessWidget {
  const _BestRecordList1();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, p1) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.w),
          border: Border.all(width: .3.w),
        ),
        margin: EdgeInsets.only(bottom: p1.maxHeight * 0.025),
        padding: EdgeInsets.all(6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: p1.maxHeight * 0.075,
              child: const FittedBox(
                child: AutoSizeText(
                  "Best Scores Overall..",
                  style: TextStyle(
                    fontFamily: 'LilitaOne',
                    color: Color(0xff1f2232),
                  ),
                ),
              ),
            ),
            const Space10(),
            Expanded(
                child: ListView(
              children: List.generate(
                6,
                (index) => Container(
                  height: p1.maxHeight * (index == 0 ? 0.225 : 0.2),
                  decoration: BoxDecoration(
                      color: index == 0
                          ? const Color(0xffFFE101)
                          : index == 1
                              ? const Color(0xffD7D7D7)
                              : index == 2
                                  ? const Color(0xffA77044)
                                  : const Color(0xffe3bac6),
                      borderRadius: BorderRadius.circular(p1.maxWidth * 0.015)),
                  margin: EdgeInsets.only(
                    bottom: p1.maxHeight * (index == 0 ? 0.05 : 0.02),
                  ),
                  // /alignment: Alignment.center,
                  child: LayoutBuilder(
                    builder: (_, p2) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                height: p2.maxHeight,
                                left: -p2.maxWidth * 0.075,
                                bottom: -p2.maxHeight * 0.075,
                                width: p2.maxWidth * 0.4,
                                child: CircleAvatar(
                                  radius: p2.maxHeight,
                                  backgroundColor: Colors.transparent,
                                  child: RandomAvatar(
                                    mockString(),
                                    trBackground: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 6,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(
                              top: p1.maxHeight * 0.01,
                              left: p1.maxWidth * 0.05,
                              right: p1.maxWidth * 0.05,
                            ),
                            dense: true,
                            isThreeLine: true,
                            title: Container(
                              height:
                                  p1.maxHeight * (index == 0 ? 0.075 : 0.07),
                              //color: Colors.red,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  FittedBox(
                                    child: AutoSizeText(
                                      "${mockInteger(1, 5)}:${mockInteger(10, 59)}",
                                      style: TextStyle(
                                        fontFamily: 'BrunoAceSC',
                                        // fontWeight: FontWeight.bold,
                                        color: index == 0
                                            ? Colors.brown
                                            : index == 1
                                                ? Colors.black87
                                                : index == 2
                                                    ? Colors.white
                                                    : Colors.deepPurpleAccent
                                                        .shade700,
                                        fontSize: 72,
                                        //decorationThickness: 40,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Container(
                              margin: EdgeInsets.only(top: p1.maxHeight * 0.01),
                              height:
                                  p1.maxHeight * (index == 0 ? 0.0575 : 0.057),
                              alignment: Alignment.centerLeft,
                              child: FittedBox(
                                child: AutoSizeText(
                                  myRandomName(),
                                  style: TextStyle(
                                    color: index == 0
                                        ? Colors.brown
                                        : index == 1
                                            ? Colors.black87
                                            : index == 2
                                                ? Colors.white
                                                : Colors
                                                    .deepPurpleAccent.shade700,
                                    fontFamily: 'Poppins',
                                    fontWeight: index <= 2
                                        ? FontWeight.bold
                                        : FontWeight.w100,
                                  ),
                                ),
                              ),
                            ),
                            trailing: SizedBox(
                              height: p1.maxHeight * 0.075,
                              child: FittedBox(child: Text("# ${index + 1}")),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
          ],
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
      onPressed: () => context.router.push(const TournamentRoute()),
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: const FittedBox(
          child: AutoSizeText(
            "Play Tournament",
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}

class _HowManyNewPlayers extends StatelessWidget {
  const _HowManyNewPlayers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, p1) => Container(
        decoration: BoxDecoration(
          color: const Color(0xff1B998B),
          borderRadius: BorderRadius.circular(p1.maxWidth * 0.025),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(3.w),
        // margin: EdgeInsets.only(bottom: 6.h),
        child: LayoutBuilder(
          builder: (context, p1) => const Stack(
            children: [],
          ),
        ),
      ),
    );
  }
}
