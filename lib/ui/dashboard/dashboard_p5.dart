import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/my_widgets/my_names.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../logic/tournament_datastore.dart';
import '../../my_widgets/my_list_tile.dart';
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
    return Column(
      children: [
        SizedBox(height: 805.h, child: const _Dashboard()),
      ],
    );
  }
}

class _Dashboard extends ConsumerWidget {
  const _Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      tScoresOnChangeProvider.select((value) => value.value),
      (previous, next) {
        if (next != null) {
          ref.read(tScoreListProvider.notifier).addItem(next);
        }
      },
    );
    return const DefaultTabController(
      length: 2,
      child: Column(
        children: [
          //_MyProfileHeader(),
          Space10(),
          _MyButtonTabBar(),
          Space20(),
          Expanded(
            child: TabBarView(
              children: [
                _DailyActivity(),
                _MyExpansionList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MyProfileHeader extends StatelessWidget {
  const _MyProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      color: const Color(0xffF7BEFF),
      child: LayoutBuilder(
        builder: (_, p1) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    height: p1.maxHeight,
                    left: -p1.maxWidth * 0.075,
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
              flex: 3,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                title: Container(
                  height: 33.h,
                  //color: Colors.red,
                  alignment: Alignment.bottomLeft,
                  child: FittedBox(
                    child: AutoSizeText(
                      "Welcome ${myRandomName()}",
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xff00008B), fontSize: 72,
                        //decorationThickness: 40,
                      ),
                    ),
                  ),
                ),
                subtitle: Container(
                  height: 15.h,
                  margin: EdgeInsets.only(top: 6.h),
                  //color: Colors.amber,
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    child: AutoSizeText(
                      // "You have unlocked ${mockInteger(2, 10)} avatars",
                      "Hope you had a great day",
                      style: const TextStyle(
                        color: Color(0xff00008B),
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
    );
  }
}

class _BestRecord extends StatelessWidget {
  const _BestRecord();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _DailyActivity extends StatelessWidget {
  const _DailyActivity();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffAD343E),
            borderRadius: BorderRadius.circular(6),
            border: const Border(),
          ),
          height: 150.h,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          //margin: const EdgeInsets.all(8),
          child: const _DailyTournamentBoard(),
        ),
        const Space10(),
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                ...List.generate(4, (index) => _WelcomeUser()),
                ...List.generate(4, (index) => _XXY()),
              ]..shuffle(),
            ),
          ),
        )
      ],
    );
  }
}

/*Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                padding: const EdgeInsets.all(6),
                child: Column(
                  children: [
                    SizedBox(
                      height: 75.h,
                      //color: Colors.red,
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
                                    left: -p1.maxWidth * 0.075,
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
                              flex: 3,
                              child: ListTile(
                                contentPadding: EdgeInsets.only(right: 9.w),
                                minVerticalPadding: 0,
                                title: Container(
                                  height: 36.h,
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
                                subtitle: Container(
                                  height: 18.h,
                                  //color: Colors.amber,
                                  alignment: Alignment.centerLeft,
                                  child: FittedBox(
                                    child: AutoSizeText(
                                      "June ${mockInteger(1, 30)}, 2023",
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                ),
                                trailing: const AutoSizeText.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: "01:23"),
                                      TextSpan(
                                        text: ": 444",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  style: TextStyle(fontFamily: 'BrunoAceSC'),
                                  maxFontSize: 18,
                                  minFontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      //child: ,
                    ),
                  ],
                ),
              )*/

/* const _MyButtonTabBar(),
                  const Space10(),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView(
                          children: [
                            ...List.generate(
                                10, (index) => const _WelcomeUser()),
                          ]..shuffle(),
                        ),
                        Container(),
                      ],
                    ),
                  )*/

class _XXY extends StatelessWidget {
  const _XXY();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      margin: EdgeInsets.only(
        left: 12.w,
        top: 12.h,
        //bottom: 9.h,
        right: 18.w,
      ),
      padding: EdgeInsets.only(right: 9.w),
      decoration: BoxDecoration(
        color: const Color(0xff9467FF),
        borderRadius: BorderRadius.circular(6.w),
      ),
      child: LayoutBuilder(
        builder: (_, p1) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    height: p1.maxHeight,
                    left: -p1.maxWidth * 0.06,
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
            //SizedBox(width: 10.w),
            Flexible(
              flex: 3,
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
                        fontFamily: 'LilitaOne',
                        color: Color(0xfffde8e9),
                      ),
                    ),
                  ),
                ),
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
              flex: 2,
              child: AutoSizeText.rich(
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
                maxLines: 1,
              ),
            )
          ],
        ),
      ),
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
                          child: RandomAvatar(
                            mockString(),
                            //trBackground: true,
                          ),
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
                    //minLeadingWidth: 106,
                    title: Container(
                      height: 21.h,
                      //color: Colors.red,
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

class _MyExpansionList extends StatelessWidget {
  const _MyExpansionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(4),
      children: List.generate(8, (index) => const _AnotherListTile()),
    );
  }
}

class _AnotherListTile extends StatelessWidget {
  const _AnotherListTile();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 51,
      margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
      //margin: EdgeInsets.only(
      //    bottom: 1.h, left: isLeft ? 16.w : 3.w, right: !isLeft ? 16.w : 3.w),
      padding: EdgeInsets.only(bottom: 3.h),

      alignment: Alignment.topCenter,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        //tileColor: Color(0xff724cf9),
        dense: true,
        //textColor: const Color(0xfffde8e9),
        textColor: const Color(0xff724cf9),
        leading: CircleAvatar(
          radius: 18,
          child: RandomAvatar(mockString()),
          //radius: 18,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 6),
        title: AutoSizeText.rich(
          TextSpan(children: [
            TextSpan(text: myRandomName() + " "),
            TextSpan(
              text: mockInteger(111111, 999999).toString(),
              style: const TextStyle(
                fontSize: 6,
                fontFamily: 'Poppins',
                letterSpacing: 0.25,
              ),
            ),
          ]),
          style: const TextStyle(fontFamily: 'Poppins', fontSize: 12),
          maxLines: 1,
        ),
        trailing: SizedBox(
          width: 66.w,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: AutoSizeText.rich(
              TextSpan(
                children: [
                  TextSpan(text: "${mockInteger(1, 5)}:${mockInteger(10, 59)}"),
                  TextSpan(
                      text: ":${mockInteger(10, 59)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 12,
                      )),
                ],
              ),
              maxLines: 1,
              style: const TextStyle(fontFamily: 'BrunoAceSC', fontSize: 18),
            ),
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              "Mar ${mockInteger(1, 30)}, 2023",
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w100,
              ),
              maxLines: 1,
              maxFontSize: 6,
              minFontSize: 3,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.25, color: Colors.indigo),
                  borderRadius: BorderRadius.circular(2.0)),
              child: AutoSizeText(
                "Rank ${(mockInteger(1, 10) + 1)}",
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w100,
                ),
                maxLines: 1,
                maxFontSize: 6,
                minFontSize: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DailyTournamentBoard extends StatelessWidget {
  const _DailyTournamentBoard();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          Positioned(
            right: constraints.maxWidth * 0.05,
            top: constraints.maxHeight * 0.05,
            height: constraints.maxHeight * 0.25,
            width: constraints.maxWidth * 0.35,
            child: Container(
              //color: Colors.red,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Lottie.asset('assets/timer.json')),
                    ),
                  ),
                  const Flexible(
                    flex: 6,
                    child: FittedBox(
                      //alignment: Alignment.centerRight,
                      child: Text(
                        "12:34:23",
                        style: TextStyle(
                          fontFamily: 'BrunoAceSC',
                          color: Color(0xfffde8e9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: constraints.maxWidth * 0.05,
            bottom: constraints.maxHeight * 0.1,
            height: constraints.maxHeight * 0.225,
            width: 100,
            child: ElevatedButton(
              onPressed: () => context.router.push(const TournamentRoute()),
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: FittedBox(
                  child: Text(
                    "Start Now",
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: constraints.maxWidth * 0.025,
            bottom: constraints.maxHeight * 0.2,
            height: constraints.maxHeight * 0.25,
            width: constraints.maxWidth * 0.5,
            child: Container(
              alignment: Alignment.centerLeft,
              //color: Colors.red,
              padding: const EdgeInsets.all(4.0),
              child: AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${mockInteger(10, 200)}",
                      style: const TextStyle(fontSize: 21),
                    ),
                    const TextSpan(text: " users were played so far")
                  ],
                ),
                style: const TextStyle(
                  fontFamily: 'LilitaOne',
                  fontWeight: FontWeight.w100,
                  color: Colors.white38,
                ),
                maxLines: 2,
                minFontSize: 6,
                maxFontSize: 9,
              ),
            ),
          ),
          Positioned(
            left: constraints.maxWidth * 0.025,
            top: constraints.maxHeight * 0.25,
            height: constraints.maxHeight * 0.4,
            width: constraints.maxWidth * 0.6,
            child: Container(
              alignment: Alignment.centerLeft,
              //color: Colors.red,
              padding: const EdgeInsets.all(4.0),
              child: const FittedBox(
                fit: BoxFit.fitWidth,
                child: AutoSizeText.rich(
                  TextSpan(
                    children: [TextSpan(text: "Daily Tournament")],
                  ),
                  style: TextStyle(
                    fontFamily: 'LilitaOne',
                    color: const Color(0xfffde8e9),
                  ),
                  maxLines: 2,
                  minFontSize: 6,
                  maxFontSize: 32,
                ),
              ),
            ),
          ),
          //Positioned(child: child)
        ],
      ),
    );
  }
}

class _MyButtonTabBar extends StatelessWidget {
  const _MyButtonTabBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      //color: Colors.amber,
      alignment: Alignment.centerLeft,
      child: ButtonsTabBar(
        height: 50.h,
        radius: 4.w,
        backgroundColor: const Color(0xff1f2232),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14.h,
          color: const Color(0xfffde8e9),
        ),
        unselectedBackgroundColor: const Color(0xffe3bac6),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14.h,
          color: const Color(0xffbc9ec1),
        ),
        tabs: const [
          Tab(text: "Daily Tournament"),
          Tab(text: "Best Record"),
        ],
      ),
    );
  }
}
