import 'package:animated_emoji/animated_emoji.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../logic/dashboard_panel_provider.dart';
import '../router/my_route.dart';

import '../theme/my_color.dart';
import 'view_leaderboard.dart';

class EnterTournamentCode extends ConsumerWidget {
  const EnterTournamentCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => OpenContainer<bool>(
        tappable: false,
        closedElevation: 0,
        closedColor: ghostWhite,
        closedShape:
            const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        closedBuilder: (_, void Function() action) =>
            TournamentCodeClosed(action),
        openBuilder: (_, void Function({bool? returnValue}) action) =>
            // TournamentCodeOpen(action),
            AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: ref.watch(dashboardPanelNotifierProvider).openBuilder),
      );
}

class TournamentCodeClosed extends ConsumerWidget {
  final void Function() action;
  const TournamentCodeClosed(this.action, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EnterTournamentCodeClosedTitle(action),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: EdgeInsets.symmetric(vertical: 24.r),
              height: 48.r,
              decoration: BoxDecoration(
                color: cinerous,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.5.r),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 225.w,
                      color: magnolia,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: InkWell(
                        onTap: () {
                          ref.read(dashboardPanelNotifierProvider).openBuilder =
                              TournamentCodeOpen(action);
                          action.call();
                        },
                        child: Text(
                          "PARICON",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15.r,
                            letterSpacing: 0.45.r,
                            fontWeight: FontWeight.w400,
                            color: vanDyke.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () =>
                            context.router.push(const TournamentRoute()),
                        child: Center(
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: ghostWhite,
                              fontWeight: FontWeight.w700,
                            ),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                'PLAY NOW',
                                'TRY NOW',
                                'START NOW',
                              ].map((e) => ScaleAnimatedText(e)).toList(),
                              isRepeatingAnimation: true,
                              repeatForever: true,
                              onTap: () =>
                                  context.router.push(const TournamentRoute()),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
}

class EnterTournamentCodeClosedTitle extends StatelessWidget {
  final void Function() action;
  const EnterTournamentCodeClosedTitle(this.action, {super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme tTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: SizedBox.square(
                    dimension: 45.r,
                    child: const AnimatedEmoji(
                      AnimatedEmojis.chequeredFlag,
                      errorWidget: Center(child: Text("🏁")),
                    ),
                  ),
                ),
                WidgetSpan(child: SizedBox.square(dimension: 12.r)),
                const TextSpan(
                  text: "Ready, Set, Game : "
                      "Join the Tournament 🏆",
                )
              ],
              style: tTheme.bodyMedium!.copyWith(
                height: 1.8.r,
                color: cinerous,
              ),
            ),
            maxLines: 3,
          ),
          EnterTournamentClosedSubtitle(action),
        ],
      ),
    );
  }
}

class TournamentCodeOpen extends StatelessWidget {
  final void Function(/*{bool? returnValue}*/) action;

  const TournamentCodeOpen(this.action, {super.key});

  @override
  Widget build(BuildContext context) {
    final tTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        color: lavenderWeb,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        alignment: Alignment.center,
        child: Text(
          "No Tournaments yet!",
          style: tTheme.titleLarge!.copyWith(
            fontFamily: 'DelaGothic',
            color: vanDyke,
          ),
        ),
      ),
    );
  }
}

class EnterTournamentClosedSubtitle extends ConsumerStatefulWidget {
  final void Function() action;
  const EnterTournamentClosedSubtitle(this.action, {super.key});

  @override
  ConsumerState createState() => _EnterTournamentClosedSubtitleState();
}

class _EnterTournamentClosedSubtitleState
    extends ConsumerState<EnterTournamentClosedSubtitle> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    final tTheme = Theme.of(context).textTheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 30.h,
      alignment: Alignment.centerLeft,
      //color: cornellRed,
      child: DefaultTextStyle(
        style: tTheme.bodySmall!.copyWith(color: gray, fontSize: 12.r),
        child: AnimatedTextKit(
          repeatForever: true,
          pause: const Duration(seconds: 3),
          animatedTexts: [
            "Challenge the Best, Be the Best – It's Your Time to Dominate!",
            "Click here to see full leaderboard",
            "Take a look at the games played recently, listed below.",
          ]
              .map(
                (e) => RotateAnimatedText(
                  e,
                  alignment: Alignment.centerLeft,
                  rotateOut: false,
                  duration: const Duration(milliseconds: 500),
                ),
              )
              .toList(),
          onNext: (index, flag) {
            setState(() => i = index);
          },
          onTap: () {
            ref.read(dashboardPanelNotifierProvider).openBuilder =
                const ViewLeaderBoard();
            widget.action.call();
          },
        ),
      ),
    );
  }
}
