import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/ui/dashboard/dashboard_p1.dart';
import '../../logic/auth.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../logic/tournament_datastore.dart';
import '../../logic/user_datastore.dart';
import '../../model/my_user.dart';
import '../../model/t_score.dart';
import '../../my_widgets/daily_challenge_score_tile.dart';
import '../../my_widgets/my_list_tile.dart';
import '../../routes/my_route.dart';

class DashboardP2 extends StatelessWidget {
  const DashboardP2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SlidingUpPanel(
        body: Column(
          children: [
            SizedBox(height: 800.h, child: const _DashboardBody()),
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
    ref.listen(
      tScoresOnChangeProvider.select((value) => value.value),
      (previous, next) {
        if (next != null) {
          ref.read(tScoreListProvider.notifier).addItem(next);
        }
      },
    );

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const Space10(),
          Container(
            height: 60.h,
            alignment: Alignment.centerLeft,
            child: FadeInRight(child: const _DashboardTab()),
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

class _DashboardTab extends ConsumerWidget {
  const _DashboardTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    return ButtonsTabBar(
      radius: 6.w,
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
      tabs: [
        const Tab(text: "Daily Tournament"),
        Tab(text: myUser == null ? "You" : myUser.name),
      ],
    );
  }
}

class _DailyTournament extends ConsumerWidget {
  const _DailyTournament({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TScore> todayUniqueTScores =
        ref.watch(todayUniqueTScoreProvider);
    return Column(
      children: [
        //const Space10(),
        SizedBox(
          //color: Colors.red,
          height: 120.h,
          width: 360.w,
          child: CarouselSlider(
            items: [
              FadeInRight(child: const _OverallGames()),
            ],
            options: CarouselOptions(
              scrollPhysics: const NeverScrollableScrollPhysics(),
              viewportFraction: 0.95,
              disableCenter: true,
              enlargeCenterPage: true,
            ),
          ),
        ),
        Expanded(
          child: todayUniqueTScores.isEmpty
              ? const _FirstPlayerTournament()
              : Container(
                  //color: Colors.red,
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    children: [
                      const Space10(),
                      const _TitleX(a: "Recently Played"),
                      SizedBox(
                        height: 111.h,
                        child: const _AvailablePlayerList(),
                      ),
                      const _TodayPlayerList(),
                    ],
                  ),
                ),
        )
      ],
    );
  }
}

class _FirstPlayerTournament extends StatelessWidget {
  const _FirstPlayerTournament();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Space10(),
          Text(
            mockInteger(0, 1) == 0
                ? "Kickstart the tournament by being the pioneer and "
                    "securing a straightforward win."
                : "Seize the opportunity to claim a simple victory in today's tournament",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'LilitaOne',
              color: const Color(0xff307473),
              height: 2.5.h,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(bottom: 16.0, right: 16),
              child: SizedBox.square(
                dimension: 180.w,
                child: FittedBox(child: Lottie.asset('assets/joystick.json')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TodayPlayerList extends ConsumerWidget {
  const _TodayPlayerList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TScore> todayUniqueTScores =
        ref.watch(todayUniqueTScoreProvider);
    final MyUser? _myUser = ref.watch(myUserProvider).value;
    todayUniqueTScores.sort((a, b) => a.tDuration!.compareTo(b.tDuration!));
    final User user = ref.watch(firebaseUserProvider);
    int _take = 4;
    TScore? _myTScore;
    bool showExtra = false;
    if (todayUniqueTScores.any((element) => element.userId == user.uid)) {
      _myTScore = todayUniqueTScores
          .firstWhere((element) => element.userId == user.uid);
      if (!(todayUniqueTScores.indexOf(_myTScore) < 3)) {
        showExtra = true;
        _take = 3;
      }
    }
    return SizedBox(
      height: 320.h,
      child: ListView(
        padding: const EdgeInsets.only(right: 4.0),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ...List.of(todayUniqueTScores
              .take(_take)
              .map((e) => ref.watch(xUserProvider(e.userId!)).when(
                    data: (data) => FadeInRight(
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
                        height: 75.h,
                        child: DailyChallengeScoreTile(
                            rank: todayUniqueTScores.indexOf(e) + 1,
                            myUser: data,
                            tDuration: e.tDuration!),
                      ),
                    ),
                    error: (error, stackTrace) => Container(),
                    loading: () => Container(),
                  ))),
          if (showExtra && _myUser != null)
            FadeInRight(
              delay: Duration(
                  milliseconds:
                      (200 * (todayUniqueTScores.indexOf(_myTScore!) + 1))
                          .toInt()),
              child: SizedBox(
                height: 75.h,
                child: DailyChallengeScoreTile(
                  rank: todayUniqueTScores.indexOf(_myTScore) + 1,
                  myUser: _myUser,
                  tDuration: _myTScore.tDuration!,
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

class _AvailablePlayerList extends ConsumerWidget {
  const _AvailablePlayerList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TScore> todayUniqueTScores =
        ref.watch(todayUniqueTScoreProvider);
    todayUniqueTScores.sort((a, b) => b.playedAt!.compareTo(a.playedAt!));
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      children: List.generate(
        todayUniqueTScores.length,
        (index) => AspectRatio(
          aspectRatio: 0.95,
          child: Align(
            alignment: Alignment.center,
            child: ref
                .watch(xUserProvider(todayUniqueTScores[index].userId!))
                .when(
                  data: (myUser) => FadeIn(
                    delay: Duration(seconds: index),
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
                                myUser.avatar,
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
                              child: Text(myUser.name),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  error: (error, stackTrace) => Container(),
                  loading: () => Container(),
                ),
          ),
        ),
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
              color: Color(0xff3b1f2b), fontFamily: 'LilitaOne'),
        ),
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(BuildContext context) {
    final jun1 = DateTime(2023, 6, 1);
    final Duration diff = DateTime.now().difference(jun1);
    //print(diff.inDays);
    return ElevatedButton(
      onPressed: () {
        context.router.push(const TournamentRoute());
      },
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color(0xff0d1821)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: FittedBox(
          child: Text(
            "Play Tournament  T#${diff.inDays}",
            style: const TextStyle(
                fontFamily: 'LilitaOne', color: Color(0xfffde8e9)),
          ),
        ),
      ),
    );
  }
}

class _OverallGames extends ConsumerWidget {
  const _OverallGames();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int? tCount = ref.watch(tCountProvider).value;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffe54f6d),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: LayoutBuilder(
        builder: (_, p1) => Stack(
          children: [
            Positioned(
              width: p1.maxWidth * 0.9,
              top: p1.maxHeight * 0.15,
              left: p1.maxWidth * 0.05,
              height: p1.maxHeight * 0.45,
              child: Container(
                alignment: Alignment.centerLeft,
                child: AutoSizeText.rich(
                  _randomTournamentText(tCount ?? 0),
                ),
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

TextSpan _randomTournamentText(int value) {
  final int a = mockInteger(0, 2);
  //const int a = 1;
  switch (a) {
    case 0:
      return TextSpan(
        children: [
          TextSpan(text: value.toString()),
          TextSpan(
            text: "games played so far",
            style: TextStyle(fontSize: 16.sp),
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
          const TextSpan(text: "Users have logged"),
          TextSpan(
            text: " $value",
            style: const TextStyle(fontSize: 28),
          ),
          const TextSpan(text: " games played until now"),
        ],
        style: const TextStyle(
          fontSize: 24,
          height: 1,
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
          const TextSpan(text: " games have been completed in the tournament."),
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

class _Statistics extends ConsumerWidget {
  const _Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Space10(),
        const _TitleX(a: "Yesterday Winners"),
        Container(
          height: 150.h,
          color: const Color(0xff8c1c13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) => Flexible(
                child: Container(
                  color: Colors.white70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.h,
                        color: Colors.blue,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            mockInteger(100, 200).toString(),
                            style: const TextStyle(fontFamily: 'LilitaOne'),
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
    );
  }
}

final TextEditingController _nameController = TextEditingController();

class _MyBio extends ConsumerWidget {
  const _MyBio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider).value;
    final User user = ref.watch(firebaseUserProvider);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          FadeInRight(
            child: Container(
              height: 120.h,
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                color: const Color(0xff8c1c13),
                borderRadius: BorderRadius.circular(8),
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
                              contentPadding: EdgeInsets.zero,
                              minVerticalPadding: 0,
                              title: Container(
                                height: 45.h,
                                //color: Colors.red,
                                alignment: Alignment.centerLeft,
                                child: FittedBox(
                                  child: AutoSizeText(
                                    myUser.name,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xfffde8e9),
                                      fontSize: 72,
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
                                    "ID: ${myUser.id}",
                                    style: const TextStyle(
                                      color: Color(0xffbf4342),
                                      fontFamily: 'BrunoAceSC',
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
          ),
          ExpansionTile(
            initiallyExpanded: user.displayName == null,
            title: TitleX(
                a: user.displayName == null
                    ? "Complete your Bio"
                    : "Edit Name"),
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
                height: 80.h,
                margin: EdgeInsets.only(bottom: 24.h),
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
                        /* style: ButtonStyle(
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
              /*SizedBox(
                height: 30.h,
                width: 320.w,
                child: TitleX(a: "Continue with which account"),
              ),
              ButtonBar(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        width: 90,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.phone, size: 12),
                            SizedBox(width: 10.w),
                            const Text(
                              "PHONE",
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 10),
                            ),
                          ],
                        ),
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        width: 90,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.phone, size: 12),
                            SizedBox(width: 10.w),
                            const Text(
                              "PHONE",
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 10),
                            ),
                          ],
                        ),
                      )),
                ],
              )*/
              /* Container(
                height: 80.h,
                margin: EdgeInsets.only(bottom: 24.h),
                padding: EdgeInsets.only(top: 8.h),
              ),*/
            ],
          ),
          /*  SizedBox(
            height: 90.h,
            child: Row(
              children: [
                Flexible(
                    child: ListTile(
                  title: Container(
                    //color: Colors.teal,
                    height: 20.h,
                    alignment: Alignment.centerLeft,
                    child: const FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Best Record",
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Color(0xff5ca4a9)),
                      ),
                    ),
                  ),
                  subtitle: Container(
                    //color: Colors.blue,
                    height: 40.h,
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${mockInteger(100, 200)}",
                        style: const TextStyle(
                            fontFamily: 'BrunoAceSC', color: Color(0xffed6a5a)),
                      ),
                    ),
                  ),
                )),
                Flexible(
                  child: ListTile(
                    title: Container(
                      //color: Colors.teal,
                      height: 20.h,
                      alignment: Alignment.centerLeft,
                      child: const FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Overall Rank",
                          style: TextStyle(
                              fontFamily: 'Poppins', color: Color(0xff71816d)),
                        ),
                      ),
                    ),
                    subtitle: Container(
                      //color: Colors.blue,
                      height: 40.h,
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${mockInteger(10, 20)}",
                          style: const TextStyle(
                              fontFamily: 'BrunoAceSC',
                              color: Color(0xffda667b)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // const Space10(),
          SizedBox(
            height: 90.h,
            child: Row(
              children: [
                Flexible(
                    child: ListTile(
                  title: Container(
                    //color: Colors.teal,
                    height: 20.h,
                    alignment: Alignment.centerLeft,
                    child: const FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Best Record",
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Color(0xff5ca4a9)),
                      ),
                    ),
                  ),
                  subtitle: Container(
                    //color: Colors.blue,
                    height: 40.h,
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${mockInteger(100, 200)}",
                        style: const TextStyle(
                            fontFamily: 'BrunoAceSC', color: Color(0xffed6a5a)),
                      ),
                    ),
                  ),
                )),
                Flexible(
                  child: ListTile(
                    title: Container(
                      //color: Colors.teal,
                      height: 20.h,
                      alignment: Alignment.centerLeft,
                      child: const FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Overall Rank",
                          style: TextStyle(
                              fontFamily: 'Poppins', color: Color(0xff71816d)),
                        ),
                      ),
                    ),
                    subtitle: Container(
                      //color: Colors.blue,
                      height: 40.h,
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${mockInteger(10, 20)}",
                          style: const TextStyle(
                              fontFamily: 'BrunoAceSC',
                              color: Color(0xffda667b)),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: ListTile(
                    title: Container(
                      //color: Colors.teal,
                      height: 20.h,
                      alignment: Alignment.centerLeft,
                      child: const FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Overall Rank",
                          style: TextStyle(
                              fontFamily: 'Poppins', color: Color(0xff71816d)),
                        ),
                      ),
                    ),
                    subtitle: Container(
                      //color: Colors.blue,
                      height: 40.h,
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${mockInteger(10, 20)}",
                          style: const TextStyle(
                              fontFamily: 'BrunoAceSC',
                              color: Color(0xffda667b)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const _TitleX(a: "Tournament History"),*/
          const Spacer(),
          Container(
            height: 60.h,
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                if (!user.isAnonymous) {
                  ref.read(signOutProvider);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            flex: 6,
                            child: AutoSizeText(
                              "All deleted, as you're anonymous",
                              style: TextStyle(fontFamily: 'Poppins'),
                              maxLines: 1,
                              maxFontSize: 10,
                              minFontSize: 6,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Flexible(
                            flex: 2,
                            child: InkWell(
                              onTap: () => ref.read(signOutProvider),
                              child: const AutoSizeText(
                                "Yes Proceed",
                                minFontSize: 6,
                                maxFontSize: 12,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.teal,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
              child: const Text(
                "Log out",
                style: TextStyle(color: Color(0xffA76D60), fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
