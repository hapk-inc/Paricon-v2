import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/my_widgets/trophy_rank.dart';
import 'package:paricon/routes/my_route.dart';

import 'package:awesome_bookmark_icon_button/awesome_bookmark_icon_button.dart';

import '../../my_widgets/my_list_tile.dart';
import '../../my_widgets/my_logo.dart';
import '../../my_widgets/my_names.dart';
import 'package:random_avatar/random_avatar.dart';

class DashboardP extends ConsumerStatefulWidget {
  const DashboardP({super.key});

  @override
  ConsumerState createState() => _DashboardPState();
}

class _DashboardPState extends ConsumerState<DashboardP> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 210.h,
          collapsedHeight: 100.h,
          toolbarHeight: 100.h,
          leadingWidth: 0,
          elevation: 8,
          centerTitle: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.w),
              bottomRight: Radius.circular(15.w),
            ),
          ),
          title: SizedBox(height: 99.h, child: const _DashboardHeaderTitle()),
          flexibleSpace: const FlexibleSpaceBar(title: _DashboardLogo()),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 9.h, left: 6.w),
            child: Text(
              "Recently Played",
              style: TextStyle(
                fontSize: 21.h,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 6.h)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 105.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(top: 9.h, left: 9.w),
              children: List.generate(
                10,
                (index) => const _PlayerListTile(),
              ),
            ),
          ),
        ),
        //const SliverToBoxAdapter(child: _DailyTournamentBoard()),
        SliverToBoxAdapter(
          child: Container(
            height: 168.h,
            margin: EdgeInsets.only(
              left: 10.w,
              // top: 6.h,
              right: 3.w,
            ),
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              //color: const Color(0xff721817),
              //color: const Color(0xfffff7ae),
              color: const Color(0xffEDF2F4),
              borderRadius: BorderRadius.circular(3.w),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 3.h),
              children: const [
                _TopWinnersTile(),
                _TopWinnerPlayerTile(),
                _TopWinnerPlayerTile(),
                _TopWinnerPlayerTile(),
                _TopWinnerPlayerTile(),
                _TopWinnerPlayerTile(),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 15.h)),

        SliverToBoxAdapter(
          child: Container(
            height: 45.h,
            margin: EdgeInsets.symmetric(horizontal: 9.w),
            child: ElevatedButton(
              onPressed: () => context.router.push(const TournamentRoute()),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xff292F36)),
              ),
              child: const Text(
                "Click here to play tournament",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFBF9FF)),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 15.h)),

        SliverToBoxAdapter(
          child: Container(
            height: 330.h,
            color: const Color(0xffceeddb),
            child: LayoutBuilder(
              builder: (context, p1) => DataTable(
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
                    label: SizedBox(
                      //color: Colors.red,
                      width: p1.maxWidth * 0.275,
                      child: const Text('NAME', textAlign: TextAlign.center),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      //color: Colors.blue,
                      width: p1.maxWidth * 0.125,
                      child: const Text(
                        'RANK',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: p1.maxWidth * 0.25,
                      //color: Colors.amber,
                      child: const FittedBox(
                        child: AutoSizeText(
                          'SUBMITTED ON',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: p1.maxWidth * 0.2,
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
                              "July 22, 12:30 PM",
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
                                        style: TextStyle(
                                            fontSize: p1.maxWidth * 0.02)),
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
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 15.h)),
        SliverToBoxAdapter(
          child: Container(
            height: 150.h,
            margin: EdgeInsets.symmetric(horizontal: 9.w),
            decoration: BoxDecoration(
              //color: const Color(0xff957FEF),
              //color: const Color(0xff938274),
              //color: const Color(0xffD88373),
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
                                    color: Color(0xff18206F)),
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
        SliverToBoxAdapter(child: SizedBox(height: 15.h)),
        /*SliverToBoxAdapter(
          child: Container(
            height: 150.h,
            margin: EdgeInsets.symmetric(horizontal: 6.w),
            decoration: BoxDecoration(
              //color: const Color(0xff957FEF),
              //color: const Color(0xff938274),
              //color: const Color(0xffD88373),
              //color: const Color(0xffa3d9ff),
              color: const Color(0xffEAE0CC),
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
                                  color: const Color(0xffA0A083),
                                ),
                              ),
                              TextSpan(
                                text: "Friends",
                                style: TextStyle(
                                  fontSize: p1.maxWidth * 0.05,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Montserrat',
                                  color: const Color(0xff798478),
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
        ),*/

        /*SliverToBoxAdapter(
            child: SizedBox(height: 60.h, child: _WelcomeUser())),
        SliverToBoxAdapter(
            child: SizedBox(height: 60.h, child: _WelcomeUser())),
        SliverToBoxAdapter(
            child: SizedBox(height: 60.h, child: _WelcomeUser())),
        SliverToBoxAdapter(
            child: SizedBox(height: 60.h, child: _WelcomeUser())),
        SliverToBoxAdapter(
            child: SizedBox(height: 60.h, child: _WelcomeUser())),*/

        /*  SliverToBoxAdapter(
          child: Container(
            height: 135.h,
            margin: EdgeInsets.symmetric(horizontal: 6.w),
            decoration: BoxDecoration(
              //color: const Color(0xff957FEF),
              //color: const Color(0xff938274),
              color: const Color(0xff292F36),
              borderRadius: BorderRadius.circular(6.w),
            ),
            padding: EdgeInsets.all(6.w),
          ),
        ),*/

        // sliver items 1
        /* SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20,
              right: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.deepPurple[400],
                height: 150,
              ),
            ),
          ),
        ),*/
      ],
    );
  }
}

class _WelcomeUser extends StatelessWidget {
  const _WelcomeUser();

  @override
  Widget build(BuildContext context) => Container(
        // color: Colors.red,
        height: 60.h,
        padding: EdgeInsets.only(right: 12.w),
        child: LayoutBuilder(
          builder: (_, p1) => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      height: p1.maxHeight * 0.9,
                      left: -p1.maxWidth * 0.1,
                      bottom: -p1.maxHeight * 0.07,
                      //bottom: -p1.maxHeight * 0.075,
                      width: p1.maxWidth * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          radius: p1.maxHeight,
                          backgroundColor: Colors.transparent,
                          child: RandomAvatar(mockString()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 8,
                child: Center(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 30.w,
                    minVerticalPadding: 0,
                    title: Container(
                      height: 24.h,
                      alignment: Alignment.bottomLeft,
                      child: FittedBox(
                        child: AutoSizeText(
                          _randomWelcomeText(myRandomName(), ""),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xff1f2232),
                            //decorationThickness: 40,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ),
                    subtitle: Container(
                      height: 15.h,
                      margin: EdgeInsets.only(top: 3.h),
                      //color: Colors.amber,
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        child: AutoSizeText(
                          "Today at ${mockInteger(1, 12)}: ${mockInteger(10, 59)} pm",
                          style: const TextStyle(
                            color: Color(0xff1f2232),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w100,
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
      );

  String _randomWelcomeText(String a, String d) => [
        "Hey there, $a! Good to see you!",
        "Look who's here! $a, welcome!",
        "$a, you've arrived! Excellent!",
        //"$a, welcome aboard! We're thrilled to have you.",
        //"Step right in, $a. We've been waiting for you. Welcome!"
      ][mockInteger(0, 2)];
}

class _TopWinnerPlayerTile extends StatelessWidget {
  const _TopWinnerPlayerTile();

  @override
  Widget build(BuildContext context) => Container(
        width: 180.w,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
        decoration: BoxDecoration(
            //color: const Color(0xffff0022),
            //color: const Color(0xff7B0828),
            color: const Color(0xffe63946),
            borderRadius: BorderRadius.circular(6.w)),
        child: LayoutBuilder(
          builder: (_, p1) => Stack(
            fit: StackFit.passthrough,
            children: [
              Positioned(
                top: -p1.maxWidth * 0.075,
                right: 0,
                child: BookMarkIconButton(
                  isSaved: true,
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                ),
              ),
              Positioned(
                top: -p1.maxWidth * 0.02,
                left: -p1.maxWidth * 0.05,
                width: p1.maxWidth * 0.5,
                height: p1.maxHeight * 0.5,
                child: CircleAvatar(
                  backgroundColor: const Color(0xffEDF2F4),
                  child: RandomAvatar(mockString(),
                      trBackground: true, height: p1.maxHeight * 0.5),
                ),
              ),
              Positioned(
                width: p1.maxWidth * 0.5,
                height: p1.maxHeight * 0.2,
                top: p1.maxHeight * 0.25,
                right: p1.maxWidth * 0.05,
                child: FittedBox(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    myRandomName(option: 'female'),
                    style: const TextStyle(
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: p1.maxHeight * 0.5,
                height: p1.maxHeight * 0.1375,
                left: p1.maxWidth * 0.05,
                right: p1.maxWidth * 0.05,
                child: FittedBox(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    "${mockInteger(1, 100)} Games ; ${mockInteger(1, 30)} wins",
                    style: const TextStyle(fontWeight: FontWeight.w100),
                  ),
                ),
              ),
              Positioned(
                height: p1.maxHeight * 0.3,
                bottom: p1.maxHeight * 0.05,
                left: p1.maxWidth * 0.05,
                child: AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "0${mockInteger(1, 5)}:${mockInteger(10, 59)}"),
                      TextSpan(
                          text: ":${mockInteger(10, 59)}",
                          style: TextStyle(fontSize: p1.maxWidth * 0.075)),
                    ],
                  ),
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1f271b),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}

class _TopWinnersTile extends StatelessWidget {
  const _TopWinnersTile();

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(right: 15.w),
        alignment: Alignment.centerLeft,
        child: const AutoSizeText.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Top\nPlayers\n",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                ),
              ),
              TextSpan(
                text: "Best scores",
                style: TextStyle(
                  fontFamily: 'Cabin',
                  color: Color(0xffD80032),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: " this season",
                style: TextStyle(
                  fontFamily: 'Cabin',
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
            style: TextStyle(color: Color(0xff2B2D42)),
          ),
        ),
      );
}

class _PlayerListTile extends StatelessWidget {
  const _PlayerListTile();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.925,
      child: LayoutBuilder(
        builder: (context, p1) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 4,
              child: CircleAvatar(
                radius: p1.maxWidth * 0.375,
                backgroundColor: const Color(0xff724cf9),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff724cf9),
                    borderRadius: BorderRadius.circular(p1.maxWidth * 0.12),
                  ),
                  padding: EdgeInsets.only(top: p1.maxHeight * 0.05),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        bottom: -p1.maxHeight * 0.075,
                        height: p1.maxHeight * 0.75,
                        width: p1.maxWidth * 0.84,
                        left: -p1.maxWidth * 0.05,
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
            SizedBox(height: 3.h),
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 1,
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
            const Space10(),
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

class _DashboardLogo extends StatelessWidget {
  const _DashboardLogo();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, p1) {
          double aR = p1.maxHeight / p1.maxWidth;
          print(aR);
          double x = aR < 0.4 ? 0.1 : aR + 0.3;
          return Column(
            children: [
              const Spacer(flex: 3),
              Flexible(
                child: AnimatedOpacity(
                  opacity: x >= 0.0 && x <= 1.0 ? x : 1,
                  duration: const Duration(milliseconds: 100),
                  child: const FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 1,
                    child: FittedBox(fit: BoxFit.fitWidth, child: MyLogo()),
                  ),
                ),
              ),
              SizedBox(height: p1.maxHeight * 0.05)
            ],
          );
        },
      );
}

class _DashboardHeaderTitle extends StatelessWidget {
  const _DashboardHeaderTitle();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, p1) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    height: p1.maxHeight * 0.8,
                    left: -p1.maxWidth * 0.05,
                    bottom: p1.maxHeight * 0.1,
                    width: p1.maxWidth * 0.4,
                    child: CircleAvatar(
                      radius: p1.maxHeight * 0.9,
                      backgroundColor: Colors.transparent,
                      child: RandomAvatar(
                        mockString(),
                        trBackground: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                dense: true,
                title: Container(
                  height: p1.maxHeight * 0.3,
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    child: AutoSizeText(
                      myRandomName(),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                        fontSize: 72,
                      ),
                    ),
                  ),
                ),
                subtitle: Container(
                  // margin: EdgeInsets.only(top: 3.h),
                  height: p1.maxHeight * 0.2,
                  alignment: Alignment.centerLeft,
                  child: const FittedBox(
                    child: AutoSizeText(
                      "Hope you had a great day",
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
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

class _DailyTournamentBoard extends StatelessWidget {
  const _DailyTournamentBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330.h,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
      decoration: const BoxDecoration(
        color: Color(0xfffde8e9),
        //borderRadius: BorderRadius.circular(10.w),
      ),
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _THeader(),
          _TTile3(),
          _TTile3(),
          //_TTile3(),
        ],
      ),
    );
  }
}

class _TTile3 extends StatelessWidget {
  const _TTile3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69.h,
      padding: EdgeInsets.all(6.w),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xfffbf9ff),
        borderRadius: BorderRadius.circular(6.w),
      ),
      child: LayoutBuilder(
        builder: (context, p1) => Row(
          children: [
            CircleAvatar(
              child: RandomAvatar(mockString()),
            ),
            SizedBox(width: p1.maxWidth * 0.05),
            Container(
              width: p1.maxWidth * 0.6,
              //color: Colors.indigo.shade50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      heightFactor: 0.9,
                      //alignment: Alignment.centerLeft,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: toBeginningOfSentenceCase(
                                          myRandomName()) ??
                                      ""),
                              TextSpan(
                                text: " #${mockInteger(111111, 999999)}",
                                style: TextStyle(
                                  fontSize: p1.maxWidth * 0.05,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ],
                          ),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            color: Color(0xff5b507a),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: p1.maxHeight * 0.05),
                  Flexible(
                    child: FractionallySizedBox(
                      heightFactor: 1,
                      widthFactor: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            flex: 3,
                            child: FittedBox(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "0${mockInteger(1, 5)}:"
                                            "${mockInteger(10, 59)}"),
                                    TextSpan(
                                      text: ": ${mockInteger(100, 500)}",
                                      style: TextStyle(
                                          fontSize: p1.maxWidth * 0.05),
                                    ),
                                  ],
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5b618a),
                                  //fontSize: p1.maxWidth * 0.1,
                                ),
                              ),
                            ),
                          ),
                          if (mockInteger(0, 1) == 0)
                            Container(
                              height: p1.maxHeight * 0.32,
                              decoration: BoxDecoration(
                                color: const Color(0xff1f271b),
                                borderRadius:
                                    BorderRadius.circular(p1.maxWidth * 0.0075),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: p1.maxWidth * 0.0175),
                              margin: EdgeInsets.only(left: p1.maxWidth * 0.02),
                              child: const FittedBox(
                                child: AutoSizeText(
                                  "New",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                            ),
                          if (mockInteger(0, 1) == 0)
                            Container(
                              height: p1.maxHeight * 0.32,
                              decoration: BoxDecoration(
                                color: const Color(0xff1f271b),
                                borderRadius:
                                    BorderRadius.circular(p1.maxWidth * 0.005),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: p1.maxWidth * 0.02,
                                vertical: p1.maxHeight * 0.02,
                              ),
                              margin: EdgeInsets.only(left: p1.maxWidth * 0.02),
                              child: const FittedBox(
                                child: AutoSizeText(
                                  "Best Record",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                  ),
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
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: AutoSizeText.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: "#",
                        style: TextStyle(fontSize: p1.maxWidth * 0.043)),
                    TextSpan(text: "0${mockInteger(1, 9)}"),
                  ]),
                  style: TextStyle(
                    fontSize: p1.maxWidth * 0.05,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Cabin',
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

class _TTile2 extends StatelessWidget {
  const _TTile2();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(bottom: 15.h),
      color: const Color(0xfffbf9ff),
      child: LayoutBuilder(
        builder: (_, p1) => Padding(
          padding: EdgeInsets.all(p1.maxWidth * 0.01),
          child: Stack(
            children: [
              Positioned(
                width: p1.maxWidth * 0.3,
                height: p1.maxHeight * 0.8,
                left: p1.maxWidth * 0.02,
                bottom: 0,
                child: Container(
                  //color: Colors.green,
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    child: AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "0${mockInteger(1, 5)}:"
                                  "${mockInteger(10, 59)}"),
                          TextSpan(
                            text: " : ${mockInteger(100, 500)}\n",
                            style: TextStyle(fontSize: p1.maxWidth * 0.035),
                          ),
                          TextSpan(
                            text: "5 minutes ago",
                            style: TextStyle(
                              fontSize: p1.maxWidth * 0.025,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w100,
                            ),
                          )
                        ],
                      ),
                      style: TextStyle(
                          fontFamily: 'Cabin',
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff1f271b),
                          fontSize: p1.maxWidth * 0.075),
                    ),
                  ),
                ),
              ),
              Positioned(
                width: p1.maxWidth * 0.2,
                height: p1.maxHeight,
                right: 0,
                child: RandomAvatar(mockString(), trBackground: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TTile extends StatelessWidget {
  const _TTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(bottom: 15.h),
      color: const Color(0xfffbf9ff),
      child: LayoutBuilder(
        builder: (_, p1) => Padding(
          padding: EdgeInsets.all(p1.maxWidth * 0.01),
          child: Stack(
            children: [
              Positioned(
                width: p1.maxWidth * 0.3,
                height: p1.maxHeight * 0.8,
                left: p1.maxWidth * 0.02,
                bottom: 0,
                child: Container(
                  //color: Colors.green,
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    child: AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${mockInteger(1, 5)}:"
                                " ${mockInteger(10, 59)}",
                          ),
                          TextSpan(
                            text: " :${mockInteger(100, 500)}\n",
                            style: TextStyle(
                              fontSize: p1.maxWidth * 0.035,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "5 minutes ago",
                            style: TextStyle(
                              fontSize: p1.maxWidth * 0.025,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w100,
                            ),
                          )
                        ],
                      ),
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff1f271b),
                          fontSize: p1.maxWidth * 0.06),
                    ),
                  ),
                ),
              ),
              Positioned(
                width: p1.maxWidth * 0.2,
                height: p1.maxHeight,
                right: 0,
                child: RandomAvatar(mockString(), trBackground: true),
              ),
              Positioned(
                left: p1.maxWidth * 0.375,
                width: p1.maxWidth * 0.45,
                height: p1.maxHeight * 0.45,
                top: p1.maxHeight * 0.175,
                child: Container(
                  //color: Colors.green,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: myRandomName()),
                          TextSpan(
                            text: " #${mockInteger(11111, 99999)}",
                            style: TextStyle(
                              fontSize: p1.maxWidth * 0.05,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
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

class _THeader extends StatelessWidget {
  const _THeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: 40.h,
      margin: EdgeInsets.only(right: 12.w, bottom: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "July 19, 2023",
            style: TextStyle(
              fontSize: 18.h,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 42.h,
            width: 162.w,
            child: ElevatedButton(
              onPressed: () => context.router.push(const TournamentRoute()),
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
                ),
                backgroundColor:
                    const MaterialStatePropertyAll(Color(0xff393A10)),
              ),
              child: const FittedBox(
                child: AutoSizeText(
                  "Play Today Tournament",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DailyTournamentBoard4 extends StatelessWidget {
  const _DailyTournamentBoard4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 414.h,
      decoration: BoxDecoration(
        color: const Color(0xfffde8e9),
        borderRadius: BorderRadius.circular(10.w),
      ),
      margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: 12.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.w),
        child: Column(
          children: [
            Flexible(
              child: Container(
                color: const Color(0xff5b618a),
                padding: EdgeInsets.all(6.w),
                child: Row(
                  children: [
                    const AspectRatio(aspectRatio: 1, child: TrophyRank()),
                    SizedBox(width: 6.w),
                    const Flexible(
                      flex: 3,
                      child: FractionallySizedBox(
                        widthFactor: 0.9,
                        heightFactor: 0.8,
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            "Daily Tournament",
                            style: TextStyle(color: Color(0xfffbf9ff)),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      flex: 2,
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        heightFactor: 0.8,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                              /*backgroundColor: MaterialStatePropertyAll(
                              Color(0xff5b507a),
                            ),*/
                              ),
                          child: FittedBox(child: const Text("Play Now")),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class _DailyTournamentBoard3 extends StatelessWidget {
  const _DailyTournamentBoard3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.h,
      padding: EdgeInsets.all(9.w),
      margin: EdgeInsets.symmetric(vertical: 9.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: const Color(0xfffde8e9),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.w, top: 6.h, right: 6.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: SizedBox.square(
                          dimension: 24.h,
                          child: const TrophyRank(),
                        ),
                      ),
                      TextSpan(
                        text: "Daily\nTournament",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 30.h,
                          fontWeight: FontWeight.w100,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 33.h,
                  width: 90.w,
                  child: ElevatedButton(
                    onPressed: () =>
                        context.router.push(const TournamentRoute()),
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 18.w),
                      ),
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xff393A10)),
                    ),
                    child: const FittedBox(
                      child: AutoSizeText(
                        "Play Now",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                //color: Colors.black,
                ),
          )
        ],
      ),
    );
  }
}

class _DailyTournamentBoard2 extends StatelessWidget {
  const _DailyTournamentBoard2();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(9.w),
      padding: EdgeInsets.all(6.w),
      height: 300.h,
      decoration: BoxDecoration(
        color: const Color(0xfffde8e9),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Column(
        children: [
          Flexible(
            flex: 5,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 6.h, bottom: 6.h, right: 3.w),
                  child: const TrophyRank(),
                ),
                const Flexible(
                  flex: 6,
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        "Daily Tournament",
                        maxLines: 1,
                        style: TextStyle(
                          //fontFamily: 'Poppins',
                          color: Color(0xff000807),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                Expanded(
                  flex: 4,
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 0.775,
                    child: ElevatedButton(
                      onPressed: () =>
                          context.router.push(const TournamentRoute()),
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 18.w),
                        ),
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xff393A10)),
                      ),
                      child: const FittedBox(
                        child: AutoSizeText(
                          "Play Now",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 6.h),
          Flexible(
            flex: 3,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: LayoutBuilder(
                builder: (context, p1) => GroupButton(
                  buttons: const [
                    "Today",
                    "17 July",
                    "16 July",
                    "15 July",
                    "14 July"
                  ],
                  options: GroupButtonOptions(
                    selectedTextStyle: TextStyle(
                      fontSize: p1.maxHeight * 0.5,
                      fontFamily: 'Cabin',
                    ),
                    unselectedTextStyle: TextStyle(
                      fontSize: p1.maxHeight * 0.5,
                      color: const Color(0xff1F0322),
                      fontFamily: 'Cabin',
                    ),
                    spacing: 0,
                    //textAlign: TextAlign.center,
                    textPadding: EdgeInsets.zero,
                    buttonHeight: p1.maxHeight,
                    buttonWidth: 69.w,
                    mainGroupAlignment: MainGroupAlignment.start,
                    groupRunAlignment: GroupRunAlignment.start,
                    //alignment: Alignment.centerLeft,
                    crossGroupAlignment: CrossGroupAlignment.start,
                    unselectedColor: Colors.transparent,
                    selectedColor: const Color(0xff1F0322),
                    borderRadius: BorderRadius.circular(p1.maxHeight * 0.2),
                  ),
                ),
              ),
            ),
          ),
          const Space20(),
          Flexible(
            flex: 18,
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: /*ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  /* _HighScore(tileColor: Color(0xff19647E)),
                  _HighScore(tileColor: Color(0xff5B618A)),
                  _HighScore(tileColor: Color(0xff3D2645)),
                  _HighScore(tileColor: Color(0xff8E6C88)),
                  _HighScore(tileColor: Color(0xff2E294E)),
                  _HighScore(tileColor: Color(0xffEAD637)),
                  _HighScore(tileColor: Color(0xffB26E63)),*/
                  //_HighScore(),
                  //_HighScore(),
                ],
              )*/
                  Container(),
            ),
          ),
          Spacer(),
          /*Flexible(
            flex: 2,
            child: Container(
                //color: Colors.orange.shade50,
                ),
          ),*/
          Flexible(
            flex: 2,
            child: FractionallySizedBox(
              widthFactor: 0.95,
              child: FittedBox(
                alignment: Alignment.centerRight,
                child: AutoSizeText(
                  "Last Updated by ${myRandomName()}",
                  style: const TextStyle(
                    color: Color(0xff011638),
                    fontWeight: FontWeight.w100,
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

/*Nobody participated in today's game. Join in and secure a comfortable victory.
There was no player in today's match. Step up and experience a straightforward win.
No one took part in today's play. Engage and relish a hassle-free triumph.
Today's game remained unplayed. Seize the opportunity for an effortless victory.
No individuals were involved in today's play.
 Take part and savor an uncomplicated win.*/
