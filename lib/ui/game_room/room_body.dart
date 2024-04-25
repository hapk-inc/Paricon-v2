import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:paricon/logic/auth/bloc.dart';
import 'package:paricon/model/room.dart';

import '../../logic/board/provider.dart';
import '../../logic/panel/bloc.dart';
import '../../logic/room/bloc.dart';
import '../../my_widget/create_room/board_level.dart';
import '../../my_widget/create_room/board_player.dart';
import '../../my_widget/create_room/board_type.dart';
import '../../values/colors.dart';
import 'enter_code.dart';

class RoomBody extends ConsumerWidget {
  final Room room;
  const RoomBody(this.room, {super.key});

  //final Room room;
  //const RoomBody(this.room, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final user = ref.read(authUserProvider).value?.uid;
    final bool isCreator = user == room.creator;
    return StaggeredGrid.count(
      crossAxisCount: 15,
      children: [
        const _RoomGap(1.2),
        StaggeredGridTile.fit(
          crossAxisCellCount: 15,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Wrap(
              spacing: 15.r,
              runSpacing: 15.r,
              children: [
                _WrapContainer(
                  lWidth: 210.w,
                  lChild: InkWell(
                    onTap: () {
                      if (isCreator) {
                        ref.read(panelNotifierProvider.notifier).state =
                            const BoardLevelPanel();
                        ref.read(roomPanelControllerProvider).open();
                      }
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
                      if (isCreator) {
                        ref.read(panelNotifierProvider.notifier).state =
                            const BoardPlayerPanel();
                        ref.read(roomPanelControllerProvider).open();
                      }
                    },
                    child: Row(
                      children: [
                        AutoSizeText(
                          toBeginningOfSentenceCase(
                                  room.count?.name ?? "2 / 3") ??
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
                      if (isCreator) {
                        ref.read(panelNotifierProvider.notifier).state =
                            const BoardTypePanel();
                        ref.read(roomPanelControllerProvider).open();
                      }
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
        ),
        const _RoomGap(1.2),
        StaggeredGridTile.fit(
          crossAxisCellCount: 15,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text("Participants", style: textTheme.bodyMedium),
          ),
        ),
        const _RoomGap(0.3),
        StaggeredGridTile.count(
          crossAxisCellCount: 15,
          mainAxisCellCount: 3.6,
          child: Center(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 30.w),
              itemBuilder: (_, index) => CircleAvatar(radius: 36.r),
              separatorBuilder: (_, __) => Gap(15.r),
              //itemCount: 0,
              itemCount: room.players?.length ?? 0,
            ),
          ),
        ),
        const _RoomGap(0.3),
        StaggeredGridTile.fit(
          crossAxisCellCount: 15,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text("Room Code", style: textTheme.bodyMedium),
          ),
        ),
        const _RoomGap(0.75),
        StaggeredGridTile.count(
          crossAxisCellCount: 15,
          mainAxisCellCount: 2.4,
          child: Center(
            child: InkWell(
              onTap: () {
                ref.read(panelNotifierProvider.notifier).state =
                    const EnterCode();
                if (ref.read(roomPanelControllerProvider).isPanelClosed) {
                  ref.read(roomPanelControllerProvider).open();
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                decoration: BoxDecoration(
                  color: magnolia,
                  borderRadius: BorderRadius.circular(7.5.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  "${room.code}",
                  // "${mockInteger(111111, 999999)}",
                  style: GoogleFonts.russoOne(
                    textStyle: TextStyle(
                      fontSize: 30.r,
                      height: 0,
                      letterSpacing: 4.5.w,
                      fontWeight: FontWeight.w700,
                      color: charcoal,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const _RoomGap(0.75),
        const StaggeredGridTile.fit(
          crossAxisCellCount: 15,
          child: Center(
            child: Text(
              "Share the above code to invite",
              style: TextStyle(color: frenchGray),
            ),
          ),
        ),
        const _RoomGap(3),
        StaggeredGridTile.fit(
          crossAxisCellCount: 15,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(hookerGreen),
              ),
              //onPressed: () => context.router.replace(const PlayFriendRoute()),
              onPressed: () =>
                  ref.read(createPlayFriendBoardProvider.future).then(
                (value) {
                  ref.read(setGameRoomStartProvider);
                },
              ),
              child: const Text("Create Room"),
            ),
          ),
        ),
      ],
    );
  }
}

class _RoomGap extends StatelessWidget {
  final double mainAxis;
  const _RoomGap(this.mainAxis);

  @override
  Widget build(BuildContext context) => StaggeredGridTile.count(
        crossAxisCellCount: 15,
        mainAxisCellCount: mainAxis,
        child: const SizedBox(),
      );
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
