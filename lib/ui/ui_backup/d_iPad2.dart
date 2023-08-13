import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../my_widgets/my_names.dart';

/*const List<String> _btnTitle = [
  "Play Tournament",
  "Create Game",
  "Enter Room Code"
];

const List<Color> _btnColor = [
  Color(0xffB07156),
  Color(0xff6ABEA7),
  Color(0xffFFa62B)
];
const List<Color> _btnIconColor = [
  Color(0xff533745),
  Color(0xff4C1C00),
  Color(0xff1A1B41)
];
List<Widget> _btnIcon = [
  Padding(
    padding: EdgeInsets.all(4.5.w),
    child: Lottie.asset('assets/trophy.json'),
  ),
  const Icon(
    FontAwesome.gamepad,
    color: Colors.white70,
  ),
  const Icon(Icons.pin, color: Color(0xff1a1b41)),
];*/

class DashboardIpad extends StatelessWidget {
  const DashboardIpad({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //color: Colors.red,
              height: 105.h,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 7.5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "${mockInteger(10, 100)}",
                              style: TextStyle(
                                fontSize: 36.sp,
                                color: const Color(0xff942911),
                              ),
                            ),
                            TextSpan(
                              text: " ${mockInteger(10, 50)}%",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: const Color(0xff9D8420),
                              ),
                            ),
                          ],
                        ),
                        style: const TextStyle(
                          fontFamily: 'LilitaOne',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        "Overall Players",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xff1A1B25),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: GroupButton(
                      buttons: const [
                        "EveryOne",
                        "My Friends",
                        //"My Friends",
                      ],
                      options: GroupButtonOptions(
                        buttonHeight: 30.h,
                        buttonWidth: 90.w,
                        spacing: 9.w,
                        runSpacing: 9.h,
                        elevation: 3,
                        unselectedColor: const Color(0xffedf2f4),
                        selectedColor: const Color(0xffa72608),
                        crossGroupAlignment: CrossGroupAlignment.start,
                        selectedTextStyle: TextStyle(
                          fontSize: 10.5.sp,
                          color: const Color(0xffedf2f4),
                        ),
                        unselectedTextStyle: TextStyle(
                            fontSize: 10.5.sp, color: const Color(0xff090c02)),
                        borderRadius: BorderRadius.circular(4.5.w),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 135.h,
              width: 360.w,
              //alignment: Alignment.centerLeft,
              //color: Colors.blue.shade100,
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 0.75,
                  //aspectRatio: 6,
                  enableInfiniteScroll: false,
                  initialPage: 2,

                  //autoPlay: true,
                  //autoPlayInterval: const Duration(seconds: 10),
                  //autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.15,
                  //enlargeFactor: 0.2,
                  disableCenter: true,
                  //onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
                items: [
                  _PlayTournamentCarouselTile1(),
                  const _PlayWithFriendTile()
                  //Container(color: Colors.red),
                  //Container(color: Colors.green),
                ],
              ),
            ),
            Container(
              height: 165.h,
              margin: EdgeInsets.symmetric(vertical: 15.h),
              //padding: EdgeInsets.symmetric(vertical: 7.5.h),
              decoration: BoxDecoration(
                color: const Color(0xffEDF2F4),
                borderRadius: BorderRadius.circular(3.w),
              ),
              child: ListView(
                //padding: EdgeInsets.all(6.w),
                scrollDirection: Axis.horizontal,
                children: [
                  const _TopPlayersTile(),
                  ...List.generate(2, (index) => const __PlayerCardTile())
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 7.5.h),
              padding: EdgeInsets.symmetric(horizontal: 7.5.w),
              child: Text(
                "Leaderboard",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const _DashboardLeaderBoard(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 7.5.h),
              padding: EdgeInsets.symmetric(horizontal: 7.5.w),
              child: Text(
                "Recently Played",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 7.5.h),
              height: 90.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 3.w, top: 3.h),
                children: List.generate(
                  10,
                  (index) => const _RecentPlayerTile(),
                ),
              ),
            ),
          ],
        ),
      );
}

class _PlayTournamentCarouselTile1 extends StatelessWidget {
  const _PlayTournamentCarouselTile1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.sp),
        color: const Color(0xfff7dafd),
      ),
      padding: EdgeInsets.all(3.sp),
      child: LayoutBuilder(
        builder: (_, p1) => Row(
          children: [
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 2,
                child: Lottie.asset(
                  'assets/tournament_trophies.json',
                  repeat: true,
                ),
              ),
            ),
            //SizedBox(width: 15.w),
            Flexible(
              flex: 2,
              child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 0.84,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 2,
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        heightFactor: 0.9,
                        child: FittedBox(
                          child: AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Play Open\n",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: p1.maxWidth * 0.018,
                                    color: const Color(0xff635380),
                                  ),
                                ),
                                TextSpan(
                                  text: "Tournament",
                                  style: TextStyle(
                                    fontSize: p1.maxWidth * 0.03,
                                    color: const Color(0xff49306B),
                                  ),
                                ),
                              ],
                              style: const TextStyle(
                                height: 1.35,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.54,
                        heightFactor: 0.81,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.zero),
                            side: MaterialStatePropertyAll(
                              BorderSide(
                                color: Color(0xff90708C),
                                width: 0.45,
                              ),
                            ),
                          ),
                          child: Text(
                            "Start Now",
                            maxLines: 1,
                            style: TextStyle(
                              color: const Color(0xff177E89),
                              fontFamily: 'Poppins',
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlayTournamentCarouselTile extends StatelessWidget {
  const _PlayTournamentCarouselTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.sp),
        color: const Color(0xfff7dafd),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${mockInteger(10, 100)}",
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: const Color(0xffed1c24),
                      ),
                    ),
                  ],
                ),
                style: const TextStyle(
                  fontFamily: 'LilitaOne',
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 3.h),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Games\n"),
                    TextSpan(text: "Played", style: TextStyle(fontSize: 12.sp)),
                  ],
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: const Color(0xff235789),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            ],
          ),
          VerticalDivider(
            color: const Color(0xff235789),
            width: 30.w,
            indent: 15.h,
            endIndent: 15.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 9.h),
                    child: Text(
                      "Play Tournament",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Poppins',
                        //fontWeight: FontWeight.bold,
                        color: const Color(0xff235789),
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 9.w, vertical: 15.h),
                        ),
                        backgroundColor: const MaterialStatePropertyAll(
                          Color(0xfff1d302),
                        ),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.sp))),
                        /* side: const MaterialStatePropertyAll(
                          BorderSide(color: Color(0xffEd1c24)),
                        ),*/
                      ),
                      child: Text(
                        "Start Now",
                        style: TextStyle(
                          fontSize: 10.5.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffEd1c24),
                        ),
                        maxLines: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class __PlayerCardTile extends StatelessWidget {
  const __PlayerCardTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.w,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      child: Card(
        color: [
          const Color(0xffa72608),
          const Color(0xff2d2d2a)
        ][mockInteger(0, 1)],
        child: Stack(
          children: [
            Positioned(
              bottom: -12.h,
              left: -0.w,
              // width: 99.w,
              child: RandomAvatar(
                mockString(),
                trBackground: true,
                width: 90.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OverallGames extends ConsumerWidget {
  const _OverallGames();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final int? tCount = ref.watch(tCountProvider).value;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffe54f6d),
        borderRadius: BorderRadius.circular(6),
      ),
      child: LayoutBuilder(
        builder: (_, p1) => Stack(
          children: [
            Positioned(
              width: p1.maxWidth * 0.9,
              top: p1.maxHeight * 0.05,
              left: p1.maxWidth * 0.05,
              height: p1.maxHeight * 0.6,
              child: Container(
                //color: Colors.teal,
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  "xxxx",
                  maxLines: 2,
                ),
              ),
            ),
            Positioned(
              height: p1.maxHeight * 0.3,
              bottom: p1.maxHeight * 0.1,
              right: p1.maxWidth * 0.075,
              width: p1.maxWidth * 0.5,
              child: ElevatedButton(onPressed: () {}, child: Text("Play")),
            )
          ],
        ),
      ),
    );
  }
}

class _PlayWithFriendTile extends StatelessWidget {
  const _PlayWithFriendTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 150.h,
      //margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: const Color(0xffa3d9ff),
        borderRadius: BorderRadius.circular(6.w),
      ),
      padding: EdgeInsets.all(6.w),
      child: LayoutBuilder(
        builder: (_, p1) => Row(
          children: [
            Flexible(
              child: Lottie.asset('assets/friends_joystick.json'),
            ),
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

class _GenVTile extends StatelessWidget {
  const _GenVTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 114.w,
      margin: EdgeInsets.symmetric(horizontal: 3.w),
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
                  /*     footer: Container(
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
                  ),*/
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      /* Positioned(
                        top: p1.maxHeight * 0.1,
                        left: p1.maxWidth * 0.075,
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
                      ),*/
                      Positioned(
                        top: -p1.maxWidth * 0.033,
                        width: p1.maxWidth * 0.99,
                        left: -p1.maxWidth * 0.03,
                        height: p1.maxHeight * 0.99,
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
        //width: 180.w,
        //color: Colors.red,
        margin: EdgeInsets.only(right: 9.w),
        padding: EdgeInsets.only(left: 9.w, top: 3.h, bottom: 3.h),
        alignment: Alignment.centerLeft,
        child: LayoutBuilder(
          builder: (_, p1) => AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "My\nCards\n",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    fontSize: 30.sp,
                    height: 1.2,
                  ),
                ),
                TextSpan(
                  text: "Make friends",
                  style: TextStyle(
                    color: const Color(0xffD80032),
                    fontSize: 12.sp,
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: " by collecting avatars",
                  style: TextStyle(
                    fontSize: 12.sp,
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
      width: 360.w,
      margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 7.5.h),
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
          dataRowMaxHeight: p1.maxHeight * 0.18,
          dataRowMinHeight: p1.maxHeight * 0.1,
          headingTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            color: const Color(0xff85baa1),
            fontWeight: FontWeight.w700,
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
                            radius: p1.maxWidth * 0.03,
                            child: RandomAvatar(mockString()),
                          ),
                          SizedBox(width: 6.w),
                          Expanded(
                            child: Text(
                              myRandomName(),
                              maxLines: 1,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
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
                        "August ${mockInteger(1, 30)}, 12:30 PM",
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
                      padding: EdgeInsets.all(4.5.w),
                      // alignment: Alignment.centerRight,
                      child: FittedBox(
                        child: AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "0${mockInteger(1, 5)}:"
                                      "${mockInteger(10, 59)}",
                                  style: TextStyle(fontSize: 7.5.sp)),
                              TextSpan(
                                text: ":${mockInteger(100, 599)}",
                                style: TextStyle(
                                  fontSize: 4.5.sp,
                                ),
                              ),
                            ],
                          ),
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
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

/* const _OverallGames(),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff8c1c13),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: 1 == 2
                        ? Container()
                        : LayoutBuilder(
                            builder: (_, p1) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  child: Stack(
                                    children: [
                                      AnimatedPositioned(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        height: p1.maxHeight,
                                        left: -p1.maxWidth * 0.05,
                                        bottom: -p1.maxHeight * 0.075,
                                        width: p1.maxWidth * 0.4,
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
                                  flex: 2,
                                  child: ListTile(
                                    contentPadding:
                                        EdgeInsets.only(right: 24.w),
                                    minVerticalPadding: 0,
                                    title: Container(
                                      height: 36.h,
                                      margin: EdgeInsets.only(bottom: 4.h),
                                      //color: Colors.red,
                                      alignment: Alignment.centerLeft,
                                      child: FittedBox(
                                        child: AutoSizeText.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(text: myRandomName()),
                                            ],
                                          ),
                                          style: const TextStyle(
                                            fontFamily: 'LilitaOne',
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xfffde8e9),
                                            fontSize: 48,
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
                                          "ID:222222",
                                          style: const TextStyle(
                                            color: Color(0xffbf4342),
                                            fontFamily: 'BrunoAceSC',
                                            fontWeight: FontWeight.w100,
                                            letterSpacing: 1,
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
                  //Container(color: Colors.green),
                  //Container(color: Colors.blue),*/
