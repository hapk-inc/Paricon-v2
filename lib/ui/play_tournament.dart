import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/board/notifier.dart';
import '../theme/sliding_panel.dart';
import '../values/colors.dart';
import 'board/board_timer.dart';
import 'board/icon_grid.dart';

final _pTheme = SlidingPanelTheme();

@RoutePage()
class PlayTournamentPage extends ConsumerStatefulWidget {
  const PlayTournamentPage({super.key});

  @override
  ConsumerState createState() => _PlayTournamentPageState();
}

class _PlayTournamentPageState extends ConsumerState<PlayTournamentPage> {
  late BoardNotifier boardNotifier;

  @override
  void initState() {
    boardNotifier = ref.refresh(boardNotifierProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*final sizeNotifier = ref.watch(sizeProvider.notifier);

    final bool isP = sizeNotifier.isP;
    final bool isPT = sizeNotifier.isPT;*/

    ref.listen(
      boardNotifierProvider.select((value) => value.everyFound),
      (previous, next) {
        if (next) {
          context.router.maybePop();
        }
      },
    );

    return Scaffold(
      backgroundColor: majorelleBlue,
      body: SafeArea(
        bottom: false,
        child: SlidingUpPanel(
          borderRadius: _pTheme.panelRadius,
          color: _pTheme.slidingPanelColor,
          maxHeight: 240.h,
          defaultPanelState: PanelState.CLOSED,
          padding: _pTheme.padding * 1.5,
          isDraggable: false,
          minHeight: 0,
          panel: Container(),
          body: /*!isPT
              ? Container()
              : */
              SingleChildScrollView(
            //padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: StaggeredGrid.count(
              crossAxisCount: 15,
              children: [
                Gap(45.r),
                StaggeredGridTile.fit(
                  crossAxisCellCount: 15,
                  child: AspectRatio(
                    aspectRatio: 0.72,
                    /*  aspectRatio: isP ? 0.72 : 0.9  */
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7.5.r),
                        child: const Column(
                          children: [
                            Flexible(child: IconTimer()),
                            Expanded(flex: 5, child: IconGrid())
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                /*  Gap(45.r),
                      const LeaderBoard(),
                      Gap(45.r),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
