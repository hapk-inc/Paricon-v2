import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/my_widgets/daily_challenge_score_tile.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../my_widgets/my_names.dart';
import 'package:random_avatar/random_avatar.dart';

import 'package:fl_chart/fl_chart.dart';

import '../../logic/auth.dart';
import '../../logic/s_size.dart';
import '../../model/my_user.dart';
import '../../my_widgets/my_list_tile.dart';
import '../../routes/my_route.dart';

class DashboardP5 extends StatelessWidget {
  const DashboardP5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const Space10(),
            SizedBox(
              height: 60.h,
              child: ButtonsTabBar(
                backgroundColor: const Color(0xff1f2232),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                labelStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.h,
                  color: const Color(0xfffde8e9),
                ),
                unselectedBackgroundColor: const Color(0xffe3bac6),
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.h,
                  color: const Color(0xffbc9ec1),
                ),
                tabs: const [
                  Tab(text: "Daily Tournament"),
                  Tab(text: "Top 10"),
                  Tab(text: "You"),
                ],
              ),
            ),
            const Space10(),
            SizedBox(
              height: 720.h,
              child: TabBarView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Container(
                          height: 175.h,
                          decoration: BoxDecoration(
                            color: const Color(0xffe54f6d),
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          child: LayoutBuilder(
                            builder: (p0, p1) => Stack(
                              children: [
                                Positioned(
                                  left: p1.maxWidth * 0.075,
                                  top: p1.maxHeight * 0.15,
                                  height: p1.maxHeight * 0.2,
                                  width: p1.maxWidth * 0.2,
                                  child: Container(
                                    //color: Colors.red,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        mockInteger(50, 500).toString(),
                                        style:
                                            TextStyle(fontFamily: 'BrunoAceSC'),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: p1.maxHeight * 0.45,
                                  left: p1.maxWidth * 0.075,
                                  height: p1.maxHeight * 0.1,
                                  width: p1.maxWidth * 0.4,
                                  child: const FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      "games played so far",
                                      style:
                                          TextStyle(fontFamily: 'BrunoAceSC'),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: p1.maxHeight * 0.1,
                                    left: p1.maxWidth * 0.075,
                                    height: p1.maxHeight * 0.25,
                                    width: p1.maxWidth * 0.9,
                                    child: const PlayTournamentButton()),
                                /*Positioned(
                                    right: p1.maxWidth * 0.02,
                                    top: p1.maxHeight * 0.05,
                                    width: p1.maxWidth * 0.4,
                                    height: p1.maxHeight * 0.5,
                                    child: Container(
                                      color: Colors.amber,
                                      child: LineChart(
                                        mainData(),
                                      ),
                                    ))*/
                              ],
                            ),
                          ),
                        ),
                        Space10(),
                        /*const Space10(),
                        const DashboardSubHeader(title: "Tournament Played"),
                        const Space10(),
                        */
                        Container(
                          height: 120.h,
                          //color: Colors.red,
                          alignment: Alignment.center,
                          child: const AvailablePlayerList(),
                        ),
                        Space10(),
                        //const Space20(),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.only(right: 8.w),
                            children: List.generate(
                              4,
                              (index) => SizedBox(
                                height: 80.h,
                                width: 300.w,
                                child: const DailyChallengeScoreTile(),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.red,
                    child: ListView(
                      padding: EdgeInsets.only(left: 4.w, right: 8.w),
                      children: List.generate(
                        12,
                        (index) => SizedBox(
                          height: 80.h,
                          child: DailyChallengeScoreTile(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 160.h,
                          decoration: BoxDecoration(
                              color: Color(0xffbc9ec1),
                              borderRadius: BorderRadius.circular(8.0)),
                          margin: EdgeInsets.all(8.sp),
                          child: MyListTile(
                              leading: RandomAvatar(mockString(),
                                  trBackground: true)),
                        ),
                        const Space10(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(fontSize: 20.h),
                            ),
                            Text(
                              "abc@gmail.com",
                              style: TextStyle(fontSize: 20.h),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      panel: Container(),
      minHeight: 0,
      maxHeight: 400.h,
    );
  }
}

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 1,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.primaries[mockInteger(0, 5)],
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.primaries[mockInteger(0, 5)],
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: leftTitleWidgets,
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d)),
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 3),
          FlSpot(2.6, 2),
          FlSpot(4.9, 5),
          FlSpot(6.8, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          FlSpot(11, 4),
        ],
        isCurved: true,
        gradient: LinearGradient(
          colors: Colors.primaries,
        ),
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: Colors.primaries
                .map((color) => color.withOpacity(0.3))
                .toList(),
          ),
        ),
      ),
    ],
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '10K';
      break;
    case 3:
      text = '30k';
      break;
    case 5:
      text = '50k';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  Widget text;
  switch (value.toInt()) {
    case 2:
      text = const Text('MAR', style: style);
      break;
    case 5:
      text = const Text('JUN', style: style);
      break;
    case 8:
      text = const Text('SEP', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

class DashboardP2 extends ConsumerWidget {
  const DashboardP2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 360.w,
            padding: const EdgeInsets.all(8.0),
            color: Colors.deepPurpleAccent.shade700,
            height: 175.h,
            child: LayoutBuilder(
              builder: (_, p1) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //color: Colors.white70,
                    padding:
                        EdgeInsets.symmetric(vertical: p1.maxHeight * 0.015),
                    height: p1.maxHeight * 0.25,
                    width: p1.maxWidth * 0.9,
                    child: Text(
                      "24 players played today",
                      style: TextStyle(
                        color: Colors.deepPurple.shade200,
                        fontSize: p1.maxHeight * 0.125,
                        //fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    //color: Colors.white70,
                    height: p1.maxHeight * 0.1,
                    width: p1.maxWidth * 0.9,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${myRandomName()}, ${myRandomName()} and ${myRandomName()} were currently playing",
                        style: TextStyle(
                          color: Colors.deepPurple.shade200,
                          //fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const PlayTournamentButton(),
                  const Space20(),
                ],
              ),
            ),
          ),
          const Space10(),

          //SizedBox(height: 6.h),
          const DashboardSubHeader(title: "Players Online"),
          Container(
            height: 120.h,
            //color: Colors.red,
            alignment: Alignment.center,
            child: const AvailablePlayerList(),
          ),
          Container(
            height: 125.h,
            padding: const EdgeInsets.all(4.0),
            child: _MyProfileOpenContainer(
              myUser: MyUser(
                  name: mockName(),
                  id: mockInteger(11, 22),
                  avatar: mockString(),
                  isActive: true,
                  isHuman: true),
            ),
          ),
          const Space20(),
          const DashboardSubHeader2(title: "Today Tournament"),
          Container(
            height: 264.h,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.shade700,
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: const EdgeInsets.all(8),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              children: List.generate(
                  3,
                  (index) => SizedBox(
                        height: 84.h,
                        child: const _DailyChallengeScoreTile(),
                      )),
            ),
          )
        ],
      ),
    );
  }
}

class AvailablePlayerList extends StatelessWidget {
  const AvailablePlayerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 2.0, top: 4.0, bottom: 4.0),
      children: List.generate(
          7,
          (index) => AspectRatio(
                aspectRatio: 0.95,
                child: Container(
                  //color: Colors.green.shade100,
                  //margin: const EdgeInsets.only(right: 2.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 5,
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          heightFactor: 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            child: RandomAvatar(
                              mockString(),
                              width: 72.h,
                              trBackground: true,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Flexible(
                        flex: 2,
                        child: FractionallySizedBox(
                          widthFactor: 0.9,
                          heightFactor: 0.6,
                          child: FittedBox(
                            child: Text(
                              myRandomName(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}

class _MyProfileOpenContainer extends StatelessWidget {
  const _MyProfileOpenContainer({required this.myUser});

  final MyUser myUser;

  @override
  Widget build(BuildContext context) => OpenContainer(
        closedShape:
            const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        closedColor: Colors.transparent,
        closedBuilder: (context, action) => Container(
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(4.0),
          ),
          height: 120.h,
          padding: EdgeInsets.only(right: 8.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Stack(
              children: [
                FadeInRight(
                  child: LayoutBuilder(
                    builder: (_, p1) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                height: p1.maxHeight,
                                left: -p1.maxWidth * 0.05,
                                bottom: -p1.maxHeight * 0.075,
                                width: p1.maxWidth * 0.4,
                                child: CircleAvatar(
                                  radius: p1.maxHeight,
                                  backgroundColor: Colors.transparent,
                                  child: RandomAvatar(
                                    myUser.avatar,
                                    trBackground: true,
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
                            title: Container(
                              height: 50.h,
                              //color: Colors.red,
                              alignment: Alignment.centerLeft,
                              child: FittedBox(
                                child: AutoSizeText.rich(
                                  TextSpan(
                                    children: [
                                      /*TextSpan(
                                        text: "Hi   ",
                                        style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepPurple.shade200),
                                      ),*/
                                      TextSpan(text: myUser.name),
                                    ],
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.deepPurple.shade100,
                                    fontSize: 72,
                                    fontWeight: FontWeight.bold,
                                    //decorationThickness: 40,
                                  ),
                                ),
                              ),
                            ),
                            subtitle: Container(
                              height: 20.h,
                              //color: Colors.amber,
                              alignment: Alignment.centerLeft,
                              child: FittedBox(
                                child: AutoSizeText(
                                  "Hope you had a great day",
                                  style: TextStyle(
                                    color: Colors.deepPurple.shade100,
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
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: FadeIn(
                    delay: const Duration(seconds: 3),
                    child: Consumer(
                      builder: (context, ref, child) => TextButton(
                        onPressed: () => ref.read(signOutProvider),
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        ),
                        child: const Text(
                          "LOG OUT",
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.black54,
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
        middleColor: Colors.deepPurpleAccent.shade200,
        openBuilder: (_, __) => Container(),
      );
}

class PlayTournamentButton extends ConsumerWidget {
  const PlayTournamentButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize sSize = ref.read(sizeProvider);
    return FadeInRight(
      delay: const Duration(seconds: 2),
      child: OutlinedButton(
        onPressed: () {
          context.router.push(const TournamentRoute());
        },
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          ),
          side: MaterialStatePropertyAll(
            BorderSide(
              color: Colors.white54,
              width: 0.5,
            ),
          ),
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        ),
        child: Container(
          alignment: Alignment.center,
          child: FittedBox(
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                ColorizeAnimatedText(
                  'Play Tournament',
                  textStyle: TextStyle(fontSize: 16.h, fontFamily: 'Poppins'),
                  colors: Colors.primaries.map((e) => e.shade50).toList(),
                  speed: const Duration(seconds: 3),
                ),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                context.router.push(const TournamentRoute());
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PlayTournamentButton1 extends ConsumerWidget {
  const PlayTournamentButton1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize sSize = ref.read(sizeProvider);
    return FadeInRight(
      delay: const Duration(seconds: 2),
      child: ElevatedButton(
        onPressed: () {
          context.router.push(const TournamentRoute());
        },
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          backgroundColor: MaterialStatePropertyAll(
            Colors.deepPurpleAccent.shade200,
          ),
        ),
        child: Container(
          width: sSize == ScreenSize.phone || sSize == ScreenSize.tab
              ? 320.w
              : 360.w,
          height: 60.h,
          alignment: Alignment.center,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              ColorizeAnimatedText(
                'Play Tournament',
                textStyle: TextStyle(
                  fontSize: 20.h,
                  fontWeight: FontWeight.w700,
                  color: Colors.white70,
                ),
                colors: Colors.primaries.map((e) => e.shade100).toList(),
                speed: const Duration(seconds: 3),
              ),
            ],
            isRepeatingAnimation: true,
            onTap: () {
              context.router.push(const TournamentRoute());
            },
          ),
        ),
      ),
    );
  }
}

class DashboardSubHeader extends StatelessWidget {
  final String title;
  const DashboardSubHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      alignment: Alignment.centerLeft,
      child: FittedBox(
        alignment: Alignment.centerLeft,
        child: AutoSizeText(
          title,
          style: const TextStyle(
            color: Colors.deepPurpleAccent,
            fontFamily: 'LilitaOne',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class DashboardSubHeader2 extends StatelessWidget {
  final String title;
  const DashboardSubHeader2({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      padding: EdgeInsets.only(left: 8.w),
      alignment: Alignment.centerLeft,
      child: FittedBox(
        alignment: Alignment.centerLeft,
        child: AutoSizeText(
          title,
          style: TextStyle(
            color: Colors.deepPurpleAccent.shade700,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _DailyChallengeScoreTile extends StatelessWidget {
  const _DailyChallengeScoreTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 2.sp),
        decoration: BoxDecoration(
          // color: Colors.indigo.shade50,
          border: Border(
            bottom: BorderSide(
                width: 0.25,
                color: Colors
                    .primaries[mockInteger(0, Colors.primaries.length - 1)]
                    .shade400),
          ),
        ),
        //height: 900.h * 0.1,
        child: LayoutBuilder(
          builder: (p0, p1) => Row(
            children: [
              Flexible(
                flex: 2,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 0.5,
                  child: Container(
                    padding: EdgeInsets.all(6.sp),
                    alignment: Alignment.center,
                    child: const FittedBox(
                      child: AutoSizeText(
                        "#1",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          //fontWeight: FontWeight.w100,
                          color: Colors.black54,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: Container(
                    padding: EdgeInsets.all(2.sp),
                    child: CircleAvatar(
                      backgroundColor: Colors
                          .primaries[
                              mockInteger(0, Colors.primaries.length - 1)]
                          .shade100,
                      child: RandomAvatar(
                        mockString(),
                        trBackground: true,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 6,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 8.sp, top: 1.sp, bottom: 1.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 3,
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          heightFactor: 0.5,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              myRandomName(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.deepPurple),
                            ),
                          ),
                        ),
                      ),
                      // if (subtitle != null && !subtitle!.isNotEmpty)

                      const Flexible(
                        flex: 1,
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          heightFactor: 0.8,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              "Chennai, Tamil Nadu",
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
              ),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 4,
                      child: FractionallySizedBox(
                        widthFactor: 0.75,
                        heightFactor: 0.75,
                        child: FittedBox(
                          alignment: Alignment.centerRight,
                          child: AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: const Duration(seconds: 270)
                                      .inMinutes
                                      .toString()
                                      .padLeft(2, '0'),
                                  style: TextStyle(
                                      color: Colors.deepPurple.shade300),
                                ),
                                TextSpan(
                                  text:
                                      ": ${"${const Duration(seconds: 270).inSeconds % 60}".padLeft(2, '0')}",
                                  style: TextStyle(
                                    color: Colors.deepPurple.shade700,
                                    //fontSize: 2.sp,
                                  ),
                                ),
                              ],
                            ),
                            style: const TextStyle(fontFamily: 'Orbitron'),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        heightFactor: 0.75,
                        child: FittedBox(
                          alignment: Alignment.centerRight,
                          child: AutoSizeText(
                            ["1st", '2nd', '3rd'].elementAt(mockInteger(0, 2)),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w100,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
