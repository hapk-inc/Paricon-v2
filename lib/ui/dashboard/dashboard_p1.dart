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
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../my_widgets/my_names.dart';
import 'package:random_avatar/random_avatar.dart';

import 'package:fl_chart/fl_chart.dart';

import '../../logic/auth.dart';
import '../../logic/s_size.dart';
import '../../model/my_user.dart';
import '../../my_widgets/my_list_tile.dart';
import '../../routes/my_route.dart';

class DashboardP6 extends StatelessWidget {
  const DashboardP6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      body: Column(
        children: [
          SizedBox(
            height: 800.h,
            child: const _DashboardBody(),
          ),
        ],
      ),
      panel: Container(),
      minHeight: 0,
    );
  }
}

class _DashboardBody extends StatelessWidget {
  const _DashboardBody();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const Space10(),
          Container(
            height: 60.h,
            alignment: Alignment.centerLeft,
            child: FadeInRight(
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
                  //Tab(text: "Statistics"),
                  Tab(text: "You"),
                ],
              ),
            ),
          ),
          const Space10(),
          const Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                _DailyTournament(),
                //_Statistics(),
                _MyBio(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MyBio extends StatelessWidget {
  const _MyBio();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            height: 150.h,
            decoration: BoxDecoration(
                color: const Color(0xff463F3A),
                borderRadius: BorderRadius.circular(8.w)),
            child: MyListTile(
              leading: RandomAvatar(mockString(), trBackground: true),
              title: myRandomName(option: 'female'),
              subtitle: mockInteger(100000, 999999).toString(),
            ),
          ),
          Container(
            height: 60.h,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 8),
            //color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Email",
                  style: TextStyle(fontSize: 9),
                ),
                AutoSizeText(
                  mockString(6) + "@gmail.com",
                  style: TextStyle(fontSize: 9),
                ),
              ],
            ),
          ),
          Space20(),
          Container(
            height: 50.h,
            width: 300.w,
            child: Consumer(
              builder: (context, ref, child) => OutlinedButton(
                onPressed: () => ref.read(signOutProvider),
                style: ButtonStyle(
                  side: MaterialStatePropertyAll(
                    BorderSide(
                      color: Colors.red,
                      width: 0.5,
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Text(
                      "LOG OUT",
                      style: TextStyle(fontSize: 24, fontFamily: 'LilitaOne'),
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

class _Statistics extends StatelessWidget {
  const _Statistics();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: const [
          /*const TitleX(a: "Best Record Overall"),
          SizedBox(
            height: (290).h,
            child: ListView(
              children: List.generate(
                4,
                (index) => SizedBox(
                  height: 70.h,
                  child: DailyChallengeScoreTile(),
                ),
              ),
            ),
          ),
          const Space10(),*/
          TitleX(a: "Trophies"),
          //Space10(),
          TrophyDataTable(),
          TitleX(a: "Best Record"),
          Space10(),
          BestRecord(index: 0),
          Space10(),
          _BestRecordList(),
        ],
      ),
    );
  }
}

class _BestRecordList extends StatelessWidget {
  const _BestRecordList();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (_, index) => BestRecord(index: index + 1),
          separatorBuilder: (context, index) => SizedBox(height: 5.h),
          itemCount: 10),
    );
  }
}

class BestRecord extends StatelessWidget {
  final int index;
  const BestRecord({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: index == 0 ? 90.h : 70.h,
      decoration: BoxDecoration(
        color: index == 0 ? const Color(0xfff8c537) : null,
        //fontColor: #362C28
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: index != 0
          ? Padding(
              padding: const EdgeInsets.only(right: 15.0),
              //child: DailyChallengeScoreTile(),
              child: Container(),
            )
          : MyListTile(
              leading: RandomAvatar(
                mockString(),
                trBackground: true,
              ),
              title: myRandomName(),
            ),
    );
  }
}

class DummyListTile extends StatelessWidget {
  const DummyListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
                    child: RandomAvatar(mockString(), trBackground: true),
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
                height: 35.h,
                //color: Colors.red,
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  child: AutoSizeText(
                    myRandomName(),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white60, fontSize: 72,
                      //decorationThickness: 40,
                    ),
                  ),
                ),
              ),
              /* subtitle: Container(
                        height: 20.h,
                        //color: Colors.amber,
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          child: AutoSizeText(
                            myRandomName(),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ),*/
            ),
          )
        ],
      ),
    );
  }
}

class TrophyDataTable extends StatelessWidget {
  const TrophyDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      padding: const EdgeInsets.only(left: 8.0),
      alignment: Alignment.topLeft,
      child: DataTable(
        columns: const [
          DataColumn(
            label: Text(
              'Name',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Gold',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 10),
            ),
          ),
          DataColumn(
            label: Text(
              'Silver',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 10),
            ),
          ),
          DataColumn(
            label: Text(
              'Bronze',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 10),
            ),
          ),
        ],
        rows: List.generate(
            6,
            (index) => DataRow(
                  cells: [
                    DataCell(
                      SizedBox(
                        width: 150.w,
                        height: 24.h,
                        // color: Colors.green,
                        child: Row(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: RandomAvatar(mockString()),
                            ),
                            //SizedBox(width: 10.w),
                            Expanded(
                              flex: 2,
                              child: FractionallySizedBox(
                                heightFactor: 0.9,
                                widthFactor: 0.8,
                                child: FittedBox(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(myRandomName()),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: 60.w,
                        height: 20.h,
                        // color: Colors.red,
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          child: Text(mockInteger(1, 40).toString()),
                        ),
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: 60.w,
                        height: 20.h,
                        // color: Colors.red,
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          child: Text(mockInteger(1, 40).toString()),
                        ),
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: 60.w,
                        height: 20.h,
                        // color: Colors.red,
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          child: Text(mockInteger(1, 40).toString()),
                        ),
                      ),
                    ),
                  ],
                )),
        dataRowHeight: 40.h,
        headingRowHeight: 45.h,
        columnSpacing: 0.w,
        checkboxHorizontalMargin: 0,
        horizontalMargin: 0,
      ),
    );
  }
}

TextSpan randomTournamentText(int value) {
  final int a = mockInteger(0, 2);
  //const int a = 1;
  switch (a) {
    case 0:
      return TextSpan(
        children: [
          TextSpan(text: value.toString()),
          TextSpan(
            text: "\ngames played so far",
            style: TextStyle(fontSize: 24.sp),
          ),
        ],
        style: TextStyle(
          fontSize: 32.sp,
          color: const Color(0xfffde8e9),
          fontFamily: 'LilitaOne',
        ),
      );
    case 1:
      return TextSpan(
        children: [
          const TextSpan(text: "Users have logged\n"),
          TextSpan(
            text: "\n$value",
            style: const TextStyle(fontSize: 24),
          ),
          const TextSpan(text: " games played until now"),
        ],
        style: const TextStyle(
          fontSize: 14,
          height: 0.7,
          color: Color(0xfffde8e9),
          fontFamily: 'LilitaOne',
        ),
      );
    case 2:
      return TextSpan(
        children: [
          const TextSpan(text: "As of now,"),
          TextSpan(
            text: " $value",
            style: const TextStyle(fontSize: 32),
          ),
          const TextSpan(
              text: " games have been\ncompleted in the tournament."),
        ],
        style: const TextStyle(
          fontSize: 16,
          height: 1.2,
          // height: 0.7,
          color: Color(0xfffde8e9),
          fontFamily: 'LilitaOne',
        ),
      );
    default:
      return const TextSpan(
        children: [
          TextSpan(text: "No Text"),
        ],
      );
  }
}

class _DailyTournament extends StatelessWidget {
  const _DailyTournament();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const _OverallGames(),
            const Space10(),
            const TitleX(a: "Recently Played"),
            SizedBox(height: 120.h, child: const _AvailablePlayerList()),
            const _TodayPlayerList(),
            Container(
              height: 120.h,
              decoration: BoxDecoration(
                color: const Color(0xff75dbcd),
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: MyListTile(
                  //210124
                  title: 'Congrats ${myRandomName()}!  ',
                  subtitle: 'for winning the yesterday tournament',
                  leading: RandomAvatar(mockString(), trBackground: true)),
            ),
          ],
        ),
      ),
    );
  }
}

/*"Praveen, congratulations on your victory in yesterday's tournament!"
"Congratulations, Praveen, for emerging as the winner in the tournament held yesterday!"
"Well done, Praveen, for winning the tournament yesterday!"
"Praveen, congratulations on your triumphant performance in yesterday's tournament!"
"Congratulations to Praveen for securing the victory in yesterday's tournament!"
"Praveen, you did it! Congratulations on winning the tournament yesterday!"
"Congratulations, Praveen, for your outstanding achievement in yesterday's tournament!"
"Praveen, your victory in yesterday's tournament deserves congratulations!"
"Congratulations to Praveen for coming out on top in yesterday's tournament!"
"Praveen, well played! Congratulations on winning yesterday's tournament!"*/
class _TodayPlayerList extends StatelessWidget {
  const _TodayPlayerList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ...List.generate(
            3,
            <Widget>(index) => SizedBox(
              height: 72.h,
              //child: const DailyChallengeScoreTile(),
              child: Container(),
            ),
          ),
          ...[
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff724cf9),
                borderRadius: BorderRadius.circular(4.w),
              ),
              height: 80.h,
              //child: const DailyChallengeScoreTile(),
              child: Container(),
            )
          ]
        ],
      ),
    );
  }
}

class _OverallGames extends StatelessWidget {
  const _OverallGames();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      decoration: BoxDecoration(
        color: const Color(0xffe54f6d),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: LayoutBuilder(
        builder: (_, p1) => Stack(
          children: [
            Positioned(
              width: p1.maxWidth,
              top: p1.maxHeight * 0.15,
              left: p1.maxWidth * 0.05,
              height: p1.maxHeight * 0.4,
              child: AutoSizeText.rich(
                randomTournamentText(mockInteger(20, 100)),
              ),
            ),
            Positioned(
              height: p1.maxHeight * 0.25,
              bottom: p1.maxHeight * 0.1,
              right: p1.maxWidth * 0.05,
              width: 150,
              child: const _PlayButton(),
            )
          ],
        ),
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.router.push(const TournamentRoute());
      },
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color(0xff0d1821)),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FittedBox(
          child: Text(
            "Play Tournament",
            style: TextStyle(
              fontFamily: 'LilitaOne',
              color: Color(0xfffde8e9),
            ),
          ),
        ),
      ),
    );
  }
}

class TitleX extends StatelessWidget {
  final String a;
  const TitleX({required this.a, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: AutoSizeText(
          a,
          style: const TextStyle(
              color: Color(0xff3b1f2b), fontFamily: 'LilitaOne'),
        ),
      ),
    );
  }
}

class _AvailablePlayerList extends StatelessWidget {
  const _AvailablePlayerList();

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
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
                            backgroundColor: const Color(0xff724cf9),
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
                            child: Text(myRandomName()),
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
                                //child: const DailyChallengeScoreTile(),
                                child: Container(),
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
                          //child: DailyChallengeScoreTile(),
                          child: Container(),
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
