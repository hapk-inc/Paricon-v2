import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mock_data/mock_data.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../logic/s_size.dart';
import '../../logic/user_datastore.dart';
import '../../theme/my_color.dart';
import '../logic/auth.dart';
import '../logic/dashboard_provider.dart';
import '../logic/firebase_init.dart';
import '../logic/remote_values.dart';
import '../model/my_user.dart';
import '../my_widget/short_leaderboard.dart';
import '../router/my_route.dart';
import 'dashboard_widget/d_play_online.dart';
import 'dashboard_widget/d_recent_player.dart';
import 'dashboard_widget/d_welcome.dart';

@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize sSize = ref.read(sizeProvider);
    final MyUser? myUser = ref.watch(myUserProvider).value;

    List<Color> xRandom = [turquoise, pear, hunyadiYellow, salmon];
    xRandom.shuffle();

    final dPanelController = ref.watch(dashboardPanelProvider);

    ref.listen(
      internetConnectionProvider.select((value) => value.value),
      (previous, next) {
        debugPrint("$next");
        if (next != null) {
          debugPrint("40-connection-$next");
          bool noNet = next == ConnectivityResult.none;
          if (noNet) {
            if (dPanelController.isPanelClosed) {
              dPanelController.open();
            }
          } else {
            if (dPanelController.isPanelOpen) {
              dPanelController.close();
            }
          }
        }
      },
    );

    return Scaffold(
      // appBar: buildAppBar(sSize, context),
      backgroundColor: ghostWhite,
      appBar: AppBar(toolbarHeight: 1.h, backgroundColor: majorelleBlue),
      body: SlidingUpPanel(
        controller: dPanelController,
        panel: Container(),
        backdropColor: richBlack,
        backdropEnabled: true,
        backdropOpacity: 0.9,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
        minHeight: 00.h,
        maxHeight: 300.h,
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
      bottom: false,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: (inWork.isNotEmpty && !kDebugMode)
            ? DashboardWorkInProgress(inWork: inWork)
            : const DashboardBodyState(),
      ),
    );
  }
}

class DashboardBodyState extends ConsumerWidget {
  const DashboardBodyState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        mainAxisSpacing: 1.r,
        crossAxisSpacing: 1.r,
        children: [
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 9,
            child: DWelcome(),
          ),
          buildStaggeredSpace,
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 4.2,
            child: RecentPlayer(),
          ),
          buildStaggeredSpace,
          buildStaggeredSpace,
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 15,
            child: Container(
              //color: darkGreen,
              padding: EdgeInsets.only(left: 12.w, right: 9.w),
              child: CarouselSlider(
                items: [
                  Container(
                    decoration: BoxDecoration(
                      color: jasmine,
                      borderRadius: BorderRadius.circular(7.5.r),
                    ),
                    // constraints: const BoxConstraints.expand(),
                    margin: EdgeInsets.only(right: 9.r),
                    padding: EdgeInsets.only(left: 9.r, top: 9.r, right: 9.r),
                    child: Wrap(
                      //runAlignment: WrapAlignment.center,
                      runSpacing: .15.r,
                      children: [
                        Container(
                          height: 45.h,
                          alignment: Alignment.centerLeft,
                          child: AnimatedTextKit(
                            pause: const Duration(milliseconds: 300),
                            animatedTexts:
                                ["Exciting", "Engaging", "Challenging"]
                                    .map(
                                      (e) => RotateAnimatedText(e,
                                          duration:
                                              const Duration(milliseconds: 900),
                                          alignment: Alignment.centerLeft,
                                          textStyle: TextStyle(
                                            fontFamily: 'DelaGothic',
                                            fontSize: 30.r,
                                            color: [
                                              rosePink,
                                              cerise,
                                              amaranthPurple
                                            ][mockInteger(0, 2)],
                                          ),
                                          rotateOut: false),
                                    )
                                    .toList(),
                            totalRepeatCount: 9,
                            //repeatForever: true,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(text: "puzzles await you. "),
                              const TextSpan(
                                text: "Are you ready for the ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  height: 3,
                                ),
                              ),
                              TextSpan(
                                text: "challenge",
                                style: TextStyle(
                                  color: pakistanGreen,
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.6.r,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 1.2,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => context.router
                                      .push(const TournamentRoute()),
                              ),
                              const TextSpan(
                                text: "?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  height: 3,
                                ),
                              )
                            ],
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: oxfordBlue,
                              fontSize: 15.r,
                              height: 2.4,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: azure,
                      borderRadius: BorderRadius.circular(7.5.r),
                    ),
                    padding: EdgeInsets.only(left: 9.r, top: 9.r),
                    constraints: const BoxConstraints.expand(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*  Text(
                          "LeaderBoard",
                          style: TextStyle(
                            fontSize: 15.r,
                            color: darkGreen,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        SizedBox(height: 15.r),*/
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 6.r),
                            child: const ShortLeaderBoard(),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
                options: CarouselOptions(
                  padEnds: false,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.72,
                  aspectRatio: 1.5,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.15,
                ),
              ),
            ),
          ),
          buildStaggeredSpace,
          buildStaggeredSpace,
          const StaggeredGridTile.count(
            crossAxisCellCount: 9,
            mainAxisCellCount: 12,
            child: PlayOnlineButton(),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 11,
            mainAxisCellCount: 12,
            child: PlayWithStranger(),
          ),
          buildStaggeredSpace,
          buildStaggeredSpace,
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 6,
            child: ColoredBox(color: majorelleBlue),
          ),
          buildStaggeredSpace,
          buildStaggeredSpace,
          /*  StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 9,
            child: Container(
              decoration: BoxDecoration(
                color: jasper,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              margin: EdgeInsets.symmetric(horizontal: 4.5.r),
              padding: EdgeInsets.symmetric(horizontal: 7.5.r, vertical: 4.5.r),
              child: LayoutBuilder(
                builder: (_, p) => Stack(
                  children: [
                    */ /* Positioned(
                      top: -p.maxWidth * 0.015,
                      left: -p.maxWidth * 0.12,
                      width: p.maxWidth * 0.54,
                      child: Container(
                        alignment: Alignment.center,
                        child: Lottie.asset(
                          'lottie/b_female_01.json',
                          height: p.maxHeight,
                          repeat: true,
                        ),
                      ),
                    ),*/ /*
                    Positioned(
                      width: p.maxWidth * 0.9,
                      height: p.maxHeight * 0.75,
                      right: 0,
                      top: p.maxHeight * 0.0012,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Discover New Profile Designs\n",
                                style: TextStyle(
                                  fontSize: 20.1.r,
                                  fontFamily: 'DelaGothic',
                                  height: 1.8,
                                  color: xWhite,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: "Find a new look that suits your style.",
                                style: TextStyle(
                                  fontSize: 12.r,
                                  fontFamily: 'Poppins',
                                  height: 2.4,
                                  color: xWhite,
                                  fontWeight: FontWeight.w200,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      height: p.maxHeight * 0.18,
                      width: p.maxWidth * 0.66,
                      right: 0,
                      bottom: p.maxHeight * 0.045,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            side: MaterialStatePropertyAll(
                              BorderSide(
                                color: lime,
                                width: 0.6,
                              ),
                            ),
                          ),
                          child: Text(
                            "Check now",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: xWhite,
                              fontWeight: FontWeight.w300,
                              fontSize: 12.r,
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
          buildStaggeredSpace,
          buildStaggeredSpace,*/
          /* StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 9,
            child: Container(
              padding: EdgeInsets.all(3.r),
              color: blackOlive,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 4,
                    child: Image.asset(
                      'images/pi.png',
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Flexible(
                    child: FittedBox(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.r, vertical: 7.5.r),
                        child: Text(
                          "App Version: ",
                          style: TextStyle(
                            fontSize: 15.r,
                            fontFamily: 'Poppins',
                            color: ghostWhite,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )*/
        ],
      ),
    );
  }

  StaggeredGridTile get buildStaggeredSpace {
    return const StaggeredGridTile.count(
      crossAxisCellCount: 20,
      mainAxisCellCount: 0.15,
      child: SizedBox(),
    );
  }
}

class DashboardWorkInProgress extends StatelessWidget {
  const DashboardWorkInProgress({super.key, required this.inWork});

  final String inWork;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7.5.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            inWork,
            wrapWords: false,
            style: TextStyle(
              fontSize: 90.r,
              fontFamily: 'DelaGothic',
              fontWeight: FontWeight.w900,
              color: jasmine,
              height: 1.5,
            ),
          ),
          SizedBox(height: 9.r),
          Text(
            "Appreciate your patience",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18.r,
              fontWeight: FontWeight.w300,
              color: jasper,
              height: 2.1,
              letterSpacing: .3.r,
            ),
          ),
        ],
      ),
    );
  }
}

/*
* Certainly, here are five variations of the message for first-time users in your app:

"Hello, new user! You've unlocked a fresh avatar. Simply click here to set it as your profile picture."

"Welcome, newcomer! Congratulations on earning a new avatar. To make it your profile picture, just click here."

"Hey there, first-time user! You've got a brand-new avatar waiting. Click here to give it a spin as your profile pic."

"Greetings, newbie! A shiny new avatar is yours to claim. To make it your profile image, click right here."

"Hello to our newest user! You've earned a cool new avatar. To use it as your profile picture, just click here."*/
