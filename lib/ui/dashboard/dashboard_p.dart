import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          title: SizedBox(height: 100.h, child: const _DashboardHeaderTitle()),
          flexibleSpace: const FlexibleSpaceBar(title: _DashboardLogo()),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 9.h, left: 6.w),
            child: Text(
              "Players",
              style: TextStyle(
                fontSize: 24.h,
                fontFamily: 'Cabin',
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
        const SliverToBoxAdapter(child: _DailyTournamentBoard()),
        SliverToBoxAdapter(
          child: Container(
            height: 168.h,
            margin: EdgeInsets.only(
              left: 10.w,
              top: 12.h,
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
                      fontWeight: FontWeight.w900,
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
                          text: ": ${mockInteger(10, 59)}",
                          style: TextStyle(fontSize: p1.maxWidth * 0.075)),
                    ],
                  ),
                  style: const TextStyle(
                    fontFamily: 'LilitaOne',
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
                text: "Top\nWinners\n",
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
  const _HighScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.w,
      margin: EdgeInsets.only(right: 9.w, left: 3.w),
      decoration: BoxDecoration(
        color: const Color(0xff1F0322),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(9.w),
          bottomRight: Radius.circular(3.w),
          bottomLeft: Radius.circular(3.w),
          topLeft: Radius.circular(3.w),
        ),
        border: Border.all(width: .3.w),
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
          return Column(
            children: [
              const Spacer(flex: 3),
              Flexible(
                child: AnimatedOpacity(
                  opacity: aR < 0.2 ? 0.1 : aR + 0.3,
                  duration: const Duration(milliseconds: 100),
                  child: const FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 1,
                    child: FittedBox(fit: BoxFit.fitWidth, child: MyLogo()),
                  ),
                ),
              ),
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
                  height: p1.maxHeight * 0.375,
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    child: AutoSizeText(
                      myRandomName(),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white70,
                        fontSize: 72,
                      ),
                    ),
                  ),
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(top: 3.h),
                  height: p1.maxHeight * 0.2,
                  alignment: Alignment.centerLeft,
                  child: const FittedBox(
                    child: AutoSizeText(
                      "Hope you had a great day",
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w100,
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
  const _DailyTournamentBoard();

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
      child: DefaultTabController(
        length: 8,
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
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w900,
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
            SizedBox(height: 3.h),
            Flexible(
              flex: 3,
              child: Container(),
              /*   child: Container(
                color: Colors.amber,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(3.w),
                child: LayoutBuilder(
                  builder: (context, p1) => ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      10,
                      (index) => index == 0
                          ? Container(
                              width: p1.maxWidth * 0.12,
                              margin: EdgeInsets.only(right: 10.w),
                              child: const FittedBox(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText("Today"),
                              ),
                            )
                          : Container(
                              width: p1.maxWidth * 0.12,

                              margin: EdgeInsets.only(right: 15.w),
                              //color: Colors.red,
                              child: FittedBox(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText("July ${17 - index}"),
                              ),
                            ),
                    ),
                  ),
                ),
              ),*/
            ),
            Flexible(
              flex: 4,
              child: Container(
                  //color: Colors.orange.shade50,
                  ),
            ),
            Flexible(
              flex: 16,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _HighScore(),
                  _HighScore(),
                  _HighScore(),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                  //color: Colors.blue.shade50,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
