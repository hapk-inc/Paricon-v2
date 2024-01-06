import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
import '../logic/s_size.dart';
import '../logic/tournament_database.dart';
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
        ref.read(setActiveProvider(true));
        ref.read(appOpenedProvider);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  leadingWidth: 90.w,
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
      padding: EdgeInsets.only(top: 7.5.r),
      scrollDirection: Axis.vertical,
      child: StaggeredGrid.count(
        axisDirection: AxisDirection.down,
        crossAxisCount: 20,
        children: [
          Gap(15.r),
          DName(myUser.name),
          //Gap(9.r),
          DSubtitle(myUser),
          // Gap(12.r),
          const RecentPlayer(),
          //const TButton(),
          Gap(12.r),
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

class TopPlayerHorizontalList extends ConsumerWidget {
  const TopPlayerHorizontalList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> bestDList = ref.watch(bestDListProvider).value ?? [];

    return SizedBox(
      height: 75.h,
      child: Card(
        color: ghostWhite,
        margin: EdgeInsets.zero,
        elevation: 0.3.r,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        //alignment: Alignment.centerLeft,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 15.w),
          children: [
            Container(
              height: double.maxFinite,
              alignment: Alignment.centerLeft,
              child: Text(
                "Top Players",
                style: TextStyle(fontFamily: 'WendyOne', fontSize: 24.r),
              ),
            ),
            Gap(12.r),
            ...List.generate(
              bestDList.length,
              (index) {
                final String bD = bestDList[index];
                final MyUser? xUser = ref.watch(xUserProvider(bD)).value;
                return xUser == null
                    ? Container()
                    : Container(
                        //width: 135.w,
                        padding: EdgeInsets.only(left: 4.5.w, right: 13.5.w),
                        margin: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 18.r),
                        decoration: BoxDecoration(
                          color: [
                            aquamarine,
                            xantHous,
                            uranianBlue
                          ][mockInteger(0, 2)],
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              child: xUser.avatar == null
                                  ? Text(
                                      xUser.name
                                          .substring(0, 2)
                                          .toUpperCase()
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(fontSize: 15.r),
                                    )
                                  : RandomAvatar(xUser.avatar!),
                            ),
                            Gap(10.5.r),
                            AutoSizeText(
                              xUser.name,
                              style: TextStyle(
                                  fontSize: 13.5.r,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: federalBlue),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
