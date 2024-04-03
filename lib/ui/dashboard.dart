import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:logger/logger.dart';
import 'package:paricon/my_widget/staggered_9.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../enums/enums.dart';
import '../logic/app/size_provider.dart';

import '../logic/auth/notifier.dart';
import '../logic/panel/dashboard_bloc.dart';
import '../logic/user/bloc.dart';
import '../logic/user/notifier.dart';
import '../my_widget/pi_logo.dart';
import '../my_widget/staggered_gap.dart';
import '../values/colors.dart';
import 'dashboard/app_version.dart';
import 'dashboard/enter_tournament_code.dart';
import '../my_widget/leaderboard.dart';
import 'dashboard/play_friend_text.dart';
import 'dashboard/recent_player.dart';
import 'dashboard/tournament_text.dart';
import 'dashboard/welcome_user.dart';
import 'my_theme.dart';

//const Duration _m300 = Duration(milliseconds: 300);

Logger _logger = Logger();

@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  late ScreenSize screenSize;
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
  Widget build(BuildContext context) {
    screenSize = ref.watch(sizeProvider);
    final bool isPT = SizeNotifier(screenSize).isPT;

    ref.listen(
      dashboardPanelProvider.select((value) => value),
      (prev, next) {
        if (next.toString() != "BlankContainer") {
          if (ref.read(dashboardPanelControllerProvider).isPanelClosed) {
            ref.read(dashboardPanelControllerProvider).open();
          }
        }
      },
    );
    return Scaffold(
      appBar: isPT
          ? AppBar(
              leading: const SizedBox(),
              leadingWidth: 7.5.w,
              centerTitle: true,
              title: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: SizeNotifier(screenSize).isP ? 270.w : 225.w,
                alignment: Alignment.center,
                child: const MyLogo(),
              ),
            )
          : null /*AppBar(
              leading: const SizedBox(),
              title: SizedBox(width: 150.w, child: const MyLogo()),
              leadingWidth: 7.5.w,
              centerTitle: false,
            )*/
      ,
      body: isPT ? const _Dashboard() : null,
    );
  }
}

final SlidingPanelTheme _pTheme = SlidingPanelTheme();

class _Dashboard extends ConsumerWidget {
  const _Dashboard();

  @override
  Widget build(BuildContext context, WidgetRef ref) => SafeArea(
        bottom: false,
        child: SlidingUpPanel(
          controller: ref.read(dashboardPanelControllerProvider),
          panel: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: ref.watch(dashboardPanelProvider),
          ),
          borderRadius: _pTheme.slidingPanelRadius,
          backdropEnabled: true,
          color: _pTheme.slidingPanelColor,
          maxHeight: 420.h,
          defaultPanelState: PanelState.CLOSED,
          //padding: _pTheme.slidingPanelPadding * 0.9,
          // padding: _pTheme.slidingPanelPadding,
          padding: EdgeInsets.zero,
          isDraggable: false,
          minHeight: 0,
          onPanelClosed: () {
            ref.read(dashboardPanelProvider.notifier).state =
                const BlankContainer();
          },
          body: SingleChildScrollView(
            child: StaggeredGrid.count(
              crossAxisCount: 15,
              mainAxisSpacing: 15.r,
              children: <Widget>[const StaggeredGap()] +
                  const [
                    StaggeredGap(),
                    WelcomeUser(),
                    RecentPlayer(),
                    StaggeredGap(),
                    TournamentText(),
                    StaggeredGap(),
                    EnterTournamentCode(),
                    StaggeredGap(),
                    LeaderBoard(),
                    StaggeredGap(),
                    PlayFriendText(),
                    StaggeredGap(),
                    PlayFriendButton(),
                    StaggeredGap(),
                    AppVersion(),
                    Staggered9(),
                    //FriendAnimation(),
                  ],
            ),
          ),
        ),
      );
}
