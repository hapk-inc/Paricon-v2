import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';
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
import '../router/my_route.dart';
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
        if (next.isEmpty) {
          ref.watch(dashboardPanelProvider).close();
        } else {
          Future.delayed(
            const Duration(seconds: 1),
            () {
              ref.watch(dashboardPanelProvider).open();
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
    final pTheme = SlidingPanelTheme();

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
                  //leadingWidth: 90.w,
                  //leading: AppBarLeading(myUser),
                  title: FadeIn(child: SlideInRight(child: const MyLogo())),
                  elevation: 3.r,
                ),
      backgroundColor: ghostWhite,
      body: !isPhone
          ? const WorkInProgress(inWork: 'Screen size not compatible')
          : AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: doNotShow
                  ? WorkInProgress(inWork: inWork)
                  : SlidingUpPanel(
                      controller: ref.watch(dashboardPanelProvider),
                      borderRadius: pTheme.slidingPanelRadius,
                      body: const SafeArea(bottom: false, child: _Dashboard()),
                      isDraggable: false,
                      backdropEnabled: true,
                      panel: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: ref.watch(dPanelWidgetProvider),
                      ),
                      onPanelClosed: () {
                        if (ref.watch(idNotifier).isNotEmpty) {
                          ref.read(idNotifier.notifier).empty();
                          ref.watch(dPanelHeightProvider.notifier).state =
                              300.h;
                        }
                      },
                      minHeight: 0,
                      maxHeight: ref.watch(dPanelHeightProvider),
                    ),
            ),
    );
  }
}

class AppBarLeading extends StatelessWidget {
  final MyUser myUser;
  const AppBarLeading(this.myUser, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //if (myUser.avatar != null)
        Positioned.fill(
          bottom: -7.5.r,
          child: SlideInUp(
            child: FadeIn(
              child: InkWell(
                onTap: () => context.router.push(const SettingsRoute()),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: myUser.avatar == null
                      ? Icon(
                          FontAwesomeIcons.userTie,
                          size: 90.r,
                          color: tropicalIndigo,
                        )
                      : RandomAvatar(
                          myUser.avatar ?? mockString(2),
                          trBackground: true,
                        ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

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
              thickness: 0.3.r,
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
