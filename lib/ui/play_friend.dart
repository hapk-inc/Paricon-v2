import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_data/mock_data.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/panel/bloc.dart';
import '../theme/sliding_panel.dart';
import '../values/colors.dart';
import '../values/names.dart';
import 'board/board_timer.dart';
import 'board/icon_grid.dart';
import 'package:badges/badges.dart' as badge;

final SlidingPanelTheme _pTheme = SlidingPanelTheme();

@RoutePage()
class PlayFriendPage extends ConsumerStatefulWidget {
  const PlayFriendPage({super.key});

  @override
  ConsumerState createState() => _PlayFriendPageState();
}

class _PlayFriendPageState extends ConsumerState<PlayFriendPage> {
  late PanelController panelController;

  @override
  void initState() {
    panelController = ref.read(playFriendPanelControllerProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                  Gap(45.r),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 15,
                    child: AspectRatio(
                      aspectRatio: 0.72,
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
                  StaggeredGridTile.count(
                    crossAxisCellCount: 15,
                    mainAxisCellCount: 4.5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          3,
                          (index) => SizedBox(
                            width: 96.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                badge.Badge(
                                  badgeStyle: const badge.BadgeStyle(
                                      badgeColor: jasper),
                                  badgeContent: CircleAvatar(
                                      radius: 12.r,
                                      backgroundColor: Colors.transparent,
                                      child: AnimatedFlipCounter(
                                        value: mockInteger(1, 15),
                                        wholeDigits: 2,
                                        textStyle: GoogleFonts.russoOne(
                                          textStyle: TextStyle(
                                            fontSize: 15.r,
                                            height: 0,
                                            fontWeight: FontWeight.w700,
                                            color: ghostWhite,
                                          ),
                                        ),
                                      )),
                                  child: CircleAvatar(radius: 36.r),
                                ),
                                Gap(7.5.r),
                                Text(
                                  NameGen.dummyName(),
                                  style: const TextStyle(color: ghostWhite),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
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
