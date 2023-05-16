import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import '../../my_widgets/my_names.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../logic/auth.dart';
import '../../logic/s_size.dart';
import '../../logic/tournament_datastore.dart';
import '../../logic/user_datastore.dart';
import '../../model/my_user.dart';
import '../../my_widgets/my_list_tile.dart';
import '../../my_widgets/today_leaderboard_list_view.dart';
import '../../my_widgets/today_list_view.dart';
import '../../routes/my_route.dart';

class DashboardP extends ConsumerWidget {
  const DashboardP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
              Container(
                width: 360.w,
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepPurpleAccent.shade700,
                height: 180.h,
                child: LayoutBuilder(
                  builder: (_, p1) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //color: Colors.white70,
                        padding: EdgeInsets.symmetric(
                            vertical: p1.maxHeight * 0.015),
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
              const DashboardSubHeader(title: "Players Online"),
              //SizedBox(height: 6.h),
              Container(
                height: 120.h,
                //color: Colors.red,
                alignment: Alignment.center,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.only(left: 2.0, top: 4.0, bottom: 4.0),
                  children: List.generate(
                      7,
                      (index) => AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              //color: Colors.green.shade100,
                              margin: const EdgeInsets.only(right: 2.0),
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
                ),
              ),
              Container(
                height: 115.w,
                //color: Colors.deepPurple,
                padding: EdgeInsets.only(
                  left: 9.w,
                  top: 9.h,
                ),
                alignment: Alignment.centerLeft,
                child: AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "Today\n",
                          style: TextStyle(
                            fontSize: 36,
                            //fontWeight: FontWeight.w300,
                          )),
                      TextSpan(
                        text: "Tournament",
                        style: TextStyle(
                            //fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                  style: TextStyle(
                    color: Colors.deepPurpleAccent.shade200,
                    fontFamily: 'Poppins',
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w100,
                  ),
                  minFontSize: 12,
                  maxFontSize: 72,
                  maxLines: 4,
                ),
              ),
              Container(
                height: 15.w,
                padding: EdgeInsets.only(
                  right: 12.w,
                ),
                alignment: Alignment.centerRight,
                child: FittedBox(
                    child: AutoSizeText(
                  "Ends at 9 pm IST",
                  style: TextStyle(color: Colors.deepPurple),
                )),
              ),
              Space10(),
            ] +
            List.generate(
              4,
              (index) => Container(
                height: 40.h,
                width: 320.w,
                margin: EdgeInsets.only(bottom: 4.h),
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0, right: 6.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.deepPurple.shade200, width: 0.2),
                  ),
                ),
                //color: Colors.red,
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "# ${index + 1}",
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    SizedBox(width: 9.w),
                    AspectRatio(
                      aspectRatio: 1,
                      child: CircleAvatar(
                        child: RandomAvatar(mockString()),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 100.w,
                      child: AutoSizeText(
                        myRandomName(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent),
                        maxFontSize: 12,
                        minFontSize: 6,
                        maxLines: 1,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: FractionallySizedBox(
                        //heightFactor: 0.6,
                        widthFactor: 0.8,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "01: ${mockInteger(10, 55)}",
                            style: TextStyle(
                              fontFamily: 'Orbitron',
                              //fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent,
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
    );
  }
}

class DashboardP2 extends ConsumerWidget {
  const DashboardP2({Key? key}) : super(key: key);

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
    return Center(
      child: Column(
        children: [
          const Space20(),
          const PlayTournamentButton(),
          const Space10(),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Flexible(
                    child: TabBar(
                      tabs: ["Today Scoreboard", "All time record"]
                          .map(
                            (e) => Tab(
                              child: AutoSizeText(
                                e,
                                maxLines: 1,
                                minFontSize: 12,
                                maxFontSize: 15,
                              ),
                              //text: e,
                            ),
                          )
                          .toList(),
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.h,
                        fontWeight: FontWeight.w700,
                      ),
                      onTap: (int page) {
                        if (page == 1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: AutoSizeText(
                                "Will be coming in the next release",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      unselectedLabelColor: Colors.indigo.shade200,
                      labelColor: Colors.deepPurple.shade400,
                      indicatorColor: Colors.deepPurple.shade400,
                    ),
                  ),
                  Flexible(
                    flex: 8,
                    child: FadeIn(child: TodayListView()),
                  ),
                ],
              ),
            ),
          ),
          const Space10(),
          const DashboardSubHeader(title: 'Available Players'),
          const Space10(),
          SizedBox(height: 120.h, child: const AvailablePlayersList()),
        ],
      ),
    );
  }
}

class DashboardP1 extends ConsumerWidget {
  const DashboardP1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser myUser = ref.watch(myUserProvider).value!;

    ref.listen(
      tScoresOnChangeProvider.select((value) => value.value),
      (previous, next) {
        if (next != null) {
          ref.read(tScoreListProvider.notifier).addItem(next);
        }
      },
    );

    return LayoutBuilder(
      builder: (_, p1) => Column(
        children: [
          //_MyProfileOpenContainer(myUser: myUser),
          Expanded(
            flex: 12,
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  /* Flexible(
                    child: TabBar(
                      tabs: ["Tournament", "Friendly Match"]
                          .map((e) => Tab(text: e))
                          .toList(),
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: p1.maxHeight * 0.0225,
                        fontWeight: FontWeight.w700,
                      ),
                      onTap: (int page) {
                        if (page == 1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: AutoSizeText(
                                "Will be coming in the next release",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      unselectedLabelColor: Colors.deepPurple.shade100,
                      labelColor: Colors.deepPurple.shade400,
                      indicatorColor: Colors.deepPurple.shade400,
                    ),
                  ),*/
                  Expanded(
                    flex: 7,
                    child: SingleChildScrollView(
                      child: Column(
                        children: const [
                          Space20(),
                          PlayTournamentButton(),
                          Space20(),
                          DashboardSubHeader(title: "Today's Leaderboard"),
                          Space10(),
                          TodayLeaderBoardListView(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // const Space20(),
          const DashboardSubHeader(title: "Available Players"),
          const Space20(),
          SizedBox(
            height: 90.h,
            child: const AvailablePlayersList(),
          ),
        ],
      ),
    );
  }
}

class AvailablePlayersList extends ConsumerWidget {
  const AvailablePlayersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
          5,
          (index) => AspectRatio(
                aspectRatio: 0.8,
                child: LayoutBuilder(
                  builder: (p0, p1) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: p1.maxWidth * 0.3,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          myRandomName(),
                          maxLines: 1,
                          minFontSize: 9,
                          maxFontSize: 12,
                        ),
                      ),
                      Flexible(
                        child: AutoSizeText(
                          myRandomName(),
                          maxLines: 1,
                          minFontSize: 6,
                          maxFontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}

class AvailablePlayersList2 extends ConsumerWidget {
  const AvailablePlayersList2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    return myUser == null
        ? Container()
        : ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(4.0),
            children: <Widget>[
                  SizedBox(
                    width: 90,
                    // color: Colors.primaries[mockInteger(0, Colors.primaries.length - 1)],
                    child: Column(
                      children: [
                        Flexible(
                          flex: 3,
                          child: FractionallySizedBox(
                            widthFactor: 0.95,
                            heightFactor: 0.95,
                            child: Container(
                              // color: Colors.brown,
                              child: RandomAvatar(myUser.avatar),
                            ),
                          ),
                        ),
                        Flexible(
                          child: FractionallySizedBox(
                            heightFactor: 0.75,
                            widthFactor: 1,
                            child: FittedBox(
                              child: AutoSizeText(
                                myUser.name,
                                style: TextStyle(),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: FractionallySizedBox(
                            heightFactor: 0.5,
                            child: FittedBox(
                              child: AutoSizeText(
                                myRandomName(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ] +
                List.generate(
                  8,
                  (index) => SizedBox(
                    width: 75,
                    // color: Colors.primaries[mockInteger(0, Colors.primaries.length - 1)],
                    child: Column(
                      children: [
                        Flexible(
                          flex: 3,
                          child: FractionallySizedBox(
                            widthFactor: 0.95,
                            heightFactor: 0.95,
                            child: Container(
                              // color: Colors.brown,
                              child: RandomAvatar(mockString()),
                            ),
                          ),
                        ),
                        Flexible(
                          child: FractionallySizedBox(
                            heightFactor: 0.75,
                            widthFactor: 1,
                            child: FittedBox(
                              child: AutoSizeText(myRandomName()),
                            ),
                          ),
                        ),
                        Flexible(
                          child: FractionallySizedBox(
                            heightFactor: 0.5,
                            child: FittedBox(
                              child: AutoSizeText(
                                myRandomName(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          );
  }
}

class AvailablePlayersList1 extends ConsumerWidget {
  const AvailablePlayersList1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    if (myUser == null) {
      return Container();
    } else {
      return ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 9.w),
        children: <Widget>[
              InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Container(
                  width: 60.w,
                  margin: EdgeInsets.only(right: 9.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.deepPurpleAccent.shade700,
                        child: RandomAvatar(myUser.avatar, trBackground: true),
                      ),
                      Flexible(
                        child: AutoSizeText(
                          myUser.name,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                          minFontSize: 6,
                          maxFontSize: 9,
                          maxLines: 2,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          ["Active", "Idle", "Playing"][0],
                          style: TextStyle(
                              fontSize: 9, color: Colors.green.shade700),
                        ),
                      ),
                      const Space10()
                    ],
                  ),
                ),
              )
            ] +
            List.generate(
              6,
              (index) => SizedBox(
                width: 75.w,
                //margin: EdgeInsets.only(right: 24.w),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.deepPurpleAccent.shade100,
                      child: RandomAvatar(mockString(), trBackground: true),
                    ),
                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.5,
                        heightFactor: 1,
                        child: FittedBox(
                          child: AutoSizeText(
                            myRandomName(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black54,
                            ),
                            minFontSize: 6,
                            maxFontSize: 9,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        ["Active", "Idle", "Playing"][mockInteger(0, 2)],
                        style: const TextStyle(
                          fontSize: 9, color: Colors.black54,
                          //color: Colors.green,
                        ),
                      ),
                    ),
                    const Space10()
                  ],
                ),
              ),
            ),
      );
    }
  }
}

class _MyProfileOpenContainer extends StatelessWidget {
  const _MyProfileOpenContainer({required this.myUser});

  final MyUser myUser;

  @override
  Widget build(BuildContext context) => OpenContainer(
        closedShape:
            const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        closedBuilder: (context, action) => Container(
          decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.zero,
          ),
          height: 120.h,
          padding: EdgeInsets.only(right: 8.w),
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
                                    const TextSpan(
                                        text: "Hi ",
                                        style: TextStyle(fontSize: 36)),
                                    TextSpan(text: myUser.name),
                                  ],
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.deepPurple, fontSize: 72,
                                  //decorationThickness: 40,
                                ),
                              ),
                            ),
                          ),
                          subtitle: Container(
                            height: 20.h,
                            //color: Colors.amber,
                            alignment: Alignment.centerLeft,
                            child: const FittedBox(
                              child: AutoSizeText(
                                "Hope you had a great day",
                                style: TextStyle(
                                  color: Colors.deepPurple,
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
      height: 24.h,
      padding: EdgeInsets.only(left: 8.w),
      alignment: Alignment.centerLeft,
      child: FittedBox(
        alignment: Alignment.centerLeft,
        child: AutoSizeText(
          title,
          style: const TextStyle(
            color: Colors.deepPurpleAccent,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
