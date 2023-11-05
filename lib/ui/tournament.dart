import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/auth_provider.dart';
import '../logic/firebase_init.dart';
import '../logic/panel_provider.dart';
import '../logic/s_size.dart';
import '../logic/tournament_database.dart';
import '../logic/tournament_listener.dart';
import '../model/t_score.dart';
import '../my_widget/no_internet_panel.dart';
import '../t_widget/t_show_timer_indicator.dart';
import '../t_widget/t_tournament_grid.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

@RoutePage()
class TournamentPage extends ConsumerWidget {
  const TournamentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? firebaseUser = ref.watch(authUserProvider).value;
    final tournamentListener = ref.read(tournamentListenerNotifierProvider);

    ref.listen(
      tournamentListenerNotifierProvider
          .select<bool>((value) => value.allFound),
      (_, next) {
        if (next && firebaseUser != null) {
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
          loading: () => Container(),
        );

    final sSize = ref.read(sizeProvider);

    return Scaffold(
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
                      children: const [
                        StaggeredGridTile.count(
                          crossAxisCellCount: 20,
                          mainAxisCellCount: 4.5,
                          child: SizedBox(),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 20,
                          mainAxisCellCount: 30,
                          child: TournamentShow(),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 20,
                          mainAxisCellCount: 15,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

class TournamentShow extends StatelessWidget {
  const TournamentShow({super.key});

  @override
  Widget build(BuildContext context) => Card(
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
                    duration: const Duration(milliseconds: 500),
                    padding: EdgeInsets.symmetric(horizontal: 9.r),
                    child: const TournamentGrid(),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.r,
                  ),
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
      );
}
