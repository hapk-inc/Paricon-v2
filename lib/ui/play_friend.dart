import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../enums/enums.dart';
import '../logic/app/size_provider.dart';
import '../values/colors.dart';
import 'board/board_player.dart';
import 'board/board_timer.dart';
import 'board/icon_grid.dart';
import 'my_theme.dart';

final SlidingPanelTheme _pTheme = SlidingPanelTheme();

@RoutePage()
class PlayFriendPage extends ConsumerWidget {
  const PlayFriendPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize screenSize = ref.watch(sizeProvider);
    final bool isPT = SizeNotifier(screenSize).isPT;

    return Scaffold(
      backgroundColor: majorelleBlue,
      body: SafeArea(
        bottom: false,
        child: SlidingUpPanel(
          borderRadius: _pTheme.slidingPanelRadius,
          color: _pTheme.slidingPanelColor,
          maxHeight: 240.h,
          defaultPanelState: PanelState.CLOSED,
          padding: _pTheme.slidingPanelPadding * 1.5,
          isDraggable: false,
          minHeight: 0,
          panel: Container(),
          body: !isPT
              ? Container()
              : SingleChildScrollView(
                  child: StaggeredGrid.count(
                    crossAxisCount: 15,
                    children: [
                      Gap(45.r),
                      StaggeredGridTile.fit(
                        crossAxisCellCount: 15,
                        child: SizedBox(
                          height: 600.h,
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
                      Gap(45.r),
                      StaggeredGridTile.fit(
                        crossAxisCellCount: 15,
                        child: Container(
                          color: ghostWhite,
                          height: 54.h,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                3,
                                // mockInteger(2, 3),
                                (index) => BoardPlayerTile(index),
                              ),
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

