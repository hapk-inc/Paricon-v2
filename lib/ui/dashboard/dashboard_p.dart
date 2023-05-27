import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/auth.dart';
import 'package:paricon/my_widgets/daily_challenge_score_tile.dart';
import 'package:random_avatar/random_avatar.dart';
import '../../my_widgets/my_list_tile.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../my_widgets/my_names.dart';
import '../../routes/my_route.dart';

class DashboardP extends StatelessWidget {
  const DashboardP({Key? key}) : super(key: key);

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
      length: 3,
      child: Column(
        children: [
          const Space10(),
          Container(
            height: 60.h,
            alignment: Alignment.centerLeft,
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
                Tab(text: "Statistics"),
                Tab(text: "You"),
              ],
            ),
          ),
          const Space10(),
          const Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                _DailyTournament(),
                _Statistics(),
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
          ? const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: DailyChallengeScoreTile(),
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
          fontSize: 16,
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
              child: const DailyChallengeScoreTile(),
            ),
          ),
          ...[
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff724cf9),
                borderRadius: BorderRadius.circular(4.w),
              ),
              height: 80.h,
              child: const DailyChallengeScoreTile(),
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
              width: 180,
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
