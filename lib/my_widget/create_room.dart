import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/panel/bloc.dart';
import '../logic/room/bloc.dart';
import '../logic/room/create_room.dart';
import '../model/room.dart';
import '../router/my_route.dart';
import '../values/colors.dart';
import 'create_room/board_level.dart';
import 'create_room/board_player.dart';
import 'create_room/board_type.dart';

class CreateRoom extends ConsumerWidget {
  final Room room;
  const CreateRoom(this.room, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Wrap(
          spacing: 15.r,
          runSpacing: 15.r,
          children: [
            _WrapContainer(
              lWidth: 210.w,
              lChild: InkWell(
                onTap: () {
                  final bool isDashboardRoute =
                      context.router.current.name == DashboardRoute.name;
                  PanelController panel = isDashboardRoute
                      ? ref.read(dashboardPanelControllerProvider)
                      : ref.read(roomPanelControllerProvider);
                  ref.read(panelNotifierProvider.notifier).state =
                      const LevelPanel();
                  panel.open();
                },
                child: Row(
                  children: [
                    AutoSizeText(
                      toBeginningOfSentenceCase(
                              room.level?.name ?? "Board Level") ??
                          "",
                      style: GoogleFonts.poppins(
                        textStyle: textTheme.bodySmall?.copyWith(
                          color: darkPurple,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ..._endWidget,
                  ],
                ),
              ),
            ),
            _WrapContainer(
              lWidth: 90.w,
              lChild: InkWell(
                onTap: () {
                  final bool isDashboardRoute =
                      context.router.current.name == DashboardRoute.name;
                  PanelController panel = isDashboardRoute
                      ? ref.read(dashboardPanelControllerProvider)
                      : ref.read(roomPanelControllerProvider);

                  ref.read(panelNotifierProvider.notifier).state =
                      const PlayerPanel();
                  panel.open();
                },
                child: Row(
                  children: [
                    AutoSizeText(
                      toBeginningOfSentenceCase(room.count?.name ?? "2 / 3") ??
                          "",
                      style: GoogleFonts.poppins(
                        textStyle: textTheme.bodySmall?.copyWith(
                          color: darkPurple,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ..._endWidget,
                  ],
                ),
              ),
            ),
            _WrapContainer(
              lWidth: 150.w,
              lChild: InkWell(
                onTap: () {
                  final bool isDashboardRoute =
                      context.router.current.name == DashboardRoute.name;
                  PanelController panel = isDashboardRoute
                      ? ref.read(dashboardPanelControllerProvider)
                      : ref.read(roomPanelControllerProvider);

                  //
                  ref.read(panelNotifierProvider.notifier).state =
                      const TypePanel();
                  panel.open();
                },
                child: Row(
                  children: [
                    AutoSizeText(
                      toBeginningOfSentenceCase(
                              room.type?.name ?? "Board Type") ??
                          "",
                      style: GoogleFonts.poppins(
                        textStyle: textTheme.bodySmall?.copyWith(
                          color: darkPurple,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ..._endWidget,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WrapContainer extends StatelessWidget {
  final Widget lChild;
  final double lWidth;

  const _WrapContainer({required this.lWidth, required this.lChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: lWidth,
      height: 51.h,
      decoration: BoxDecoration(
        color: magnolia,
        borderRadius: BorderRadius.circular(4.5.r),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: lChild,
    );
  }
}

List<Widget> get _endWidget => [
      const Spacer(),
      const Icon(
        Icons.arrow_drop_down_outlined,
        color: hookerGreen,
      )
    ];
