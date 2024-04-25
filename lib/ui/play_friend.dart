import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/board/notifier.dart';
import '../logic/panel/bloc.dart';
import '../theme/sliding_panel.dart';
import '../values/colors.dart';
import 'board/board_timer.dart';
import 'board/icon_grid.dart';

import 'board/player_tile.dart';

final SlidingPanelTheme _pTheme = SlidingPanelTheme();

@RoutePage()
class PlayFriendPage extends ConsumerStatefulWidget {
  const PlayFriendPage({super.key});

  @override
  ConsumerState createState() => _PlayFriendPageState();
}

class _PlayFriendPageState extends ConsumerState<PlayFriendPage> {
  late PanelController panelController;
  late BoardNotifier boardNotifier;

  @override
  void initState() {
    panelController = ref.read(playFriendPanelControllerProvider);
    boardNotifier = ref.refresh(boardNotifierProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    boardNotifier = ref.watch(boardNotifierProvider);
    if (boardNotifier.board == null) return const Scaffold();
    return Scaffold(
      backgroundColor: majorelleBlue,
      body: SafeArea(
        bottom: false,
        child: SlidingUpPanel(
          controller: panelController,
          borderRadius: _pTheme.panelRadius,
          color: _pTheme.slidingPanelColor,
          maxHeight: 240.h,
          defaultPanelState: PanelState.CLOSED,
          padding: _pTheme.padding * 1.5,
          isDraggable: false,
          minHeight: 0,
          panel: Container(),
          body: SingleChildScrollView(
            child: StaggeredGrid.count(
              crossAxisCount: 15,
              children: [
                Gap(boardNotifier.board!.icons.length == 30 ? 90.r : 45.r),
                StaggeredGridTile.fit(
                  crossAxisCellCount: 15,
                  child: AspectRatio(
                    aspectRatio:
                        boardNotifier.board!.icons.length == 30 ? 0.96 : 0.72,
                    child: FadeIn(
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
                ),
                Gap(45.r),
                StaggeredGridTile.count(
                  crossAxisCellCount: 15,
                  mainAxisCellCount: 4.5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        boardNotifier.board!.players.length,
                        (index) {
                          final p = boardNotifier.board!.players;
                          return LocalPlayerTile(
                            p.keys.elementAt(index),
                            p.values.elementAt(index),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
