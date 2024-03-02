import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../dashboard/d_footer.dart';
import '../dashboard/d_name.dart';
import '../dashboard/d_recent_player.dart';
import '../dashboard/d_show_avatar.dart';
import '../dashboard/d_tournament.dart';

import '../dashboard/enter_tournament_code.dart';

import '../dashboard/open_challenge_table.dart';
import '../dashboard/play_with_friend.dart';

import '../logic/dashboard_panel_provider.dart';
import '../logic/panel_provider.dart';
import '../logic/room_id.dart';
import '../logic/s_size.dart';
import '../logic/user_activity_provider.dart';
import '../my_widget/my_logo.dart';
import '../my_widget/no_internet.dart';
import '../theme/dashboard_size.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';
import 'host_room.dart';

@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState createState() => _DashboardPageState();
}

const String notCompatible = 'Screen size not compatible';

class _DashboardPageState extends ConsumerState<DashboardPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    debugPrint("Dashboard Init");
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
    //final String inWork = ref.watch(inWorkProvider);
    //final MyUser? myUser = ref.watch(myUserProvider).value;
    //final User? fUser = ref.watch(authUserProvider).value;

    final ScreenSize sSize = ref.watch(sizeProvider);
    //final bool isPhone = sSize == ScreenSize.phone;
    final bool isPhoneTab =
        sSize == ScreenSize.phone || sSize == ScreenSize.tab;
    //final bool doNotShow =
    //    (inWork.isNotEmpty && !kDebugMode) || myUser == null || fUser == null;

    return Scaffold(
      appBar: isPhoneTab
          ? AppBar(
              title: FadeInRight(
                delay: const Duration(milliseconds: 2100),
                child: Padding(
                  padding: EdgeInsets.all(15.r),
                  child: const MyLogo(),
                ),
              ),
            )
          : AppBar(
              titleSpacing: 7.5.w,
              title: Container(
                width: 180.w,
                alignment: Alignment.center,
                child: const MyLogo(),
              ),
              //leadingWidth: 180.w,
            ),
      body: const AnimatedSwitcher(
        duration: Duration(microseconds: 600),
        child: /*!(!isPhone || doNotShow)
            ? WorkInProgress(inWork: !isPhone ? notCompatible : inWork)
            : */
            _DashboardSlidingPanel(),
      ),
    );
  }
}

class _DashboardSlidingPanel extends ConsumerWidget {
  const _DashboardSlidingPanel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dPanelNotifier = ref.watch(dashboardPanelNotifierProvider);
    final pTheme = SlidingPanelTheme();

    ref.listen(
      idNotifier.select((value) => value),
      (previous, next) {
        debugPrint("75-- $next");
        //   final dNotifier = ref.watch(dashboardPanelNotifierProvider);

        ref.read(setPlayingProvider(next.isNotEmpty));

        if (next.isEmpty) {
          ref.watch(dashboardPanelProvider).close();
          dPanelNotifier.dMinHeight = 0.h;
          double aR = (900.h / 360.w);
          //if (aR > 2.3) debugPrint("Small Screen");
          dPanelNotifier.dHeight = aR > 2.3 ? 300.h : 270.h;
        } else {
          dPanelNotifier.dMinHeight = 72.h;
          Future.delayed(
            const Duration(milliseconds: 1200),
            () {
              ref.watch(dashboardPanelProvider).open();
              double aR = 900.h / 360.w;
              bool smallSize = aR > 2.3;
              dPanelNotifier.dHeight = smallSize ? 480.h : 450.h;
              //dNotifier.dWidget = const PlayFriendScoreboard({}, {});
              dPanelNotifier.dWidget = const HostRoom();
            },
          );
        }
      },
    );

    return SlidingUpPanel(
      controller: ref.watch(dashboardPanelProvider),
      borderRadius: pTheme.slidingPanelRadius,
      color: ghostWhite1,
      body: const SafeArea(bottom: false, child: __Dashboard()),
      panel: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: dPanelNotifier.dWidget,
      ),
      isDraggable: false,
      backdropEnabled: true,
      //backdropTapClosesPanel: ref.watch(idNotifier).isEmpty ,
      backdropTapClosesPanel: ref.watch(idNotifier).isNotEmpty
          ? false
          : dPanelNotifier.dWidget != const NoInternet(),
      onPanelClosed: () {
        FocusScope.of(context).unfocus();
      },
      minHeight: 0.h,
      maxHeight: dPanelNotifier.dHeight,
    );
  }
}

class __Dashboard extends ConsumerWidget {
  const __Dashboard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize sSize = ref.watch(sizeProvider);
    final bool isPhoneTab =
        sSize == ScreenSize.phone || sSize == ScreenSize.tab;
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        children: [
          StaggeredGridTile.fit(
            crossAxisCellCount: 20,
            child: Gap(DashboardSize(sSize).headerGap),
          ),
          const StaggeredGridTile.fit(crossAxisCellCount: 20, child: DName()),
          const RecentPlayer(),
          StaggeredGridTile.fit(
            crossAxisCellCount: 20,
            child: Gap(DashboardSize(sSize).headerGap),
          ),
          StaggeredGridTile.fit(
            crossAxisCellCount: isPhoneTab ? 20 : 18,
            child: const DTournament(),
          ),
          if (sSize == ScreenSize.iPad)
            StaggeredGridTile.fit(
              crossAxisCellCount: 2,
              child: Container(),
            ),
          StaggeredGridTile.fit(
            crossAxisCellCount: isPhoneTab ? 20 : 18,
            child: const EnterTournamentCode(),
          ),
          if (sSize == ScreenSize.iPad)
            StaggeredGridTile.fit(
              crossAxisCellCount: 2,
              child: Container(),
            ),
          StaggeredGridTile.fit(
            crossAxisCellCount: 20,
            child: Gap(DashboardSize(sSize).headerGap),
          ),
          const StaggeredGridTile.fit(
              crossAxisCellCount: 20, child: OpenChallengeTable()),
          if (sSize == ScreenSize.phone) ...[
            StaggeredGridTile.fit(
              crossAxisCellCount: 20,
              child: Gap(DashboardSize(sSize).headerGap),
            ),
            const PlayWithFriend(),
            StaggeredGridTile.fit(
              crossAxisCellCount: 20,
              child: Gap(120.r),
            ),
            const StaggeredGridTile.fit(
              crossAxisCellCount: 20,
              child: ShowAvatar(),
            ),
          ],
          StaggeredGridTile.fit(
            crossAxisCellCount: 20,
            child: Divider(
              height: 7.5.h,
              color: frenchGray,
              thickness: 0.36.r,
              indent: 15.w,
              endIndent: 15.w,
            ),
          ),
          const StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 4.5,
            child: DFooter(),
          ),
          Gap(210.h),
        ],
      ),
    );
  }
}
