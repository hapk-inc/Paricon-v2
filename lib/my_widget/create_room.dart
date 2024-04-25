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
    final bool isDashboardRoute =
        context.router.current.name == DashboardRoute.name;
    PanelController panel = isDashboardRoute
        ? ref.read(dashboardPanelControllerProvider)
        : ref.read(roomPanelControllerProvider);

    //final Room room = Room();
    /* PanelController panel = isDashboardRoute
        ? ref.read(dashboardPanelControllerProvider)
        : ref.read(roomPanelControllerProvider);*/
    //final Room room = ref.read(roomNotifierProvider).room;

    //
    //final Room room = ref.watch(createRoomNotifierProvider);
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
                  ref.read(panelNotifierProvider.notifier).state =
                      const BoardLevelPanel();
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
                          color: hookerGreen,
                          fontWeight: FontWeight.w300,
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
                  ref.read(panelNotifierProvider.notifier).state =
                      const BoardPlayerPanel();
                  panel.open();
                },
                child: Row(
                  children: [
                    AutoSizeText(
                      toBeginningOfSentenceCase(room.count?.name ?? "2 / 3") ??
                          "",
                      style: GoogleFonts.poppins(
                        textStyle: textTheme.bodySmall?.copyWith(
                          color: hookerGreen,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    ..._endWidget,
                  ],
                ),
              ),
            ),
            _WrapContainer(
              lWidth: 180.w,
              lChild: InkWell(
                onTap: () {
                  ref.read(panelNotifierProvider.notifier).state =
                      const BoardTypePanel();
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
                          color: hookerGreen,
                          fontWeight: FontWeight.w300,
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

/*class CreateRoom extends ConsumerStatefulWidget {
  const CreateRoom({super.key});

  @override
  ConsumerState createState() => _CreateRoomState();
}

class _CreateRoomState extends ConsumerState<CreateRoom> {
  late bool isDashboardRoute;
  late PanelController panel;

  //
  //late BoardLevel? level;
  //late BoardType? type;
  //late PlayerCount? boardPlayer;

  @override
  void initState() {
    isDashboardRoute = context.router.current.name == DashboardRoute.name;
    panel = isDashboardRoute
        ? ref.read(dashboardPanelControllerProvider)
        : ref.read(roomPanelControllerProvider);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final Room room = ref.watch(roomNotifierProvider).room;
    */ /*final dynamic notifier = isDashboardRoute
        ? ref.watch(dashboardNotifierProvider)
        : ref.watch(roomNotifierProvider);

    if (notifier is DashboardNotifier) {
      level = notifier.level;
      type = notifier.type;
      boardPlayer = notifier.playerCount;
    }
    if (notifier is RoomNotifier) {
      level = notifier.room?.level;
      type = notifier.room?.type;
      boardPlayer = notifier.room?.count;
    }*/ /*

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
                  ref.read(panelNotifierProvider.notifier).state =
                      const BoardLevelPanel();
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
                          color: hookerGreen,
                          fontWeight: FontWeight.w300,
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
                  ref.read(panelNotifierProvider.notifier).state =
                      const BoardPlayerPanel();
                  panel.open();
                },
                child: Row(
                  children: [
                    AutoSizeText(
                      toBeginningOfSentenceCase(room.count?.name ?? "2 / 3") ??
                          "",
                      style: GoogleFonts.poppins(
                        textStyle: textTheme.bodySmall?.copyWith(
                          color: hookerGreen,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    ..._endWidget,
                  ],
                ),
              ),
            ),
            _WrapContainer(
              lWidth: 180.w,
              lChild: InkWell(
                onTap: () {
                  ref.read(panelNotifierProvider.notifier).state =
                      const BoardTypePanel();
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
                          color: hookerGreen,
                          fontWeight: FontWeight.w300,
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
}*/

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

/*class CreateRoom extends ConsumerWidget {
  const CreateRoom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    void openPanel() {
      late PanelController panel;
      switch (context.router.current.name) {
        case DashboardRoute.name:
          {
            panel = ref.read(dashboardPanelControllerProvider);
            break;
          }
        case GameRoomRoute.name:
          {
            panel = ref.read(roomPanelControllerProvider);
            break;
          }
      }
      if (panel.isPanelClosed) panel.open();
    }

    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Wrap(
          spacing: 15.r,
          runSpacing: 15.r,
          children: [
            Container(
              width: 210.w,
              height: 51.h,
              decoration: BoxDecoration(
                color: magnolia,
                borderRadius: BorderRadius.circular(4.5.r),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: InkWell(
                onTap: () {
                  ref.read(panelNotifierProvider.notifier).state =
                      const BoardLevel();
                  openPanel();
                },
                child: Row(
                  children: [
                    AutoSizeText(
                      "Board Level",
                      style: GoogleFonts.poppins(
                        textStyle: textTheme.bodySmall?.copyWith(
                          color: hookerGreen,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_drop_down_outlined,
                      color: hookerGreen,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 90.w,
              height: 51.h,
              decoration: BoxDecoration(
                color: magnolia,
                borderRadius: BorderRadius.circular(4.5.r),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: InkWell(
                onTap: () {
                  ref.read(panelNotifierProvider.notifier).state =
                      const BoardPlayer();
                  openPanel();
                },
                child: Row(
                  children: [
                    AutoSizeText(
                      "vs.",
                      style: GoogleFonts.poppins(
                        textStyle: textTheme.bodySmall?.copyWith(
                          color: hookerGreen,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_drop_down_outlined,
                        color: hookerGreen)
                  ],
                ),
              ),
            ),
            Container(
              width: 180.w,
              height: 51.h,
              decoration: BoxDecoration(
                color: magnolia,
                borderRadius: BorderRadius.circular(4.5.r),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: InkWell(
                onTap: () {
                  ref.read(panelNotifierProvider.notifier).state =
                      const BoardType();
                  openPanel();
                },
                child: Row(
                  children: [
                    AutoSizeText(
                      "Board Type",
                      //style: textTheme.bodyMedium?.copyWith(color: gray),
                      style: GoogleFonts.poppins(
                        textStyle: textTheme.bodySmall?.copyWith(
                          color: hookerGreen,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_drop_down_outlined,
                        color: hookerGreen)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

/*switch (context.router.current.name) {
      case DashboardRoute.name:
        {
          panel = ref.read(dashboardPanelControllerProvider);
          level = ref.read(dashboardNotifierProvider).level;
          type = ref.read(dashboardNotifierProvider).type;
          boardPlayer = ref.read(dashboardNotifierProvider).player;
          break;
        }
      case GameRoomRoute.name:
        {
          panel = ref.read(roomPanelControllerProvider);
          level = ref.read(roomNotifierProvider).room?.level;
          type = ref.read(roomNotifierProvider).room?.type;
          boardPlayer = ref.read(roomNotifierProvider).room?.count;
          break;
        }
    }*/
