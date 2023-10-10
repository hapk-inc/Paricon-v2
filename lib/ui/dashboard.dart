import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../logic/s_size.dart';
import '../../logic/user_datastore.dart';
import '../../theme/my_color.dart';
import '../logic/auth.dart';
import '../logic/dashboard_provider.dart';
import '../logic/my_names.dart';
import '../logic/remote_values.dart';
import '../model/my_user.dart';
import '../my_widget/daily_leaderboard.dart';
import '../router/my_route.dart';

@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize sSize = ref.read(sizeProvider);
    final MyUser? myUser = ref.watch(myUserProvider).value;

    List<Color> xRandom = [turquoise, pear, hunyadiYellow, salmon];
    xRandom.shuffle();

    return Scaffold(
      // appBar: buildAppBar(sSize, context),
      backgroundColor: ghostWhite,
      body: SlidingUpPanel(
        controller: ref.read(dashboardPanelProvider),
        panel: BottomSlidingUser(myUser: myUser),
        backdropColor: richBlack,
        backdropEnabled: true,
        backdropOpacity: 0.9,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        minHeight: 0,
        maxHeight: 600.h,
        body: sSize == ScreenSize.phone ? const DashboardP() : Container(),
      ),
    );
  }
}

class DashboardP extends ConsumerWidget {
  const DashboardP({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String inWork = ref.watch(inWorkProvider);
    //final MyUser? myUser = ref.watch(myUserProvider).value;
    final User fUser = ref.watch(firebaseUserProvider);

    List<Color> xRandom = [turquoise, pear, hunyadiYellow, salmon];
    xRandom.shuffle();

    return SafeArea(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: inWork.isNotEmpty && !kDebugMode
            ? DashboardWorkInProgress(inWork: inWork)
            // :  DashboardPState(fUser: fUser, xRandom: xRandom),
            : const DashboardBodyState(),
      ),
    );
  }
}

class DashboardBodyState extends StatelessWidget {
  const DashboardBodyState({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        mainAxisSpacing: 1.r,
        crossAxisSpacing: 1.r,
        // axisDirection: AxisDirection.up,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 9,
            child: Container(
              color: pictonBlue,
              padding: EdgeInsets.all(15.r),
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Container(
                        width: 102.w,
                        height: 30.h,
                        alignment: Alignment.bottomRight,
                        //color: jasmine,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 21.r,
                            color: barnRed,
                          ),
                          textAlign: TextAlign.end,
                          child: AnimatedTextKit(
                            animatedTexts: [
                              RotateAnimatedText("Exciting"),
                              RotateAnimatedText("Engaging"),
                              RotateAnimatedText(
                                "Challenging",
                                textStyle: TextStyle(fontSize: 18.r),
                              ),
                            ],
                            repeatForever: true,
                            pause: const Duration(milliseconds: 500),
                          ),
                        ),
                      ),
                    ),
                    /*WidgetSpan(
                      child: Container(
                        width: 150.w,
                        //color: blackOlive,
                        alignment: Alignment.centerLeft,
                        height: 30.h,
                        child: Text(
                          "puzzles await you.",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: barnRed,
                            fontSize: 18.r,
                          ),
                        ),
                      ),
                    ),*/
                    TextSpan(
                      text: " puzzle awaits you. ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: barnRed,
                        fontSize: 18.r,
                      ),
                    ),
                    TextSpan(
                      text: "Ready to try your skills with this game? ",
                      style: TextStyle(
                        fontSize: 14.4.r,
                      ),
                    ),
                    TextSpan(
                      text: "Click here",
                      style: TextStyle(
                        fontSize: 15.r,
                        color: darkGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                  style: TextStyle(
                    height: 2.1,
                    fontSize: 18.r,
                    color: barnRed,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
          /* StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 1.5,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 7.5.r),
              child: Text(
                "Users Who Recently Played . .",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  fontSize: 13.5.r,
                  color: lapisLazuli,
                ),
              ),
            ),
          ),*/
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 0.3,
            child: SizedBox(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 4.11,
            child: Container(
              padding: EdgeInsets.all(4.5.r),
              //color: coyote,
              child: const RecentPlayer(),
            ),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 0.3,
            child: SizedBox(),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 18,
            child: ColoredBox(color: darkGreen),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 7.2,
            child: ColoredBox(color: pictonBlue),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 4.5,
            child: ColoredBox(color: jasmine),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 9,
            mainAxisCellCount: 12,
            child: ColoredBox(color: barnRed),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 11,
            mainAxisCellCount: 7.2,
            child: ColoredBox(color: darkGreen),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 11,
            mainAxisCellCount: 4.8,
            child: ColoredBox(color: pear1),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 20,
            child: ColoredBox(color: blackOlive),
          )
        ],
      ),
    );
  }
}

class DashboardPState extends StatelessWidget {
  const DashboardPState({
    super.key,
    required this.fUser,
    required this.xRandom,
  });

  final User fUser;
  final List<Color> xRandom;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        mainAxisSpacing: 1.r,
        crossAxisSpacing: 1.r,
        children: [
          if (DateTime.now().difference(fUser.metadata.creationTime!) <
              const Duration(days: 1))
            const StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 8.1,
              child: FirstTimeUser(),
            ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 2.1,
            child: Container(
              //color: barnRed.withOpacity(0.21),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Recently Played",
                style: TextStyle(
                  fontSize: 15.r,
                  fontFamily: 'Montserrat',
                  // fontWeight: FontWeight.w300,
                  color: gray,
                ),
              ),
            ),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 19.2,
            child: DailyLeaderBoard(),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 0.9,
            child: SizedBox(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 8.4,
            child: TopPlayerList(xRandom: xRandom),
            //child: CardCollection(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 10,
            mainAxisCellCount: 15,
            child: Container(
              decoration: BoxDecoration(
                color: russianViolet,
                borderRadius: BorderRadius.circular(9.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    child: FractionallySizedBox(
                      heightFactor: 0.9,
                      widthFactor: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 9.r, horizontal: 15.r),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Play Online\n",
                                style: TextStyle(
                                  fontSize: 27.r,
                                  height: 1.8,
                                  color: azure,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                              TextSpan(
                                text: "Compete and Connect",
                                style: TextStyle(
                                    fontSize: 12.r,
                                    height: 2.1,
                                    color: gray,
                                    fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: FractionallySizedBox(
                      heightFactor: 1,
                      widthFactor: 1,
                      child: Lottie.asset('lottie/friends-playing.json'),
                    ),
                  ),
                ],
              ),
            ),
            //child: DashboardCarousel(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 10,
            mainAxisCellCount: 9.9,
            child: Container(
              decoration: BoxDecoration(
                color: barnRed,
                borderRadius: BorderRadius.circular(9.r),
              ),
              padding: EdgeInsets.all(7.5.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Enter Room code\n",
                          style: TextStyle(
                            fontSize: 27.r,
                            height: 1.8,
                            color: linen,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        TextSpan(
                          text: "Get Started...",
                          style: TextStyle(
                            fontSize: 12.r,
                            height: 2.1,
                            color: beaver,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  )
                  // Flexible(child: Pinput(length: 3)),
                  // Flexible(child: Pinput(length: 3)),
                ],
              ),
            ),
            //child: DashboardCarousel(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 10,
            mainAxisCellCount: 5,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: pictonBlue,
                borderRadius: BorderRadius.circular(9.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How to play",
                    style: TextStyle(
                      fontSize: 27.r,
                      height: 1.8,
                      color: ghostWhite,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    "Learn the Basics",
                    style: TextStyle(
                      fontSize: 12.r,
                      height: 2.1,
                      color: azure,
                      fontFamily: 'Poppins',
                    ),
                  )
                ],
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 1.8,
            child: Container(
              //color: barnRed.withOpacity(0.21),
              alignment: Alignment.bottomLeft,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent Users",
                  style: TextStyle(
                    fontSize: 15.r,
                    fontFamily: 'Montserrat',
                    //fontWeight: FontWeight.w300,
                    color: gray,
                  ),
                ),
              ),
            ),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 4.8,
            child: RecentPlayer(),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 9,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}

class DashboardWorkInProgress extends StatelessWidget {
  const DashboardWorkInProgress({super.key, required this.inWork});

  final String inWork;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          inWork,
          wrapWords: false,
          style: TextStyle(
            fontSize: 60.r,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            color: cadetGray,
          ),
        ),
        SizedBox(height: 9.r),
        Text(
          "Appreciate your patience",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18.r,
            fontWeight: FontWeight.w200,
            color: gunMetal,
            letterSpacing: .3.r,
          ),
        ),
      ],
    );
  }
}

class TopPlayerList extends StatelessWidget {
  const TopPlayerList({super.key, required this.xRandom});

  final List<Color> xRandom;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: onyx, borderRadius: BorderRadius.circular(9.r)),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 180.w,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15.r),
            margin: EdgeInsets.only(right: 15.r, top: 7.5.r, bottom: 7.5.r),
            decoration: BoxDecoration(
                color: onyx, borderRadius: BorderRadius.circular(6.r)),
            child: AutoSizeText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Top Players\n",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30.r,
                      color: teaRed,
                      height: 1.5,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextSpan(
                    text: "Leaders of the Pack",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white54,
                      fontSize: 13.5.r,
                      height: 2.4,
                    ),
                  )
                ],
              ),
            ),
          ),
          ...List.generate(
            9,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: 96.r,
              margin: EdgeInsets.symmetric(horizontal: 9.r, vertical: 6.r),
              decoration: BoxDecoration(
                color: xRandom[index % 4],
                borderRadius: BorderRadius.circular(5.4.r),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 12.r,
                    top: 12.r,
                    child: AutoSizeText(
                      "${mockInteger(1, 5).toString().padLeft(2, '0')}\n${mockInteger(1, 59).toString().padLeft(2, '0')}",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 45.r,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        //letterSpacing: 1.r,
                        color: ghostWhite,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    left: -60.r,
                    bottom: -15.r,
                    width: 135.r,
                    height: 135.r,
                    child: RandomAvatar(mockString(), trBackground: true),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FirstTimeUser extends StatelessWidget {
  const FirstTimeUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: magnolia,
      padding: EdgeInsets.all(7.5.r),
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: ConfettiController(),
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
                  true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
              //createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
          FadeInRight(
            duration: const Duration(milliseconds: 500),
            child: AutoSizeText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "You have Logged in successfully.\n",
                    style: TextStyle(
                      fontSize: 30.r,
                      height: 1.8,
                      letterSpacing: 0,
                      //wordSpacing: 1.r,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: darkGreen,
                    ),
                  ),
                  TextSpan(
                    text: "It's time to",
                    style: TextStyle(
                      fontSize: 15.r,
                      fontWeight: FontWeight.w700,
                      color: battleshipGray,
                    ),
                  ),
                  TextSpan(
                    text: " play your first game.",
                    style: const TextStyle(
                      color: darkPastelGreen,
                      fontWeight: FontWeight.w700,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.router.push(const TournamentRoute());
                      },
                  ),
                ],
                style: TextStyle(
                    fontFamily: "Poppins",
                    color: spaceCadet,
                    fontSize: 18.r,
                    height: 2.1),
              ),
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class RecentPlayer extends StatelessWidget {
  const RecentPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 3.w, top: 3.h),
      children: List.generate(
        10,
        (index) => const RecentPlayerTile(),
      ),
    );
  }
}

class RecentPlayerTile extends StatelessWidget {
  const RecentPlayerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.93,
      child: LayoutBuilder(
        builder: (_, p1) => Column(
          children: [
            Flexible(
              flex: 4,
              child: Stack(
                children: [
                  Positioned(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.72,
                    bottom: p1.maxWidth * 0.05,
                    child: const CircleAvatar(backgroundColor: iris),
                  ),
                  Positioned(
                    bottom: p1.maxWidth * 0.075,
                    height: p1.maxHeight * 0.8,
                    width: p1.maxWidth,
                    child: RandomAvatar(mockString(), trBackground: true),
                  )
                ],
              ),
            ),
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 0.87,
                widthFactor: 1,
                child: FittedBox(
                  child: Text(
                    myRandomName(),
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins',
                      color: spaceCadet,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSlidingUser extends ConsumerWidget {
  const BottomSlidingUser({
    super.key,
    required this.myUser,
  });

  final MyUser? myUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 24.r, left: 15.r, right: 15.r),
        child: StaggeredGrid.count(
          crossAxisCount: 20,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 15,
              mainAxisCellCount: 2.1,
              child: Container(
                // color: Colors.red,
                alignment: Alignment.centerLeft,
                child: Text(
                  myUser!.name,
                  style: TextStyle(fontSize: 21.r, fontFamily: 'Montserrat'),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 15,
              mainAxisCellCount: 1.2,
              child: Container(
                //color: Colors.yellow,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 1.5.r),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${myUser?.id}",
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const TextSpan(text: "    "),
                      TextSpan(
                        text: "${mockInteger(1, 30)} July,2023",
                        style: const TextStyle(color: darkPastelGreen),
                      ),
                    ],
                    style: TextStyle(
                      fontSize: 10.8.r,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: russianViolet,
                    ),
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 5,
              mainAxisCellCount: 4.5,
              child: Container(
                color: Colors.teal,
                padding: EdgeInsets.all(1.2.r),
                child: const CircleAvatar(),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 15,
              mainAxisCellCount: 1.8,
              child: Container(
                //color: Colors.indigo.shade50,
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.heart_broken_rounded,
                      size: 24.r,
                    ),
                    SizedBox(width: 4.5.r),
                    Text(
                      "${mockInteger(1, 300)} liked your profile",
                      style: TextStyle(
                        fontFamily: 'Cabin',
                        fontSize: 13.5.r,
                        color: ebony,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 7.5,
              child: Container(
                margin: EdgeInsets.only(top: 15.r),
                decoration: BoxDecoration(
                  color: mintCream,
                  borderRadius: BorderRadius.circular(9.r),
                ),
                padding: EdgeInsets.all(7.5.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mockInteger(0, 1) == 0
                          ? "Receive new avatars by sharing the code and instructing them to enter it."
                          : "Obtain updated avatars through code sharing and inviting them to enter it",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        fontSize: 15.r,
                        color: coyote,
                        height: 2.1,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(3.r),
                        //  alignment: Alignment.bottomLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AutoSizeText(
                              mockString(6).toUpperCase(),
                              style: TextStyle(
                                fontSize: 30.r,
                                letterSpacing: 0.3.r,
                                color: oxfordBlue,
                                fontFamily: 'Montserrat',
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(
                                left: 4.5.r,
                                bottom: 4.5.r,
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Icon(Icons.share, size: 15.r),
                              ),
                            ),
                            const Spacer(),
                            //bronze
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 9,
              child: Container(
                margin: EdgeInsets.only(top: 15.r),
                //color: Colors.amber.shade50,
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 3,
              child: Container(
                color: beige,
                margin: EdgeInsets.symmetric(vertical: 7.5.r),
                padding:
                    EdgeInsets.symmetric(horizontal: 7.5.r, vertical: 2.1.r),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      width: 120.w,
                      child: Text(
                        "Best Score",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            color: russianViolet,
                            fontSize: 15.r),
                      ),
                    ),
                    //SizedBox(width: 15.r),
                    RichText(
                      text: TextSpan(
                        text: "${mockInteger(1, 5).toString().padLeft(2, '0')}:"
                            "${mockInteger(1, 59).toString().padLeft(2, '0')} ",
                        children: [
                          TextSpan(
                            text: "${mockInteger(100, 599)}",
                            style: TextStyle(
                              fontSize: 12.r,
                              color: beaver,
                            ),
                          )
                        ],
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          // fontStyle: FontStyle.italic,
                          color: cafeNoir,
                          fontSize: 16.5.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 2.4,
              child: Container(
                color: beige,
                padding: EdgeInsets.symmetric(horizontal: 7.5.r),
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    ref.read(signOutProvider);
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(fontSize: 18.r, fontFamily: 'Montserrat'),
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
