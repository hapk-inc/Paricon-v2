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
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../logic/s_size.dart';
import '../../theme/my_color.dart';
import '../logic/auth.dart';
import '../logic/dashboard_provider.dart';
import '../logic/firebase_init.dart';
import '../logic/remote_values.dart';
import '../my_widget/short_leaderboard.dart';
import '../router/my_route.dart';
import 'dashboard_widget/d_drawer.dart';
import 'dashboard_widget/d_play_online.dart';
import 'dashboard_widget/d_recent_player.dart';
import 'dashboard_widget/d_welcome.dart';

@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize sSize = ref.read(sizeProvider);

    List<Color> xRandom = [turquoise, pear, hunyadiYellow, salmon];
    xRandom.shuffle();

    final Widget panelWidget = ref.watch(internetConnectionProvider).when(
        data: (connectionResult) => connectionResult == ConnectivityResult.none
            ? const NoInternetPanel()
            : Container(),
        error: (_, __) => Container(),
        loading: () => Container());

    final PanelController dPanelController = ref.watch(dashboardPanelProvider);

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
      drawer: const Drawer(
        backgroundColor: majorelleBlue,
        child: SafeArea(
          child: DDrawer(),
        ),
      ),
      appBar: AppBar(toolbarHeight: 1.h, backgroundColor: majorelleBlue),
      body: SlidingUpPanel(
        controller: dPanelController,
        panel: panelWidget,
        isDraggable: false,
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

class NoInternetPanel extends ConsumerWidget {
  const NoInternetPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(3.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: AspectRatio(
              aspectRatio: 1,
              child: Lottie.asset('lottie/no_net.json'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: ListTile(
                isThreeLine: true,
                title: Text(
                  "No Internet now!",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: gray,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.r,
                  ),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    text: "Once you're connected to the internet, simply\n",
                    children: [
                      TextSpan(
                        text: "click here",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => ref.refresh(checkNetProvider),
                        style: const TextStyle(
                          color: darkPastelGreen,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(
                          text: " to initiate the app, once internet is on."),
                    ],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      height: 1.8,
                      fontSize: 13.5.r,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          )
        ],
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
                            totalRepeatCount: 1,
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
                                  height: 2.1,
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
                              ),
                              const TextSpan(text: " Click here")
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
            child: DashboardFooter(),
          ),
          buildStaggeredSpace,
          buildStaggeredSpace,
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

class DashboardFooter extends ConsumerWidget {
  const DashboardFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String appVersion = ref.watch(packageInfoProvider).when(
          data: (x) => x.version,
          error: (_, __) => "Error",
          loading: () => "0.0.0",
        );
    return Container(
      color: majorelleBlue,
      padding: EdgeInsets.only(left: 4.5.r, top: 9.r),
      alignment: Alignment.topLeft,
      child: Wrap(
        children: [
          TextButton(
            onPressed: () => ref.read(signOutProvider),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: "App Version v "),
                  TextSpan(
                    text: appVersion,
                    style: TextStyle(
                      letterSpacing: 1.5.r,
                      fontSize: 18.r,
                      color: oldRose,
                    ),
                  ),
                ],
              ),
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: oldRose,
                fontSize: 15.r,
                fontWeight: FontWeight.w200,
              ),
            ),
          )
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
