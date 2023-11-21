import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../dashboard/in_progress.dart';
import '../logic/auth_provider.dart';
import '../logic/card_avatar_notifier.dart';
import '../logic/dashboard_provider.dart';
import '../logic/panel_provider.dart';
import '../logic/remote_values.dart';
import '../logic/t_score.dart';
import '../logic/tournament_database.dart';
import '../logic/tournament_listener.dart';
import '../logic/user_activity_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../model/t_duration.dart';
import '../model/user_activity.dart';
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
  late PageController _pageController;
  late int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();
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
                body: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    const _Tournament(),
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
    final tTheme = Theme.of(context).textTheme.titleLarge!;

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
            StaggeredGridTile.fit(
              crossAxisCellCount: 20,
              child: SlideInLeft(
                child: FadeIn(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: AnimatedDefaultTextStyle(
                      style: tTheme.copyWith(
                        color: majorelleBlue,
                        fontSize: 24.r,
                        fontFamily: 'WendyOne',
                      ),
                      duration: const Duration(milliseconds: 500),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: myUser.name,
                                style: TextStyle(
                                  color: majorelleBlue,
                                  fontSize: 30.r,
                                ),
                              ),
                              TextSpan(
                                  text: " 👋", style: TextStyle(fontSize: 45.r))
                            ],
                          ),
                          key: ValueKey(myUser.name),
                          maxLines: 1,
                          minFontSize: 21,
                          maxFontSize: 45,
                          stepGranularity: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 20,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                alignment: Alignment.centerLeft,
                child: AnimatedDefaultTextStyle(
                  style: TextStyle(
                    fontSize: 10.8.r,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    height: 2.1.r,
                    color: violetBlue,
                  ),
                  textAlign: TextAlign.start,
                  duration: const Duration(milliseconds: 300),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: myUser.avatar == null
                        ? AutoSizeText.rich(
                            TextSpan(
                              children: [
                                ...[
                                  TextSpan(
                                      text: ref.read(welcomeSubtitleProvider)),
                                  TextSpan(
                                    text: "click here",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => ref.read(
                                          setCardAvatarProvider(fUser!.uid)),
                                    style:
                                        const TextStyle(color: darkPastelGreen),
                                  ),
                                ],
                              ],
                            ),
                            maxLines: 1,
                            minFontSize: 6,
                            maxFontSize: 12,
                          )
                        : AutoSizeText(
                            ref.read(goodDayProvider),
                            maxLines: 1,
                            style: TextStyle(color: gray, fontSize: 12.r),
                          ),
                  ),
                ),
              ),
            ),
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

class TButton extends ConsumerWidget {
  const TButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 20,
      mainAxisCellCount: 9.6.h,
      child: Stack(
        children: [
          Positioned(
            top: 18.r,
            bottom: 3.r,
            left: 0,
            right: 60.r,
            child: Container(
              decoration: BoxDecoration(
                color: denim,
                borderRadius: BorderRadius.circular(6.r),
              ),
              padding: EdgeInsets.all(9.r),
              margin: EdgeInsets.only(right: 24.w, left: 9.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Open Challenge",
                    style: TextStyle(
                      fontFamily: 'WendyOne',
                      fontSize: 30.r,
                      color: ghostWhite,
                    ),
                  ),
                  Gap(15.r),
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ref.refresh(tournamentListenerNotifierProvider);
                          context.router.push(const TournamentRoute());
                        },
                        style: ButtonStyle(
                          textStyle: MaterialStatePropertyAll(
                            TextStyle(
                              fontFamily: 'Poppins',
                              color: ghostWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: 13.5.r,
                            ),
                          ),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 15.r)),
                          backgroundColor:
                              const MaterialStatePropertyAll(jasper),
                        ),
                        child: const Text(
                          "PLAY NOW",
                          style: TextStyle(color: ghostWhite),
                        ),
                      ),
                      /*OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          side: MaterialStatePropertyAll(
                            BorderSide(
                              width: 0.6.r,
                              color: charcoal,
                            ),
                          ),
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 18.w),
                          ),
                          textStyle: MaterialStatePropertyAll(
                            TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.3.r,
                              color: charcoal,
                              fontSize: 13.5.r,
                            ),
                          ),
                        ),
                        child: const Text(
                          "VIEW LEADERBOARD",
                          style: TextStyle(color: charcoal),
                        ),
                      ),*/
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: -60.r,
            top: -15.r,
            bottom: -15.r,
            child: Lottie.asset('lottie/trophies.json', repeat: false),
          ),
        ],
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

class RecentPlayer extends ConsumerWidget {
  const RecentPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User fUser = ref.watch(authUserProvider).value!;
    final tTheme = Theme.of(context).textTheme.titleLarge!;
    return StaggeredGridTile.fit(
      crossAxisCellCount: 20,
      child: AnimatedContainer(
        height: 90.h,
        duration: const Duration(milliseconds: 500),
        margin: EdgeInsets.only(top: 9.h),
        //color: mayaBlue,
        child: FirebaseAnimatedList(
          scrollDirection: Axis.horizontal,
          sort: (DataSnapshot a, DataSnapshot b) {
            Map<String, dynamic> a1 = Map<String, dynamic>.from(a.value as Map);
            Map<String, dynamic> b1 = Map<String, dynamic>.from(b.value as Map);

            final UserActivity x = UserActivity.fromJson(a1);
            final UserActivity y = UserActivity.fromJson(b1);
            return y.nowTime.compareTo(x.nowTime);
          },
          query: ref.watch(recentUserProvider),
          padding: EdgeInsets.only(left: 15.w),
          defaultChild: FadeIn(
            child: Center(
              child: Text(
                "Loading",
                style: tTheme.copyWith(fontFamily: 'DelaGothic', color: gray),
              ),
            ),
          ),
          itemBuilder: (_, DataSnapshot snapshot, Animation<double> animation,
              int index) {
            if (fUser.uid == snapshot.key!) return Container();

            Map<String, dynamic> json =
                Map<String, dynamic>.from(snapshot.value as Map);
            final UserActivity xUser = UserActivity.fromJson(json);

            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: EdgeInsets.only(right: 6.w, left: 6.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: xUser.isActive ? 1 : 0.3,
                    duration: const Duration(milliseconds: 500),
                    child: Card(
                      elevation: 1.5.r,
                      shape: const CircleBorder(),
                      child: CircleAvatar(
                        radius: 31.5.r,
                        backgroundColor: violetBlue,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: xUser.avatar == null
                              ? Text(
                                  xUser.name!.substring(0, 2).toUpperCase(),
                                  style: tTheme.copyWith(
                                      color: lightOrange, fontSize: 24.r),
                                )
                              : FadeIn(
                                  child: RandomAvatar(
                                    xUser.avatar!,
                                    trBackground: true,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                  Gap(3.r),
                  Expanded(
                    child: AutoSizeText(
                      firstCaps(xUser.name!),
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 10.5.r,
                        height: 1.8.r,
                        fontFamily: 'Poppins',
                        color: violetBlue,
                        fontWeight: FontWeight.w300,
                      ),
                      wrapWords: false,
                      maxFontSize: 15,
                      minFontSize: 9,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class EnterTournamentCode extends StatelessWidget {
  const EnterTournamentCode({super.key});

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      tappable: false,
      closedElevation: 0,
      closedColor: ghostWhite,
      closedShape:
          const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      closedBuilder: (_, void Function() action) => Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Ready, Set, Game : Join the Tournament 🏆",
                    style: TextStyle(
                      fontSize: 24.r,
                      fontFamily: 'WendyOne',
                      height: 1.8.r,
                      color: cinerous,
                    ),
                    maxLines: 3,
                  ),
                  Gap(6.r),
                  AutoSizeText(
                    "Challenge the Best, Be the Best – It's Your Time to Dominate!",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          height: 2.1.r,
                          color: cinerous,
                          letterSpacing: 0,
                        ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: EdgeInsets.symmetric(vertical: 24.r),
              height: 48.r,
              decoration: BoxDecoration(
                color: cinerous,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              child: InkWell(
                onTap: action,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7.5.r),
                  child: Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 225.w,
                        color: lavenderWeb,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          "PARICON",
                          style: TextStyle(
                            fontFamily: 'Cabin',
                            fontSize: 15.r,
                            letterSpacing: 0.45.r,
                            fontWeight: FontWeight.w400,
                            color: vanDyke.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "ENTER CODE",
                            style: TextStyle(
                              fontFamily: 'Cabin',
                              fontSize: 13.5.r,
                              color: ghostWhite,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      openBuilder: (_, void Function({bool? returnValue}) action) => InkWell(
        onTap: action,
        child: Container(
          color: lavenderWeb,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "No Tournaments yet!",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontFamily: 'DelaGothic', color: vanDyke),
              )
            ],
          ),
        ),
      ),
    );
  }
}
