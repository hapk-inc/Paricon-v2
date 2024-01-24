import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../dashboard/d_name.dart';
import '../dashboard/d_subtitle.dart';
import '../dashboard/enter_avatar_code.dart';
import '../dashboard/enter_tournament_code.dart';
import '../dashboard/in_progress.dart';
import '../dashboard/open_challenge_table.dart';
import '../dashboard/play_with_friend.dart';
import '../dashboard/recent_player.dart';
import '../logic/auth_provider.dart';
import '../logic/dashboard_panel_provider.dart';
import '../logic/panel_provider.dart';
import '../logic/remote_values.dart';
import '../logic/room_id.dart';
import '../logic/s_size.dart';
import '../logic/user_activity_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../my_widget/my_logo.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';
import 'game_room.dart';
import 'host_room.dart';

@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (mounted) {
      debugPrint("didChangeAppLifecycleState ${state.name}");
      if (state == AppLifecycleState.inactive) {
        if (!kDebugMode) {
          ref.read(setActiveProvider(false));
        }
      } else if (state == AppLifecycleState.resumed) {
        if (!kDebugMode) {
          ref.read(setActiveProvider(true));
          ref.read(appOpenedProvider);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      idNotifier.select((value) => value),
      (previous, next) {
        debugPrint("75-- $next");
        final dNotifier = ref.watch(dashboardPanelNotifierProvider);

        if (next.isEmpty) {
          ref.watch(dashboardPanelProvider).close();
          dNotifier.dMinHeight = 0.h;
          dNotifier.dHeight = 300.h;
        } else {
          dNotifier.dMinHeight = 72.h;
          Future.delayed(
            const Duration(milliseconds: 1200),
            () {
              ref.watch(dashboardPanelProvider).open();
              double aR = 900.h / 360.w;
              bool smallSize = aR > 2.3;
              dNotifier.dHeight = smallSize ? 480.h : 450.h;
              dNotifier.dWidget = const HostRoom();
            },
          );
        }
      },
    );

    final String inWork = ref.watch(inWorkProvider);
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final User? fUser = ref.watch(authUserProvider).value;
    final ScreenSize sSize = ref.watch(sizeProvider);
    final bool isPhone = sSize == ScreenSize.phone;

    final bool doNotShow =
        (inWork.isNotEmpty && !kDebugMode) || myUser == null || fUser == null;

    debugPrint(fUser.toString());

    return Scaffold(
      appBar: !isPhone
          ? null
          : doNotShow
              ? null
              : AppBar(
                  toolbarHeight: 120.h,
                  backgroundColor: majorelleBlue,
                  title: FadeIn(
                    child: SlideInRight(child: const MyLogo()),
                  ),
                  elevation: 3.r,
                ),
      backgroundColor: ghostWhite,
      body: AnimatedSwitcher(
        duration: const Duration(microseconds: 500),
        child: !isPhone || doNotShow
            ? WorkInProgress(
                inWork: !isPhone ? 'Screen size not compatible' : inWork,
              )
            : const _DashboardSliding(),
      ),
    );
  }
}

class _DashboardSliding extends ConsumerWidget {
  const _DashboardSliding();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dPanelNotifier = ref.watch(dashboardPanelNotifierProvider);
    final pTheme = SlidingPanelTheme();
    return SlidingUpPanel(
      controller: ref.watch(dashboardPanelProvider),
      borderRadius: pTheme.slidingPanelRadius,
      body: const SafeArea(bottom: false, child: _Dashboard()),
      isDraggable: false,
      backdropEnabled: true,
      panel: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: Container(
            decoration: BoxDecoration(
              color: magnolia,
              borderRadius: pTheme.slidingPanelRadius,
            ),
            child: dPanelNotifier.dWidget),
      ),
      onPanelClosed: () {
        if (ref.read(idNotifier).isEmpty) {
          ref.read(dashboardPanelNotifierProvider).dWidget =
              const CreateGameRoom();
        }
      },
      minHeight: 0.h,
      maxHeight: dPanelNotifier.dHeight,
    );
  }
}

/*   if (ref.watch(idNotifier).isNotEmpty) {
          //ref.read(idNotifier.notifier).empty();
        } else {
          ref.read(dashboardPanelNotifierProvider).dWidget =
              const CreateGameRoom();
          //ref.watch(dPanelHeightProvider.notifier).state = 300.h;
        }
        //ref.watch(dPanelHeightProvider.notifier).state = 300.h;
   */

class _Dashboard extends ConsumerWidget {
  const _Dashboard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser myUser = ref.watch(myUserProvider).value!;

    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 30.h),
      scrollDirection: Axis.vertical,
      child: StaggeredGrid.count(
        axisDirection: AxisDirection.down,
        crossAxisCount: 20,
        children: [
          DName(myUser.name),
          Gap(9.r),
          DSubtitle(myUser),
          const RecentPlayer(),
          Gap(15.r),
          const StaggeredGridTile.fit(
            crossAxisCellCount: 20,
            child: EnterTournamentCode(),
          ),
          const StaggeredGridTile.fit(
            crossAxisCellCount: 20,
            child: OpenChallengeTable(),
          ),
          Gap(15.r),
          const PlayWithFriend(),
          StaggeredGridTile.fit(
            crossAxisCellCount: 20,
            child: Divider(
              color: gray,
              thickness: 0.75.r,
              indent: 15.r,
              endIndent: 15.r,
            ),
          ),
          const StaggeredGridTile.fit(
            crossAxisCellCount: 20,
            child: EnterAvatarCode(),
          ),
          Gap(210.r),
        ],
      ),
    );
  }
}
