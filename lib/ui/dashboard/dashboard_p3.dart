import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/my_widgets/my_list_tile.dart';
import 'package:paricon/routes/my_route.dart';

import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../logic/auth.dart';
import '../../logic/tournament_datastore.dart';
import '../../logic/user_datastore.dart';
import '../../model/my_user.dart';
import '../../model/t_score.dart';
import '../../my_widgets/daily_challenge_score_tile.dart';

class _DashboardP extends StatefulWidget {
  const _DashboardP({Key? key}) : super(key: key);

  @override
  State<_DashboardP> createState() => _DashboardPState();
}

class _DashboardPState extends State<_DashboardP> with WidgetsBindingObserver {
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
            SizedBox(height: 805.h, child: const _DashboardBody()),
          ],
        ),
        panel: Container(),
        minHeight: 0,
      );
}

class _DashboardBody extends ConsumerWidget {
  const _DashboardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider).value;
    ref.listen(
      tScoresOnChangeProvider.select((value) => value.value),
      (previous, next) {
        if (next != null) {
          ref.read(tScoreListProvider.notifier).addItem(next);
        }
      },
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Column(
            children: [
              const Space10(),
              //FadeInRight(child: const _TitleX(a: "Recently Played")),
              //const Space10(),
              SizedBox(
                height: 100.h,
                child: const _RecentPlayerList(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 135.h,
          width: 360.w,
          //color: Colors.red,
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.9,

              enableInfiniteScroll: true,

              //autoPlay: true,
              //autoPlayInterval: const Duration(seconds: 10),
              //autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              disableCenter: true,
              //onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
            items: [
              const _OverallGames(),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff8c1c13),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: myUser == null
                    ? Container()
                    : LayoutBuilder(
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
                                      child: RandomAvatar(myUser.avatar,
                                          trBackground: true),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: ListTile(
                                contentPadding: EdgeInsets.only(right: 24.w),
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
                                          TextSpan(text: myUser.name),
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
                                      "ID: ${myUser.id}",
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
              //Container(color: Colors.blue),
            ],
          ),
        ),
        const Space10(),
        Expanded(
            child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Align(
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
                  tabs: [
                    const Tab(text: "Daily Tournament"),
                    Tab(text: myUser!.name),
                    const Tab(text: "Best Record"),
                    //const Tab(text: "Game Archive"),
                    //Tab(text: myUser == null ? "You" : myUser.name),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        _DailyTournament(),
                      ],
                    ),
                    _MyBio(),
                    _BestRecord(),
                    //Container(),
                  ],
                ),
              ),
            ],
          ),
        ))
      ],
    );
  }
}

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
                  const Space10(),
                  SizedBox(
                    height: 36.h,
                    child: const _TitleX(a: "Best Record"),
                  ),
                  const Space10(),
                  ...List.of(
                    bestTScores.take(10).map(
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

final TextEditingController _nameController = TextEditingController();

class _OverallGames extends ConsumerWidget {
  const _OverallGames();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int? tCount = ref.watch(tCountProvider).value;
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
                child: AutoSizeText.rich(
                  _randomTournamentText(tCount ?? 0),
                  maxLines: 2,
                ),
              ),
            ),
            Positioned(
              height: p1.maxHeight * 0.3,
              bottom: p1.maxHeight * 0.1,
              right: p1.maxWidth * 0.075,
              width: p1.maxWidth * 0.5,
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
  Widget build(BuildContext context) => OutlinedButton(
        onPressed: () {
          context.router.push(const TournamentRoute());
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color(0xff0d1821)),
        ),
        child: const AutoSizeText(
          "Play Tournament",
          style: TextStyle(
            fontFamily: 'LilitaOne',
            color: Color(0xfffde8e9),
          ),
          maxLines: 1,
          maxFontSize: 18,
          minFontSize: 6,
          stepGranularity: 3,
        ),
      );
}

TextSpan _randomTournamentText(int value) {
  final int a = mockInteger(1, 2);
  //const int a = 0;
  switch (a) {
    case 0:
      return TextSpan(
        children: [
          TextSpan(text: value.toString()),
          TextSpan(
            text: " games played so far",
            style: TextStyle(fontSize: 15.w),
          ),
        ],
        style: TextStyle(
          fontSize: 24.w,
          color: const Color(0xfffde8e9),
          fontFamily: 'LilitaOne',
        ),
      );
    case 1:
      return TextSpan(
        children: [
          const TextSpan(text: "Users have logged"),
          TextSpan(
            text: " $value",
            style: TextStyle(fontSize: 24.w),
          ),
          const TextSpan(text: " games played until now"),
        ],
        style: TextStyle(
          fontSize: 15.w,
          height: 1.5,
          color: const Color(0xfffde8e9),
          fontFamily: 'LilitaOne',
        ),
      );
    case 2:
      return TextSpan(
        children: [
          const TextSpan(text: "As of now,"),
          TextSpan(
            text: " $value",
            style: TextStyle(fontSize: 24.w),
          ),
          const TextSpan(text: " games have been completed in the tournament."),
        ],
        style: TextStyle(
          fontSize: 15.w,
          height: 1.2,
          // height: 0.7,
          color: const Color(0xfffde8e9),
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

class _MyBio extends ConsumerWidget {
  const _MyBio();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider).value;
    final User user = ref.watch(firebaseUserProvider);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 4.0, right: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            initiallyExpanded: user.displayName == null,
            title: _TitleX(
                a: user.displayName == null
                    ? "Complete your Bio"
                    : "Edit Name"),
            tilePadding: EdgeInsets.symmetric(horizontal: 15.w),
            subtitle: Text(
              user.displayName == null
                  ? "I hope you don't want your name to be treated as a mere number like a prisoner."
                  : "Customize your name in a fancy style.",
              style: TextStyle(
                  fontSize: user.displayName == null ? 6 : 9,
                  fontWeight:
                      user.displayName == null ? null : FontWeight.w100),
            ),
            children: [
              Container(
                height: 72.h,
                margin: EdgeInsets.only(bottom: 15.h),
                padding: EdgeInsets.only(top: 8.h, left: 24.w, right: 24.w),
                child: SizedBox(
                  // width: 320.h,
                  child: TextFormField(
                    controller: _nameController,
                    onTap: () {},
                    enabled: true,
                    //validator: (value) {},
                    //controller: _nameController,
                    style: TextStyle(
                      fontFamily: 'LilitaOne',
                      //fontSize: p1.maxHeight * 0.04,
                      color: Colors.deepPurple.shade700,
                      fontWeight: FontWeight.w700,
                    ),
                    cursorColor: Colors.deepPurple.shade200,
                    decoration: InputDecoration(
                      //filled: true,
                      //fillColor: Colors.white60,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: Colors.deepPurple, width: 0.5),
                      ),
                      labelText: 'Enter your Name',

                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.h,
                        fontWeight: FontWeight.w100,
                        color: Colors.deepPurple.shade400,
                      ),
                      errorStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 9,
                        color: Colors.red.shade400,
                      ),
                      //icon: Icon(Icons.pin, size: 24),
                      iconColor: Colors.deepPurple,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: Colors.green),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            BorderSide(color: Colors.deepPurple.shade100),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.red.shade100,
                          width: .1,
                        ),
                      ),
                      suffix: InkWell(
                        onTap: _nameController.text.isEmpty
                            ? null
                            : () => ref
                                .read(updateNameProvider(_nameController.text)
                                    .future)
                                .whenComplete(() =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Color(0xff1f2232),
                                        content: AutoSizeText(
                                          "Relaunch the app "
                                          "and discover your fresh name.",
                                          style:
                                              TextStyle(fontFamily: 'Poppins'),
                                          maxLines: 1,
                                          minFontSize: 6,
                                          maxFontSize: 12,
                                        ),
                                      ),
                                    )),
                        /*  style: ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        ),*/
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'LilitaOne',
                              fontSize: 14),
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: .75,
                        ),
                      ),
                      enabled: true,
                    ),
                    onFieldSubmitted: (value) async {
                      ref.read(updateNameProvider(value).future);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Color(0xff1f2232),
                          content: AutoSizeText(
                            "Relaunch the app "
                            "and discover your fresh name.",
                            style: TextStyle(fontFamily: 'Poppins'),
                            maxLines: 1,
                            minFontSize: 6,
                            maxFontSize: 12,
                          ),
                        ),
                      );
                      // ref.invalidate(myUserProvider);
                    },
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(left: 16.0),
            height: 24.h,
            child: FittedBox(
              child: TextButton(
                  onPressed: () => ref.read(signOutProvider),
                  child: const Text("Log out")),
            ),
          ),
        ],
      ),
    );
  }
}

class _DailyTournament extends StatelessWidget {
  const _DailyTournament({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jun1 = DateTime(2023, 6, 1);
    final Duration diff = DateTime.now().difference(jun1);

    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            margin: const EdgeInsets.only(bottom: 8.0),
            child: AutoSizeText.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: "Daily Tournament  ",
                    style: TextStyle(fontSize: 15),
                  ),
                  const TextSpan(text: "T"),
                  const TextSpan(text: "#", style: TextStyle(fontSize: 12)),
                  TextSpan(text: "${diff.inDays}"),
                ],
              ),
              style: const TextStyle(
                  color: Color(0xff3b1f2b),
                  fontFamily: 'LilitaOne',
                  fontSize: 18),
            ),
          ),
          // const Space10(),
          const _TodayPlayerList(),
        ],
      ),
    );
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
    return SizedBox(
      //  color: Colors.red,
      height: 300.h,
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
                            height: 66.h,
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

class _TitleX extends StatelessWidget {
  final String a;
  const _TitleX({required this.a});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: AutoSizeText(
          a,
          style: const TextStyle(
            color: Color(0xff3b1f2b),
            fontFamily: 'LilitaOne',
          ),
        ),
      ),
    );
  }
}

class _RecentPlayerList extends ConsumerWidget {
  const _RecentPlayerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(recentUserProvider).maybeWhen(
          orElse: () => Container(),
          data: (data) => ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 4.w),
            children: data.values
                .map(
                  (e) => _RecentPlayerListTile(user: e),
                )
                .toList(),
          ),
        );
  }
}

class _RecentPlayerListTile extends StatelessWidget {
  final MyUser user;
  const _RecentPlayerListTile({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 0.85,
        child: Align(
          alignment: Alignment.center,
          child: FadeIn(
            delay: const Duration(seconds: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 5,
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 1,
                    child: Opacity(
                      opacity: user.isActive ? 1 : 0.25,
                      child: CircleAvatar(
                        backgroundColor: const Color(0xff724cf9),
                        child: RandomAvatar(
                          user.avatar,
                          width: 72.h,
                          trBackground: true,
                        ),
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
                      child: Text(user.name),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
