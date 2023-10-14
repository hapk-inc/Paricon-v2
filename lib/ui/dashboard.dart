import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../logic/s_size.dart';
import '../../logic/user_datastore.dart';
import '../../theme/my_color.dart';
import '../logic/auth.dart';
import '../logic/dashboard_provider.dart';
import '../logic/remote_values.dart';
import '../model/my_user.dart';
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

    return Scaffold(
      // appBar: buildAppBar(sSize, context),
      backgroundColor: ghostWhite,
      body: SlidingUpPanel(
        controller: ref.read(dashboardPanelProvider),
        panel: Container(),
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

class DashboardBodyState extends StatelessWidget {
  const DashboardBodyState({super.key});

  @override
  Widget build(BuildContext context) {
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
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 15.6,
            child: ColoredBox(
              color: darkGreen,
              child: CarouselSlider(
                items: [],
                options: CarouselOptions(),
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
            mainAxisCellCount: 7.5,
            child: ColoredBox(color: majorelleBlue),
          ),
          buildStaggeredSpace,
          buildStaggeredSpace,
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 8.1,
            child: Container(
              decoration: BoxDecoration(
                color: jasper,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              margin: EdgeInsets.symmetric(horizontal: 1.8.r),
              padding: EdgeInsets.symmetric(horizontal: 7.5.r, vertical: 4.5.r),
              child: LayoutBuilder(
                builder: (_, p) => Stack(
                  children: [
                    Positioned(
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
                    ),
                    Positioned(
                      width: p.maxWidth * 0.65,
                      height: p.maxHeight * 0.75,
                      right: 0,
                      top: p.maxHeight * 0.015,
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
                                  fontWeight: FontWeight.w300,
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
          buildStaggeredSpace,
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 20,
            child: ColoredBox(color: blackOlive),
          )
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
              fontSize: 60.r,
              fontFamily: 'DelaGothic',
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
              fontWeight: FontWeight.normal,
              color: gunMetal,
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
