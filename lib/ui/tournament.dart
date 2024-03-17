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
import '../t_widget/t_show_timer_indicator.dart';
import '../t_widget/t_tournament_grid.dart';
import '../t_widget/tournament_footer.dart';
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
              .updateTDuration(tournamentListener.stopwatch.elapsed)
              .whenComplete(
                () => context.router.maybePop(),
              );
        }
      },
    );

    final SlidingPanelTheme pTheme = SlidingPanelTheme();

    final PanelController tPanelController = ref.watch(tournamentPanelProvider);

    final ScreenSize sSize = ref.read(sizeProvider);
    final bool isPhone = sSize == ScreenSize.phone;

    return Scaffold(
      backgroundColor: majorelleBlue,
      body: PopScope(
        onPopInvoked: (didPop) =>
            true /*ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Press ",
                    style: const TextStyle(color: emerald),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.router.pop(),
                  ),
                  const TextSpan(text: "here to exit the game.")
                ],
                style: TextStyle(fontSize: 15.r, fontFamily: 'Poppins'),
              ),
            ),
          ),
        )*/
        ,
        child: SafeArea(
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
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SingleChildScrollView(
                physics: isPhone ? const NeverScrollableScrollPhysics() : null,
                child: StaggeredGrid.count(
                  crossAxisCount: 20,
                  children: [
                    Gap(45.r),
                    const StaggeredGridTile.fit(
                      crossAxisCellCount: 20,
                      child: TournamentShow(),
                    ),
                    Gap(45.r),
                    const StaggeredGridTile.count(
                      crossAxisCellCount: 20,
                      mainAxisCellCount: 6,
                      child: PlayTournamentFooter(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TournamentShow extends ConsumerWidget {
  const TournamentShow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize sSize = ref.read(sizeProvider);
    final bool isPhone = sSize == ScreenSize.phone;
    return Card(
      color: ghostWhite,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.5.r),
      ),
      elevation: 3.r,
      child: SizedBox(
        height: 360.w * (isPhone ? 1.44 : 1.05),
        //padding: EdgeInsets.all(4.5.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(flex: 2, child: ShowTimerIndicator()),
            Expanded(
              flex: 12,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 15.r),
                child: const TournamentGrid(),
              ),
            ),
            /*  Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.r),
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    "When you tap on the block, that's when the timer begins.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: richBlack,
                      height: 1.8,
                      fontWeight: FontWeight.w200,
                      fontSize: 12.r,
                      letterSpacing: 0.3.r,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),*/
          ],
        ),
      ),
    );
  }
}
