import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../dashboard/d_name.dart';
import '../dashboard/d_subtitle.dart';
import '../dashboard/enter_tournament_code.dart';
import '../dashboard/in_progress.dart';
import '../dashboard/recent_player.dart';
import '../dashboard/t_button.dart';
import '../logic/auth_provider.dart';
import '../logic/dashboard_provider.dart';
import '../logic/panel_provider.dart';
import '../logic/remote_values.dart';
import '../logic/t_score.dart';
import '../logic/tournament_database.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../model/t_duration.dart';
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

    debugPrint(fUser.toString());

    return Scaffold(
      appBar: doNotShow
          ? null
          : AppBar(
              toolbarHeight: 90.r,
              backgroundColor: majorelleBlue,
              leadingWidth: 90.w,
              leading: AppBarLeading(myUser),
              title: FadeIn(child: SlideInRight(child: const MyLogo())),
              elevation: 3.r,
            ),
      backgroundColor: ghostWhite,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: doNotShow
            ? WorkInProgress(inWork: inWork)
            : SlidingUpPanel(
                controller: ref.watch(dashboardPanelProvider),
                borderRadius: pTheme.slidingPanelRadius,
                body: const _Tournament(),
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

class AppBarLeading extends StatelessWidget {
  final MyUser myUser;
  const AppBarLeading(this.myUser, {super.key});

  @override
  Widget build(BuildContext context) {
    final tTheme = Theme.of(context).textTheme.titleLarge!;
    return Stack(
      children: [
        if (myUser.avatar != null)
          Positioned.fill(
            bottom: -7.5.r,
            child: SlideInUp(
              child: FadeIn(
                child: InkWell(
                  onTap: () => context.router.push(const SettingsRoute()),
                  child: RandomAvatar(
                    myUser.avatar ?? "x",
                    trBackground: true,
                  ),
                ),
              ),
            ),
          )
        else
          Positioned.fill(
            bottom: 9.r,
            child: SlideInLeft(
              child: FadeIn(
                child: Card(
                  shape: const CircleBorder(),
                  elevation: 9.r,
                  color: Colors.transparent,
                  child: CircleAvatar(
                    radius: 36.r,
                    backgroundColor: federalBlue,
                    child: Text(
                      myUser.name.substring(0, 2).toUpperCase(),
                      style: tTheme.copyWith(color: ghostWhite),
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

//List<double> colSize = [0.12, 0.24, 0.2];
List<double> colSize = [0.12, 0.42, 0.36];
List<String> colName = ['Rank', 'Name', 'Duration'];

class _Tournament extends ConsumerWidget {
  const _Tournament();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser myUser = ref.watch(myUserProvider).value!;

    final User? fUser = ref.watch(authUserProvider).value;

    final List<TDuration> recentTourList =
        ref.watch(recentTourListProvider).value ?? [];

    final List<String> bestDList = ref.watch(bestDListProvider).value ?? [];
    debugPrint("185--${bestDList.length}");
    return Container(
      padding: EdgeInsets.only(top: 7.5.r),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: StaggeredGrid.count(
          axisDirection: AxisDirection.down,
          crossAxisCount: 20,
          children: [
            DName(myUser.name),
            DSubtitle(myUser),
            Gap(3.r),
            const RecentPlayer(),
            const TButton(),
            Gap(9.r),
            const StaggeredGridTile.fit(
              crossAxisCellCount: 20,
              child: EnterTournamentCode(),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 20,
              child: Container(
                height: (78.h * 4),
                color: lightOrange,
                width: 360.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 9.w, vertical: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recently Played",
                            style: TextStyle(
                              fontSize: 21.r,
                              color: cinerous,
                              fontFamily: 'WendyOne',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        constraints: const BoxConstraints.expand(),
                        child: LayoutBuilder(
                          builder: (_, BoxConstraints constraints) {
                            final double pH = constraints.maxHeight;
                            final double pW = constraints.maxWidth;
                            final int r = mockInteger(0, 3);

                            return Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: charcoal),
                              child: DataTable(
                                horizontalMargin: 12.w,
                                dividerThickness: 0.6.r,
                                columnSpacing: 3.w,
                                headingRowHeight: pH * 0.18,
                                dataRowMinHeight: pH * 0.21,
                                dataRowMaxHeight: pH * 0.21,
                                headingTextStyle: TextStyle(
                                  fontSize: 15.r,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  color: giantOrange,
                                ),
                                dataTextStyle: TextStyle(
                                  fontSize: 15.r,
                                  color: richBlack,
                                  fontFamily: 'Poppins',
                                ),
                                columns: List.generate(
                                  3,
                                  (index) {
                                    return DataColumn(
                                      label: Container(
                                        color:
                                            index == 3 ? chocolateCosmos : null,
                                        width: pW * colSize[index],
                                        child: Text(colName[index]),
                                      ),
                                    );
                                  },
                                ),
                                rows: recentTourList.isEmpty
                                    ? []
                                    : List.generate(4, (index) {
                                        final TDuration tD =
                                            recentTourList[index];
                                        final bool isMe =
                                            tD.userId == fUser!.uid;
                                        final MyUser? xUser = ref
                                            .watch(xUserProvider(tD.userId))
                                            .value;

                                        final int myRank =
                                            bestDList.indexOf(tD.userId);
                                        // final
                                        return DataRow(
                                          color: MaterialStatePropertyAll(
                                              isMe ? bitterSweet : null),
                                          cells: [
                                            DataCell(
                                              Container(
                                                width: pW * colSize[0],
                                                margin: EdgeInsets.only(
                                                    left: pW * 0.03),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "${myRank + 1}"
                                                      .padLeft(2, '0'),
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 14.r,
                                                    color: isMe
                                                        ? lightOrange
                                                        : cardinal,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Container(
                                                width: pW * colSize[1],
                                                alignment: Alignment.centerLeft,
                                                child: AutoSizeText(
                                                  xUser == null
                                                      ? ""
                                                      : xUser.name,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 13.2.r,
                                                    color: isMe
                                                        ? lightOrange
                                                        : hookerGreen,
                                                    fontFamily: 'Montserrat',
                                                  ),
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              SizedBox(
                                                width: pW * colSize[2],
                                                //width: 120.w,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    AutoSizeText.rich(
                                                      showTScore(
                                                        tD.tDuration,
                                                        tSize: 15,
                                                        sSize: 10.8,
                                                        //family: 'WendyOne',
                                                        minute: isMe
                                                            ? lightOrange
                                                            : caputMortuum,
                                                        mm: isMe
                                                            ? lightOrange
                                                            : oldRose,
                                                      ),
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          letterSpacing: 0.3.r),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 1.5.w),
                                                      child: Text(
                                                        "${tD.playedAt.hour.toString().padLeft(2, '0')}:${tD.playedAt.minute.toString().padLeft(2, '0')}",
                                                        style: TextStyle(
                                                          fontFamily: 'Cabin',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: isMe
                                                              ? lavenderWeb
                                                              : gray,
                                                          fontSize: 12.r,
                                                          letterSpacing: 0.3.r,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Gap(15.r),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 3.6,
              child: Container(
                color: lavenderWeb.withOpacity(0.9),
                alignment: Alignment.centerLeft,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 15.w),
                  children: [
                    Container(
                      height: double.maxFinite,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Top Players",
                        style:
                            TextStyle(fontFamily: 'WendyOne', fontSize: 24.r),
                      ),
                    ),
                    Gap(12.r),
                    ...List.generate(
                      bestDList.length,
                      (index) {
                        final String bD = bestDList[index];
                        final MyUser? xUser =
                            ref.watch(xUserProvider(bD)).value;
                        return xUser == null
                            ? Container()
                            : Container(
                                //width: 135.w,
                                padding:
                                    EdgeInsets.only(left: 4.5.w, right: 13.5.w),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 12.r),
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
                                          fontSize: 15.r,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: federalBlue),
                                      maxLines: 1,
                                    ),
                                    /* VerticalDivider(
                              color: ghostWhite,
                              thickness: 0.3.r,
                              width: 30.r,
                            ),
                            AutoSizeText.rich(
                              showTScore(
                                Duration(
                                    milliseconds: mockInteger(400000, 500000)),
                                minute: ghostWhite,
                                mm: ghostWhite,
                                tSize: 15,
                                sSize: 10.8,
                              ),
                            )*/
                                  ],
                                ),
                              );
                      },
                    )
                  ],
                ),
              ),
            ),
            const PlayWithFriend(),
            Gap(240.r),
          ],
        ),
      ),
    );
  }
}

class PlayWithFriend extends ConsumerWidget {
  const PlayWithFriend({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 20,
      mainAxisCellCount: 9.6.h,
      child: Stack(
        children: [
          Positioned(
            top: 12.r,
            bottom: 3.r,
            left: 0.r,
            right: 0.r,
            child: Container(
              decoration: BoxDecoration(
                color: jasper,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              padding: EdgeInsets.only(top: 12.r, left: 15.r),
              margin: EdgeInsets.only(right: 24.w, left: 9.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    "Play with Friends",
                    style: TextStyle(
                      fontFamily: 'WendyOne',
                      fontSize: 36.r,
                      color: ghostWhite,
                    ),
                  ),
                  Gap(15.r),
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // ref.refresh(tournamentListenerNotifierProvider);
                          // context.router.push(const TournamentRoute());
                        },
                        style: ButtonStyle(
                          textStyle: MaterialStatePropertyAll(
                            TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 13.5.r,
                            ),
                          ),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 15.r)),
                          backgroundColor:
                              const MaterialStatePropertyAll(denim),
                        ),
                        child: const Text(
                          "PLAY ONLINE",
                          style: TextStyle(color: ghostWhite),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: -30.r,
            top: -15.r,
            bottom: -15.r,
            child: Lottie.asset('lottie/friends-playing.json', repeat: true),
          ),
        ],
      ),
    );
  }
}
