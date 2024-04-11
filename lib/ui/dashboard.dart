import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:group_button/group_button.dart';
import 'package:logger/logger.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/app/size_provider.dart';

import '../logic/auth/notifier.dart';
import '../logic/panel/dashboard_bloc.dart';
import '../logic/user/bloc.dart';
import '../logic/user/notifier.dart';
import '../my_widget/pi_logo.dart';
import '../my_widget/staggered_9.dart';
import '../my_widget/staggered_gap.dart';
import '../values/colors.dart';
import 'dashboard/dashboard_btn.dart';
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
  Widget build(BuildContext context) {
    final screenSize = ref.watch(sizeProvider.notifier);
    final bool isP = screenSize.isP;
    final bool isPT = screenSize.isPT;

    return Scaffold(
      appBar: isPT
          ? AppBar(
              leading: const SizedBox(),
              leadingWidth: 0.w,
              centerTitle: isP,
              title: Container(
                //duration: const Duration(milliseconds: 300),
                width: isP ? 240.w : 210.w,
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
            child: Container(),
          ),
          borderRadius: _pTheme.slidingPanelRadius,
          backdropEnabled: true,
          color: _pTheme.slidingPanelColor,
          maxHeight: 360.r,
          defaultPanelState: PanelState.CLOSED,
          padding: _pTheme.slidingPanelPadding,
          isDraggable: false,
          minHeight: 0,
          onPanelClosed: () {},
          body: SingleChildScrollView(
            child: StaggeredGrid.count(
              crossAxisCount: 15,
              mainAxisSpacing: 15.r,
              children: <Widget>[const StaggeredGap()] +
                  const [
                    StaggeredGap(),
                    WelcomeUser(),
                    RecentPlayer(),
                    //  StaggeredGap(),
                    DashboardBtn(),
                    StaggeredGap(),
                    TournamentText(),
                    StaggeredGap(),
                    EnterTournamentCode(),
                    StaggeredGap(),
                    LeaderBoard(),
                    StaggeredGap(),
                    /*PlayFriendText(),
                    //StaggeredGap(),
                    PlayFriendButton(),*/
                    DPlayFriend(),
                    Staggered9(),
                  ],
            ),
          ),
        ),
      );
}
