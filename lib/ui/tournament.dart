import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/auth_provider.dart';
import '../logic/panel_provider.dart';
import '../logic/s_size.dart';
import '../logic/tournament_database.dart';
import '../logic/tournament_listener.dart';
import '../model/t_score.dart';
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

    /*final Widget panelWidget = ref.watch(internetConnectionProvider).when(
          data: (connectionResult) {
            return connectionResult == ConnectivityResult.none
                ? const NoInternetPanel()
                : Container();
          },
          error: (_, __) => Container(),
          loading: () => Container(),
        );*/

    final sSize = ref.read(sizeProvider);

    return Scaffold(
      backgroundColor: majorelleBlue,
      body: sSize != ScreenSize.phone
          ? Container()
          : SafeArea(
              top: true,
              bottom: false,
              child: SlidingUpPanel(
                controller: tPanelController,
                panel: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Container(),
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
                        Gap(45.r),
                        const StaggeredGridTile.count(
                          crossAxisCellCount: 20,
                          mainAxisCellCount: 31.2,
                          child: TournamentShow(),
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
        elevation: 3.r,
        child: Container(
          padding: EdgeInsets.all(4.5.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                flex: 2,
                child: FractionallySizedBox(
                  heightFactor: 1,
                  widthFactor: 1,
                  child: ShowTimerIndicator(),
                ),
              ),
              Expanded(
                flex: 9,
                child: FractionallySizedBox(
                  heightFactor: 1,
                  widthFactor: 1,
                  child: AnimatedContainer(
                    alignment: Alignment.center,
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
