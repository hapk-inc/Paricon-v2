import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../dashboard/d_carousel.dart';
import '../dashboard/enter_tournament_code.dart';
import '../dashboard/in_progress.dart';
import '../dashboard/my_group_button.dart';
import '../dashboard/recent_player.dart';
import '../dashboard/welcome.dart';
import '../logic/auth_provider.dart';
import '../logic/dashboard_provider.dart';
import '../logic/firebase_init.dart';
import '../logic/panel_provider.dart';
import '../logic/remote_values.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../my_widget/my_logo.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage>
    with WidgetsBindingObserver {
  late PageController _pageController;
  final int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();
    WidgetsBinding.instance.addObserver(this);
    ref.read(setActiveProvider(true).future);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint("didChangeAppLifecycleState ${state.name}");
    if (state == AppLifecycleState.paused) {
      ref.read(setActiveProvider(state == AppLifecycleState.resumed).future);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String inWork = ref.watch(inWorkProvider);
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final User? fUser = ref.watch(authUserProvider).value;
    final pTheme = SlidingPanelTheme();

    final bool doNotShow =
        (inWork.isNotEmpty && !kDebugMode) || myUser == null || fUser == null;

    debugPrint(fUser.toString() ?? "No FUser");

    return Scaffold(
      appBar: doNotShow
          ? null
          : AppBar(
              toolbarHeight: 90.r,
              backgroundColor: majorelleBlue,
              title: Container(
                padding: EdgeInsets.all(30.r),
                alignment: Alignment.center,
                child: const MyLogo(),
              ),
              elevation: 3.r,
            ),
      // bottomNavigationBar: doNotShow ? null : const MyBottomBar(),
      backgroundColor: ghostWhite,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: doNotShow
            ? WorkInProgress(inWork: inWork)
            : SlidingUpPanel(
                controller: ref.watch(dashboardPanelProvider),
                borderRadius: pTheme.slidingPanelRadius,
                body: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    const _Tournament(),
                    Container(),
                    Container(),
                  ],
                ),
                isDraggable: false,
                backdropEnabled: true,
                panel: ref.watch(dPanelWidgetProvider),
                minHeight: 0,
                maxHeight: 300.h,
              ),
      ),
    );
  }
}

class _Tournament extends StatelessWidget {
  const _Tournament();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 9.r),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 20,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 7.2.r,
              child: const Welcome(),
            ),
            Gap(7.5.r),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 1.8,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 15.w),
                child: const MyGroupButton(),
              ),
            ),
            Gap(24.r),
            const StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 4.5,
              child: RecentPlayer(),
            ),
            //Gap(3.r),
            StaggeredGridTile.fit(
              crossAxisCellCount: 20,
              //mainAxisCellCount: 2.1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: AutoSizeText(
                  "Tap on the players to discover more about them.",
                  //" Double-tap to make them your friends.",
                  style: TextStyle(
                    height: 2.1.r,
                    letterSpacing: 0,
                    color: vanDyke.withOpacity(0.6),
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w300,
                    fontSize: 9.r,
                  ),
                ),
              ),
            ),
            Gap(24.r),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 13.5.r,
              child: const DCarousel(),
            ),
            Gap(12.r),
            const StaggeredGridTile.fit(
              crossAxisCellCount: 20,
              child: EnterTournamentCode(),
            ),
            //Gap(1.5.r),
            StaggeredGridTile.fit(
              crossAxisCellCount: 20,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Consumer(
                  builder: (_, ref, __) {
                    final sTheme = Theme.of(context).textTheme.bodyLarge!;
                    return ref.watch(packageInfoProvider).when(
                          data: (x) => InkWell(
                            onTap: () => ref.read(signOutProvider),
                            child: Text(
                              "App version ${x.version} (${x.buildNumber})",
                              style: sTheme.copyWith(
                                color: gray,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          error: (e, s) => Container(),
                          loading: () => Container(),
                        );
                  },
                ),
              ),
            ),
            Gap(210.r)
          ],
        ),
      ),
    );
  }
}
