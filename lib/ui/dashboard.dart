import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/dashboard/notifier.dart';
import '../logic/panel/bloc.dart';
import '../logic/user/bloc.dart';
import '../logic/user/notifier.dart';
import '../my_widget/pi_logo.dart';
import '../my_widget/staggered_gap.dart';
import '../theme/sliding_panel.dart';
import 'dashboard/daily_match.dart';
import 'dashboard/dashboard_btn.dart';
import 'dashboard/leaderboard.dart';
import 'dashboard/play_friend.dart';
import 'dashboard/recent_player.dart';
import 'dashboard/welcome_user.dart';

@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState createState() => _DashboardPageState();
}

final SlidingPanelTheme _panelTheme = SlidingPanelTheme();

class _DashboardPageState extends ConsumerState<DashboardPage> {
  late DashboardNotifier dashboardNotifier;
  late PanelController panelController;
  late UserNotifier userNotifier;

  @override
  void initState() {
    super.initState();
    dashboardNotifier = ref.refresh(dashboardNotifierProvider);
    panelController = ref.read(dashboardPanelControllerProvider);
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
        body: SafeArea(
          bottom: false,
          child: SlidingUpPanel(
            controller: panelController,
            panel: AnimatedContainer(
              duration: const Duration(milliseconds: 450),
              child: ref.watch(panelNotifierProvider),
            ),
            borderRadius: _panelTheme.panelRadius,
            backdropEnabled: true,
            color: _panelTheme.slidingPanelColor,
            maxHeight: 360.r,
            defaultPanelState: PanelState.CLOSED,
            padding: _panelTheme.padding,
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
                  StaggeredGap(),
                  DashboardBtn(),
                  _DashboardSwitch(),
                ],
              ),
            ),
          ),
        ),
      );
}

class _DashboardSwitch extends ConsumerWidget {
  const _DashboardSwitch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();

    ref.listen(
      dashboardNotifierProvider.select((value) => value.buttonIndex),
      (previous, next) =>
          (previous ?? 0) + 1 == next || (previous ?? 0) - 1 == next
              ? pageController.animateToPage(
                  next,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                )
              : pageController.jumpToPage(next),
    );

    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: SizedBox(
        height: 480.h,
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            DailyMatch(),
            PlayFriend(),
            LeaderBoard(),
          ],
        ),
      ),
    );
  }
}
