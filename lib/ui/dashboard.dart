import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../logic/s_size.dart';
import '../../theme/my_color.dart';
import '../logic/auth.dart';
import '../logic/dashboard_provider.dart';
import '../logic/firebase_init.dart';
import '../logic/remote_values.dart';
import '../my_widget/my_logo.dart';
import '../my_widget/no_internet_panel.dart';
import '../theme/my_theme.dart';
import 'dashboard_widget/d_card_collection.dart';
import 'dashboard_widget/d_carousel.dart';
import 'dashboard_widget/d_drawer.dart';
import 'dashboard_widget/d_recent_player.dart';
import 'dashboard_widget/d_welcome.dart';

@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize sSize = ref.read(sizeProvider);

    //List<Color> xRandom = [turquoise, pear, hunyadiYellow, salmon];
    //xRandom.shuffle();
    final SlidingPanelTheme pTheme = SlidingPanelTheme();

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
      drawer: Drawer(
        width: 270.w,
        backgroundColor: majorelleBlue,
        child: const SafeArea(child: DDrawer()),
      ),
      drawerEnableOpenDragGesture: false,
      //appBar: AppBar(toolbarHeight: 1.h, backgroundColor: majorelleBlue),
      body: SlidingUpPanel(
        controller: dPanelController,
        panel: panelWidget,
        isDraggable: false,
        backdropColor: richBlack,
        backdropEnabled: true,
        backdropOpacity: 0.9,
        borderRadius: pTheme.slidingPanelRadius,
        minHeight: 0,
        maxHeight: pTheme.slidingPanelHeight,
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

    //List<Color> xRandom = [turquoise, pear, hunyadiYellow, salmon];
    //xRandom.shuffle();

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
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 20,
          mainAxisSpacing: 1.r,
          crossAxisSpacing: 1.r,
          children: [
            const StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 8.1,
              child: DWelcome(),
            ),
            buildStaggeredSpace,
            //   buildStaggeredSpace,
            const StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 4.8,
              child: RecentPlayer(),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 15,
              child: DashCarousel(),
            ),
            //  buildStaggeredSpace,
            //  buildStaggeredSpace,
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 21.6.r,
              child: DCardCollection(),
            ),
            buildStaggeredSpace,
            buildStaggeredSpace,
            const StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 10.8,
              child: ShowTodayAvatars(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 15,
              child: Container(
                padding: EdgeInsets.all(7.5.r),
                alignment: Alignment.center,
                child: Opacity(
                  opacity: 0.75,
                  child: InkWell(
                    onTap: () => ref.read(signOutProvider),
                    child: const MyLogo(),
                  ),
                ),
              ),
            ),

            /*   const StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 11.1,
                child: SizedBox()),
            const StaggeredGridTile.count(
              crossAxisCellCount: 8,
              mainAxisCellCount: 11.1,
              child: PlayOnlineButton(),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 11.1,
              child: PlayWithStranger(),
            ),
         */
            //buildStaggeredSpace,
            //buildStaggeredSpace,
            /*const StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 4.5,
              child: DashboardFooter(),
            ),*/
            //buildStaggeredSpace,
            //buildStaggeredSpace,
          ],
        ),
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

class ShowTodayAvatars extends StatelessWidget {
  const ShowTodayAvatars({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: crayola,
        borderRadius: BorderRadius.circular(15.r),
      ),
      margin: EdgeInsets.all(7.5.r),
      padding: EdgeInsets.all(15.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12.h),
            child: Text(
              "You got 2 avatars today..",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: nyanza,
                fontSize: 15.r,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                4,
                (index) => Container(
                  constraints: BoxConstraints.tight(
                    Size.square(120.r),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                  child: FlipCard(
                    side: CardSide.FRONT,
                    front: Card(
                      color: nyanza,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -10.8.r,
                            left: -10.8.r,
                            height: 120.r,
                            width: 120.r,
                            child: RandomAvatar(
                              mockString(),
                              trBackground: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    back: Card(
                      color: cream,
                      child: Center(
                        child: Text(
                          "Tap to view",
                          style: TextStyle(
                            fontSize: 18.r,
                            fontFamily: 'DelaGothic',
                            color: [
                              chocolateCosmos,
                              viridian,
                              darkMossGreen,
                              dartMouthGreen,
                              darkPurple
                            ][mockInteger(0, 4)],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
