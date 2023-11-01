import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:paricon/logic/auth.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../theme/my_color.dart';
import '../logic/dashboard_provider.dart';
import '../logic/firebase_init.dart';
import '../logic/s_size.dart';
import '../logic/tournament_listener.dart';
import '../model/t_score.dart';
import '../my_widget/no_internet_panel.dart';
import '../my_widget/tournament_grid.dart';
import '../theme/my_theme.dart';

@RoutePage()
class TournamentPage extends ConsumerWidget {
  const TournamentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseUser = ref.read(firebaseUserProvider);
    final tournamentListener = ref.read(tournamentListenerNotifierProvider);
    ref.listen(
      tournamentListenerNotifierProvider
          .select<bool>((value) => value.allFound),
      (_, next) {
        if (next) {
          ref
              .read(tournamentDatabaseProvider)
              .updateTDuration(
                TScore(
                  userId: firebaseUser.uid,
                  playedAt: DateTime.now(),
                  tDuration: tournamentListener.stopwatch.elapsed,
                ),
              )
              .whenComplete(
                () => context.router.pop(),
              );
        }
      },
    );

    final SlidingPanelTheme pTheme = SlidingPanelTheme();

    final PanelController tPanelController = ref.watch(tournamentPanelProvider);

    final Widget panelWidget = ref.watch(internetConnectionProvider).when(
        data: (connectionResult) {
          return connectionResult == ConnectivityResult.none
              ? const NoInternetPanel()
              : Container();
        },
        error: (_, __) => Container(),
        loading: () => Container());

    ref.listen(
      internetConnectionProvider.select((value) => value.value),
      (previous, next) {
        debugPrint("$next");
        if (next != null) {
          debugPrint("66-connection-$next");
          bool noNet = next == ConnectivityResult.none;
          if (noNet) {
            if (tPanelController.isPanelClosed) {
              tPanelController.open();
            }
          } else {
            if (tPanelController.isPanelOpen) {
              tPanelController.close();
            }
          }
        }
      },
    );

    final sSize = ref.read(sizeProvider);
    return Scaffold(
      // appBar: buildAppBar(sSize, context),
      body: sSize != ScreenSize.phone
          ? Container()
          : SafeArea(
              top: false,
              bottom: false,
              child: SlidingUpPanel(
                controller: tPanelController,
                panel: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: panelWidget,
                ),
                isDraggable: false,
                backdropColor: richBlack,
                backdropEnabled: true,
                backdropOpacity: 0.9,
                borderRadius: pTheme.slidingPanelRadius,
                minHeight: 0,
                maxHeight: pTheme.slidingPanelHeight,
                body: Container(
                  color: majorelleBlue,
                  constraints: const BoxConstraints.expand(),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: StaggeredGrid.count(
                      crossAxisCount: 20,
                      children: [
                        const StaggeredGridTile.count(
                          crossAxisCellCount: 20,
                          mainAxisCellCount: 4.5,
                          child: SizedBox(),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 20,
                          mainAxisCellCount: 30,
                          child: Card(
                            color: ghostWhite,
                            margin: EdgeInsets.symmetric(horizontal: 15.r),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.5.r),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(4.5.r),
                              child: Column(
                                children: [
                                  const Flexible(
                                    flex: 2,
                                    child: ShowTimerIndicator(),
                                  ),
                                  Expanded(
                                    flex: 11,
                                    child: FractionallySizedBox(
                                      heightFactor: 1,
                                      widthFactor: 1,
                                      child: AnimatedContainer(
                                        //color: coyote,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 9.r),
                                        child: const TournamentGrid(),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.5.r),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "When you tap on the block, that's when the timer begins.",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: richBlack,
                                          height: 1.8,
                                          fontWeight: FontWeight.w200,
                                          fontSize: 11.1.r,
                                          letterSpacing: 0.3.r,
                                        ),
                                        //maxLines: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const StaggeredGridTile.count(
                          crossAxisCellCount: 20,
                          mainAxisCellCount: 15,
                          child: SizedBox(),
                        ),
                        /*StaggeredGridTile.count(
                          crossAxisCellCount: 20,
                          mainAxisCellCount: 15,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18.r,
                              vertical: 15.r,
                            ),
                            child: DefaultTextStyle(
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: azure,
                                height: 1.5,
                                fontSize: 24.r,
                                fontWeight: FontWeight.w500,
                              ),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  FadeAnimatedText(
                                    'Press any block ' 'to start the game',
                                  ),
                                  //FadeAnimatedText('do it RIGHT!!'),
                                  //FadeAnimatedText('do it RIGHT NOW!!!'),
                                ],
                                //repeatForever: true,
                                totalRepeatCount: 2,
                                stopPauseOnTap: true,
                              ),
                            ),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

class ShowTimerIndicator extends ConsumerWidget {
  const ShowTimerIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tournamentListener = ref.watch(tournamentListenerNotifierProvider);
    final Duration gameDuration = tournamentListener.stopwatch.elapsed;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 7.5.r),
      title: SizedBox(
        height: 60.h,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(Icons.timer, size: 24.r, color: gunMetal),
                SizedBox.square(dimension: 7.5.r),
                AnimatedFlipCounter(
                  value: gameDuration.inMinutes,
                  suffix: " : ",
                  wholeDigits: 2,
                  textStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    fontSize: 18.r,
                    color: barnRed,
                    letterSpacing: 0.12.r,
                  ),
                ),
                SizedBox.square(dimension: 1.5.r),
                AnimatedFlipCounter(
                  value: gameDuration.inSeconds % 60,
                  wholeDigits: 2,
                  textStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    fontSize: 18.r,
                    color: barnRed,
                    letterSpacing: 0.12.r,
                  ),
                ),
              ],
            ),
          ),
          trailing: InkWell(
            onTap: () {
              ref.refresh(tournamentListenerNotifierProvider);
              context.router.pop();
            },
            child: Icon(Icons.close, size: 21.r),
          ),
        ),
      ),
      subtitle: ClipRRect(
        borderRadius: BorderRadius.circular(3.r),
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          tween: Tween<double>(
            begin: 0,
            end: tournamentListener.balancePercentage,
          ),
          builder: (_, value, __) => LinearProgressIndicator(
            value: value,
            color: majorelleBlue,
            backgroundColor: periwinkle,
            minHeight: 4.5.r,
          ),
        ),
      ),
    );
  }
}
