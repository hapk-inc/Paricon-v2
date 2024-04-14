import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/dashboard/notifier.dart';
import '../my_widget/pi_logo.dart';
import '../my_widget/staggered_gap.dart';
import '../theme/sliding_panel.dart';
import 'dashboard/daily_match.dart';
import 'dashboard/dashboard_btn.dart';
import 'dashboard/play_friend.dart';
import 'dashboard/recent_player.dart';
import 'dashboard/welcome_user.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState createState() => _DashboardPageState();
}

final SlidingPanelTheme _panelTheme = SlidingPanelTheme();

class _DashboardPageState extends ConsumerState<DashboardPage> {
  late DashboardNotifier dashboardNotifier;

  @override
  void initState() {
    super.initState();
    dashboardNotifier = ref.refresh(dashboardNotifierProvider);
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
            controller: dashboardNotifier.panelController,
            panel: Container(),
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
      (_, next) => pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ),
    );

    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: SizedBox(
        height: 480.h,
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [DailyMatch(), PlayFriend()],
        ),
      ),
    );
  }
}
