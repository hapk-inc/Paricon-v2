import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:logger/logger.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/auth/notifier.dart';
import '../logic/dashboard/dashboard_bloc.dart';
import '../logic/user/bloc.dart';
import '../logic/user/notifier.dart';
import '../my_widget/leaderboard.dart';
import '../my_widget/pi_logo.dart';
import '../my_widget/staggered_gap.dart';
import '../theme/sliding_panel.dart';
import '../values/colors.dart';
import 'dashboard/dashboard_btn.dart';
import 'dashboard/enter_tournament_code.dart';
import 'dashboard/play_friend_text.dart';
import 'dashboard/recent_player.dart';
import 'dashboard/tournament_text.dart';
import 'dashboard/welcome_user.dart';

const Duration _m300 = Duration(milliseconds: 300);

Logger _logger = Logger();

@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  //late ScreenSize screenSize;
  late AuthNotifier authNotifier;
  late UserNotifier userNotifier;

  @override
  void initState() {
    super.initState();
    _logger.i("Init Method");

    authNotifier = ref.read(authNotifierProvider);
    userNotifier = ref.refresh(userNotifierProvider);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            width: 270.w,
            alignment: Alignment.center,
            child: const MyLogo(),
          ),
        ),
        body: const _Dashboard(),
      );
}

final SlidingPanelTheme _pTheme = SlidingPanelTheme();

class _Dashboard extends ConsumerWidget {
  const _Dashboard();

  @override
  Widget build(BuildContext context, WidgetRef ref) => SafeArea(
        bottom: false,
        child: SlidingUpPanel(
          controller: ref.read(dashboardPanelControllerProvider),
          panel: Container(),
          borderRadius: _pTheme.panelRadius,
          backdropEnabled: true,
          color: _pTheme.slidingPanelColor,
          maxHeight: 360.r,
          defaultPanelState: PanelState.CLOSED,
          padding: _pTheme.padding,
          isDraggable: false,
          minHeight: 0,
          onPanelClosed: () {},
          body: SingleChildScrollView(
            child: StaggeredGrid.count(
              crossAxisCount: 15,
              mainAxisSpacing: 15.r,
              children: const [
                StaggeredGap(),
                WelcomeUser(),
                RecentPlayer(),
                DashboardBtn(),
                _DashboardPage(),
              ],
            ),
          ),
        ),
      );
}

class _DashboardPage extends ConsumerWidget {
  const _DashboardPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController();

    ref.listen(
      dButtonNotifierProvider.select((value) => value),
      (_, next) => pageController.animateToPage(
        next,
        duration: _m300,
        curve: Curves.easeInOut,
      ),
    );

    return StaggeredGridTile.count(
      crossAxisCellCount: 15,
      mainAxisCellCount: 30,
      //mainAxisCellCount: screenSize.isP ? 36 : 27,
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          _DailyMatch(),
          _PlayFriend(),
        ],
      ),
    );
  }
}

class _DailyMatch extends StatelessWidget {
  const _DailyMatch();

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: FadeIn(
          child: StaggeredGrid.count(
            crossAxisCount: 15,
            mainAxisSpacing: 15.r,
            children: const [
              // StaggeredGap(),
              TournamentText(),
              StaggeredGap(),
              EnterTournamentCode(),
              StaggeredGap(),
              LeaderBoard(),
            ],
          ),
        ),
      );
}

class _PlayFriend extends StatelessWidget {
  const _PlayFriend();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FadeIn(
        child: StaggeredGrid.count(
          crossAxisCount: 15,
          mainAxisSpacing: 15.r,
          children: const [
            //StaggeredGap(),
            // TournamentText(),
            DPlayFriend(),
            //StaggeredGap(),
            CreateRoom()
            // EnterTournamentCode(),
          ],
        ),
      ),
    );
  }
}

class CreateRoom extends ConsumerWidget {
  const CreateRoom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Wrap(
          spacing: 15.r,
          runSpacing: 15.r,
          children: [
            Container(
              width: 210.w,
              height: 51.h,
              decoration: BoxDecoration(
                  color: magnolia, borderRadius: BorderRadius.circular(4.5.r)),
            ),
            Container(
              width: 90.w,
              height: 51.h,
              decoration: BoxDecoration(
                  color: magnolia, borderRadius: BorderRadius.circular(4.5.r)),
            ),
            Container(
              width: 180.w,
              height: 51.h,
              decoration: BoxDecoration(
                  color: magnolia, borderRadius: BorderRadius.circular(4.5.r)),
            ),
          ],
        ),
      ),
    );
  }
}
