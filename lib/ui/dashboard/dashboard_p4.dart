import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
//import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/my_widgets/my_names.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../logic/auth.dart';
import '../../logic/tournament_datastore.dart';
import '../../logic/user_datastore.dart';
import '../../model/my_user.dart';
import '../../model/t_score.dart';
import '../../my_widgets/daily_challenge_score_tile.dart';
import '../../my_widgets/my_list_tile.dart';
import '../../routes/my_route.dart';

class DashboardP extends StatefulWidget {
  const DashboardP({Key? key}) : super(key: key);

  @override
  State<DashboardP> createState() => _DashboardPState();
}

class _DashboardPState extends State<DashboardP> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state.name);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SlidingUpPanel(
        body: Column(
          children: [
            SizedBox(height: 805.h, child: const _Dashboard()),
          ],
        ),
        panel: Container(),
        minHeight: 0,
      );
}

class _Dashboard extends ConsumerWidget {
  const _Dashboard({Key? key}) : super(key: key);

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
    //final now = ref.watch(todayDateTimeProvider).value;
    //final n = DateTime.now();
    //final endTime =
    //    DateTime(n.year, n.month, n.day).add(const Duration(days: 1));
    //print(endTime);
    return Column(
      children: [
        /*Container(
          height: 111.h,
          margin: EdgeInsets.only(top: 5.h),
          child: const _RecentPlayerList(),
        ),*/
        const Space10(),
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  height: 50.h,
                  //color: Colors.amber,
                  alignment: Alignment.centerLeft,
                  child: ButtonsTabBar(
                    height: 50.h,
                    radius: 4.w,
                    backgroundColor: const Color(0xff1f2232),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12.0),
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
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffAD343E),
                              borderRadius: BorderRadius.circular(6.w),
                              border: const Border(),
                            ),
                            height: 150.h,
                            margin: const EdgeInsets.all(8),
                            child: const _DailyTournamentBoard(),
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                ...List.generate(
                                  10,
                                  (index) => const _WelcomeUser(),
                                ),
                                ...List.generate(
                                  2,
                                  (index) => const _XXY(),
                                ),
                              ]..shuffle(),
                            ),
                          )
                          /*SizedBox(
                            //color: Colors.red,
                            height: 275.h,
                            child: const _BestRecord(),
                          ),
                          const Space10(),
                          Container(
                            height: 24.h,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            alignment: Alignment.centerLeft,
                            child: const FittedBox(
                                child: Text(
                              "Game Archives",
                              style: TextStyle(fontFamily: 'LilitaOne'),
                            )),
                          )*/
                        ],
                      ),
                      const _MyExpansionList(),
                      // const _BestRecord()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _XXY extends StatelessWidget {
  const _XXY();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Space20(),
        const Space10(),
        Container(
          height: 66.h,
          margin: EdgeInsets.only(
            left: 12.w,
            //top: 18.h,
            //bottom: 9.h,
            right: 18.w,
          ),
          padding: EdgeInsets.only(right: 9.w),
          decoration: BoxDecoration(
            color: const Color(0xff724cf9),
            borderRadius: BorderRadius.circular(3.w),
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
                        left: -p1.maxWidth * 0.05,
                        bottom: -p1.maxHeight * 0.05,
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
                Flexible(
                  flex: 4,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                    minVerticalPadding: 0,
                    horizontalTitleGap: 0,
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
                            fontSize: 72,
                            //decorationThickness: 40,
                          ),
                        ),
                      ),
                    ),
                    subtitle: Container(
                      height: 15.h,
                      //color: Colors.amber,
                      alignment: Alignment.centerLeft,
                      child: const FittedBox(
                        child: AutoSizeText(
                          "Today at 3:45 "
                          "pm ",
                          style: TextStyle(
                            color: Color(0xfffde8e9),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ),
                    trailing: AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "04: ${mockInteger(11, 59)}"),
                          TextSpan(
                              text: ": ${mockInteger(100, 500)}",
                              style: TextStyle(fontSize: 9))
                        ],
                      ),
                      style: TextStyle(
                        fontFamily: 'BrunoAceSC',
                        fontSize: 15,
                        color: Color(0xfffde8e9),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _WelcomeUser extends StatelessWidget {
  const _WelcomeUser();

  @override
  Widget build(BuildContext context) => Container(
        height: 36.h,
        margin: EdgeInsets.only(bottom: 10.h),
        child: ListTile(
          dense: true,
          leading: CircleAvatar(radius: 12, child: RandomAvatar(mockString())),
          minLeadingWidth: 0,
          horizontalTitleGap: 15.w,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
          title: AutoSizeText(
            _randomWelcomeText(
                myRandomName(), "${mockInteger()}:${mockInteger(10, 59)}"),
            style: const TextStyle(fontFamily: 'Poppins'),
            maxLines: 1,
            minFontSize: 6,
            maxFontSize: 9,
          ),
          subtitle: const AutoSizeText(
            "Today at 12:23 pm",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w100,
            ),
            maxLines: 2,
            minFontSize: 4,
            maxFontSize: 6,
          ),
        ),
      );

  String _randomWelcomeText(String a, String d) => [
        "Welcome $a, Say Hi. ",
        "Everyone welcome $a!.",
        "$a , just showed up!. ",
        "$a just slid into the server. ",
        "Yay you made it, $a!"
      ][mockInteger(0, 4)];
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

class _MyExpansionList3 extends StatelessWidget {
  const _MyExpansionList3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        Container(
          color: const Color(0xffF2AF29),
          height: 150.h,
          child: Column(
            children: [
              Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          //color: Colors.blue,
                          padding: const EdgeInsets.all(8),
                          child: RandomAvatar(mockString()),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      SizedBox(
                        width: 180.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                AutoSizeText(
                                  myRandomName(),
                                  minFontSize: 9,
                                  maxFontSize: 12,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  mockInteger(111111, 999999).toString(),
                                  minFontSize: 6,
                                  maxFontSize: 8,
                                ),
                                const Text(
                                  "First",
                                  style: TextStyle(fontSize: 9),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Flexible(flex: 3, child: Container()),
            ],
          ),
        ),
      ],
    );
  }
}

class _MyExpansionList2 extends StatelessWidget {
  const _MyExpansionList2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(6.0),
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 120.h,
          color: const Color(0xffbc9ec1),
          margin: const EdgeInsets.symmetric(vertical: 2.0),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 72.h,
          margin: const EdgeInsets.symmetric(vertical: 2.0),
          color: const Color(0xffbc9ec1),
          child: Column(
            children: [
              SizedBox(
                height: 72.h,
                //padding: EdgeInsets.all(6),
                child: ListTile(
                  //contentPadding: EdgeInsets.zero,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AutoSizeText(
                        "09:88:456",
                        style:
                            TextStyle(fontFamily: 'BrunoAceSC', fontSize: 12),
                      ),
                      AutoSizeText(
                        myRandomName(),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 6,
                          fontWeight: FontWeight.w100,
                        ),
                        maxFontSize: 12,
                        minFontSize: 9,
                      ),
                    ],
                  ),

                  trailing: CircleAvatar(
                    radius: 15,
                    child: RandomAvatar(mockString()),
                  ),
                  /*title: AutoSizeText(
                    myRandomName(),
                    style: const TextStyle(fontFamily: 'Poppins', fontSize: 9),
                  ),*/
                ),
              )
            ],
          ),
          //color: const Color(0xffe3b8c6),
        )
      ],
    );
  }
}

class _MyExpansionList1 extends StatelessWidget {
  const _MyExpansionList1();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(6),
      children: List.generate(
        5,
        (index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 2.0),
          /* child: ExpansionTileCard(
                  borderRadius: BorderRadius.circular(3.0),
                  contentPadding: const EdgeInsets.only(right: 16.0, left: 8.0),
                  expandedColor: const Color(0xffe3b8c6),

                  //initialPadding: EdgeInsets.zero,
                  //finalPadding: EdgeInsets.zero,
                  baseColor: const Color(0xfffde8e9),
                  elevation: 2,
                  leading: CircleAvatar(child: RandomAvatar(mockString())),
                  title: AutoSizeText.rich(
                    TextSpan(children: [
                      TextSpan(text: "${myRandomName()} "),
                      TextSpan(
                          text: mockInteger(111111, 999999).toString(),
                          style: const TextStyle(fontSize: 6)),
                    ]),
                    maxLines: 1,
                    style: const TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  ),
                  */ /*subtitle: Text(
                    mockInteger(100000, 999999).toString(),
                    style: const TextStyle(fontFamily: 'Poppins', fontSize: 6),
                  ),*/ /*
                  trailing: AutoSizeText(
                    "1:${mockInteger(10, 59)}:34",
                    style: const TextStyle(
                      fontFamily: 'BrunoAceSC',
                      color: Colors.deepPurple,
                    ),
                    maxFontSize: 15,
                    minFontSize: 12,
                  ),
                  children: [
                    Container(
                      //color: Colors.red,
                      height: 60.h,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: AutoSizeText.rich(
                                    TextSpan(children: [
                                      const TextSpan(
                                          text: "",
                                          style: TextStyle(fontSize: 9)),
                                      TextSpan(
                                          text: "${mockInteger(1, 100)}",
                                          style: const TextStyle(
                                              fontFamily: 'Poppins')),
                                    ]),
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  fit: FlexFit.tight,
                                ),
                                const Flexible(
                                  child: AutoSizeText(
                                    "Rank",
                                    maxFontSize: 9,
                                    minFontSize: 6,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: AutoSizeText(
                                    mockInteger(1, 100).toString(),
                                    style:
                                        const TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                                const Flexible(
                                  child: AutoSizeText(
                                    "Games Played",
                                    maxFontSize: 9,
                                    minFontSize: 6,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: AutoSizeText.rich(
                                    TextSpan(children: [
                                      const TextSpan(
                                          text: "x ",
                                          style: TextStyle(fontSize: 9)),
                                      TextSpan(
                                          text: "${mockInteger(1, 100)}",
                                          style: const TextStyle(
                                              fontFamily: 'Poppins')),
                                    ]),
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  fit: FlexFit.tight,
                                ),
                                const Flexible(
                                    child: AutoSizeText(
                                  "Max. Streak",
                                  maxFontSize: 9,
                                  minFontSize: 6,
                                ))
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: AutoSizeText(
                                    mockInteger(1, 10).toString(),
                                    style: const TextStyle(
                                        fontSize: 15, fontFamily: "Poppins"),
                                  ),
                                ),
                                const Flexible(
                                    child: AutoSizeText(
                                  "Top 3",
                                  maxFontSize: 9,
                                  minFontSize: 6,
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),*/
        ),
      ),
    );
  }
}

/*Container(
          //color: Colors.amber,

          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.green,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Theme(
              data: Theme.of(context).copyWith(
                listTileTheme:
                    ListTileTheme.of(context).copyWith(
                  dense: false,
                ),
              ),
              child: ExpansionTile(
                //tilePadding: EdgeInsets.,
                leading: CircleAvatar(
                    child: RandomAvatar(mockString())),
                initiallyExpanded: true,
                title: Text(
                  myRandomName(),
                  style: const TextStyle(
                      fontFamily: 'Poppins', fontSize: 12),
                ),
                subtitle: Text(
                  mockInteger(100000, 999999).toString(),
                  style: const TextStyle(
                      fontFamily: 'Poppins', fontSize: 6),
                ),
                trailing: const Text("sf"),
                children: [
                  Container(
                    //color: Colors.red,
                    height: 75.h,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                flex: 2,
                                child: AutoSizeText(
                                    mockInteger(1, 100)
                                        .toString()),
                              ),
                              const Flexible(
                                  child: AutoSizeText(
                                "Games Played",
                                maxFontSize: 9,
                                minFontSize: 6,
                              ))
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 2,
                                child: AutoSizeText(
                                    mockInteger(1, 100)
                                        .toString()),
                              ),
                              const Flexible(
                                  child: AutoSizeText(
                                "Games Played",
                                maxFontSize: 9,
                                minFontSize: 6,
                              ))
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 2,
                                child: AutoSizeText(
                                    mockInteger(1, 100)
                                        .toString()),
                              ),
                              const Flexible(
                                  child: AutoSizeText(
                                "Games Played",
                                maxFontSize: 9,
                                minFontSize: 6,
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )*/

class _BestRecord extends ConsumerWidget {
  const _BestRecord();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User user = ref.watch(firebaseUserProvider);
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final List<TScore> bestTScores =
        List.from(ref.watch(bestRecordTScoreProvider));
    final Map<String, MyUser> mUser = ref.watch(recentUserProvider).value ?? {};

    print("BestScore");
    print(bestTScores);
    return Container(
        child: mUser.isEmpty || myUser == null
            ? Container()
            : ListView(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                // physics: const NeverScrollableScrollPhysics(),
                children: [
                  /*const Space10(),
                  SizedBox(
                    height: 36.h,
                    child: Text("Best Record"),
                  ),*/
                  const Space10(),
                  ...List.of(
                    bestTScores.take(4).map(
                          (e) => Container(
                            decoration: user.uid == e.userId!
                                ? BoxDecoration(
                                    color: const Color(0xffe3b8c6),
                                    borderRadius: BorderRadius.circular(4.w),
                                  )
                                : null,
                            height: 66.h,
                            child: DailyChallengeScoreTile(
                                rank: bestTScores.indexOf(e) + 1,
                                myUser: e.userId == user.uid
                                    ? myUser
                                    : mUser.putIfAbsent(
                                        e.userId!,
                                        () => ref
                                            .watch(xUserProvider(e.userId!))
                                            .maybeWhen(
                                              data: (data) => data,
                                              orElse: () => MyUser(
                                                name: "Nothing",
                                                id: mockInteger(111, 99999),
                                                avatar: mockString(),
                                                isActive: true,
                                                isHuman: true,
                                              ),
                                            )),
                                tDuration: e.tDuration!),
                          ),
                        ),
                  )
                  /*ExpansionTile(
                    title: SizedBox(
                      height: 36.h,
                      child: const _TitleX(a: "Gold League"),
                    ),
                    tilePadding: EdgeInsets.zero,

                    */ /*subtitle: const Text(
                      "Top 3 players",
                      style: TextStyle(fontSize: 9),
                    ),*/ /*
                    children: [
                      ...List.of(
                        bestTScores.take(4).map(
                              (e) => Container(
                                decoration: user.uid == e.userId!
                                    ? BoxDecoration(
                                        color: const Color(0xffe3b8c6),
                                        borderRadius:
                                            BorderRadius.circular(4.w),
                                      )
                                    : null,
                                height: 66.h,
                                child: DailyChallengeScoreTile(
                                    rank: bestTScores.indexOf(e) + 1,
                                    myUser: e.userId == user.uid
                                        ? myUser
                                        : mUser.putIfAbsent(
                                            e.userId!,
                                            () => ref
                                                .watch(xUserProvider(e.userId!))
                                                .maybeWhen(
                                                  data: (data) => data,
                                                  orElse: () => MyUser(
                                                    name: "Nothing",
                                                    id: mockInteger(111, 99999),
                                                    avatar: mockString(),
                                                    isActive: true,
                                                    isHuman: true,
                                                  ),
                                                )),
                                    tDuration: e.tDuration!),
                              ),
                            ),
                      )
                    ],
                  ),
                  ExpansionTile(
                    title: SizedBox(
                      height: 36.h,
                      child: const _TitleX(a: "Gold League"),
                    ),
                    tilePadding: EdgeInsets.zero,
                    children: [
                      ...List.of(
                        bestTScores.take(7).map(
                              (e) => Container(
                                decoration: user.uid == e.userId!
                                    ? BoxDecoration(
                                        color: const Color(0xffe3b8c6),
                                        borderRadius:
                                            BorderRadius.circular(4.w),
                                      )
                                    : null,
                                height: 60.h,
                                child: DailyChallengeScoreTile(
                                    rank: bestTScores.indexOf(e) + 1,
                                    myUser: e.userId == user.uid
                                        ? myUser
                                        : mUser.putIfAbsent(
                                            e.userId!,
                                            () => ref
                                                .watch(xUserProvider(e.userId!))
                                                .maybeWhen(
                                                  data: (data) => data,
                                                  orElse: () => MyUser(
                                                    name: "Nothing",
                                                    id: mockInteger(111, 99999),
                                                    avatar: mockString(),
                                                    isActive: true,
                                                    isHuman: true,
                                                  ),
                                                )),
                                    tDuration: e.tDuration!),
                              ),
                            ),
                      )
                    ],
                  ),*/
                ],
              ));
  }
}

class _TodayPlayerList extends ConsumerWidget {
  const _TodayPlayerList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, MyUser> mUser = ref.watch(recentUserProvider).value ?? {};
    //print("236--");
    //print(mUser);
    final List<TScore> todayUniqueTScores =
        ref.watch(todayUniqueTScoreProvider);
    final MyUser? myUser = ref.watch(myUserProvider).value;
    todayUniqueTScores.sort((a, b) => a.tDuration!.compareTo(b.tDuration!));
    final User user = ref.watch(firebaseUserProvider);
    int take = 4;
    TScore? myTScore;
    bool showExtra = false;
    if (todayUniqueTScores.any((element) => element.userId == user.uid)) {
      myTScore = todayUniqueTScores
          .firstWhere((element) => element.userId == user.uid);
      if (!(todayUniqueTScores.indexOf(myTScore) < 3)) {
        showExtra = true;
        take = 3;
      }
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      //color: Colors.red,
      height: 60.h * (3 + 2),
      child: mUser.isEmpty || myUser == null
          ? Container()
          : ListView(
              padding: const EdgeInsets.only(left: 8.0, right: 4.0),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ...List.of(
                  todayUniqueTScores.take(take).map(
                        (e) => FadeInRight(
                          delay: Duration(
                              milliseconds:
                                  (200 * (mockInteger(1, 4) + 1)).toInt()),
                          child: Container(
                            decoration: user.uid == e.userId!
                                ? BoxDecoration(
                                    color: const Color(0xffe3b8c6),
                                    borderRadius: BorderRadius.circular(4.w),
                                  )
                                : null,
                            height: 65.h,
                            child: DailyChallengeScoreTile(
                                rank: todayUniqueTScores.indexOf(e) + 1,
                                myUser: e.userId == user.uid
                                    ? myUser
                                    : mUser.putIfAbsent(
                                        e.userId!,
                                        () => ref
                                            .watch(xUserProvider(e.userId!))
                                            .maybeWhen(
                                              data: (data) => data,
                                              orElse: () => MyUser(
                                                name: "Nothing",
                                                id: mockInteger(111, 99999),
                                                avatar: mockString(),
                                                isActive: true,
                                                isHuman: true,
                                              ),
                                            )),
                                tDuration: e.tDuration!),
                          ),
                        ),
                      ),
                ),
                if (showExtra)
                  FadeInRight(
                    delay: Duration(
                        milliseconds:
                            (200 * (todayUniqueTScores.indexOf(myTScore!) + 1))
                                .toInt()),
                    child: SizedBox(
                      height: 75.h,
                      child: DailyChallengeScoreTile(
                        rank: todayUniqueTScores.indexOf(myTScore) + 1,
                        myUser: myUser,
                        tDuration: myTScore.tDuration!,
                      ),
                    ),
                  )
                /*...List.generate(
            mockInteger(1, 3),
            <Widget>(index) => FadeInRight(
              delay: Duration(milliseconds: (200 * (index + 1)).toInt()),
              child: SizedBox(
                height: 75.h,
                child: const DailyChallengeScoreTile(),
              ),
            ),
          ),*/
                ,
                ...[
                  /*FadeInRight(
              delay: const Duration(milliseconds: 800),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffe3b8c6),
                  borderRadius: BorderRadius.circular(4.w),
                ),
                height: 75.h,
                child: const DailyChallengeScoreTile(),
              ),
            )*/
                ]
              ],
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
              child: const AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "15",
                      style: TextStyle(fontSize: 27),
                    ),
                    TextSpan(text: " users were played so far")
                  ],
                ),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w100,
                  color: Colors.white54,
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

class _RecentPlayerList extends ConsumerWidget {
  const _RecentPlayerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider).value;
    return Row(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: myUser == null
              ? Container()
              : _RecentPlayerListTile(user: myUser),
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                5,
                (index) => AspectRatio(
                      aspectRatio: 0.84,
                      child: myUser == null
                          ? Container()
                          : _RecentPlayerListTile(user: myUser),
                    )),
          ),
        )
      ],
    );
  }
}

class _RecentPlayerListTile extends StatelessWidget {
  final MyUser user;
  const _RecentPlayerListTile({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.center,
        child: FadeIn(
          delay: const Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 6,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: Opacity(
                    opacity: user.isActive ? 1 : 0.25,
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
              ),
              SizedBox(height: 6.h),
              Flexible(
                flex: 2,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 0.8,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      myRandomName(),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              const Flexible(
                flex: 1,
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  heightFactor: 0.9,
                  child: FittedBox(
                    child: Text(
                      "Playing",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}

/*"Hey there, Hari! Good to see you!"
"Look who's here! Hari, welcome!"
"Hari, you've arrived! Excellent!"
"Ah, Hari has graced us with their presence. Welcome!"
"Hari, welcome aboard! We're thrilled to have you."
"Well, well, well, if it isn't Hari! Welcome, my friend."
"Greetings, Hari! You've made it. Great to have you!"
"Hari, you've joined the party! Welcome, welcome!"
"Step right in, Hari. We've been waiting for you. Welcome!"
"Hari, we've been eagerly anticipating your arrival. Welcome and say hello!"
*/
