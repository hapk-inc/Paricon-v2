import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';

import '../../logic/board/provider.dart';
import '../../logic/room/bloc.dart';
import '../../model/room.dart';
import '../../my_widget/create_room.dart';
import '../../router/my_route.dart';
import '../../values/colors.dart';

class RoomWidget extends ConsumerWidget {
  final Room room;
  const RoomWidget(this.room, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    ref.listen(
      roomProvider.select((value) => value.value?.started ?? false),
      (_, next) {
        if (next) context.router.replace(const PlayFriendRoute());
      },
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(15.r),
        AutoSizeText(
          "Hosting the room",
          maxLines: 2,
          style: textTheme.titleLarge?.copyWith(color: ghostWhite),
        ),
        Gap(30.r),
        Container(
          height: 480.h,
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            color: ghostWhite,
            borderRadius: BorderRadius.circular(7.5.r),
            boxShadow: [
              BoxShadow(color: charcoal, blurRadius: 24.r),
            ],
          ),
          //alignment: Alignment.center,
          child: StaggeredGrid.count(
            crossAxisCount: 15,
            children: [
              const StaggeredGridTile.count(
                crossAxisCellCount: 15,
                mainAxisCellCount: 1.5,
                child: SizedBox(),
              ),
              CreateRoom(room),
              const StaggeredGridTile.count(
                crossAxisCellCount: 15,
                mainAxisCellCount: 1.5,
                child: SizedBox(),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 15,
                mainAxisCellCount: 2.1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  alignment: Alignment.center,
                  child: ListTile(
                    leading: const Icon(
                      Icons.groups_2,
                      size: 30,
                      color: charcoal,
                    ),
                    horizontalTitleGap: 15.w,
                    title: Text(room.onlyYou
                        ? "Only You"
                        : (room.players ?? {})
                            .values
                            .fold("", (prev, n) => prev + ", ${n.name}")),
                    titleTextStyle: textTheme.bodyMedium,
                  ),
                ),
              ),
              const StaggeredGridTile.fit(
                crossAxisCellCount: 15,
                child: Divider(
                  indent: 7.5,
                  endIndent: 7.5,
                  color: frenchGray,
                  height: 30,
                  thickness: 0.75,
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 15,
                mainAxisCellCount: 1.5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Room code",
                    style: textTheme.bodyMedium?.copyWith(color: gray),
                  ),
                ),
              ),
              const StaggeredGridTile.count(
                crossAxisCellCount: 15,
                mainAxisCellCount: 0.3,
                child: SizedBox(),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 15,
                mainAxisCellCount: 3,
                child: Container(
                  color: magnolia,
                  alignment: Alignment.center,
                  child: AnimatedFlipCounter(
                    value: room.code ?? 000000,
                    wholeDigits: 6,
                    textStyle: const TextStyle(
                      letterSpacing: 15,
                      fontFamily: 'RussoOne',
                      fontSize: 30,
                      color: darkPurple,
                    ),
                  ),
                ),
              ),
              const StaggeredGridTile.count(
                crossAxisCellCount: 15,
                mainAxisCellCount: 0.75,
                child: SizedBox(),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 15,
                mainAxisCellCount: 1.5,
                child: Center(
                  child: Text(
                    "Ask your friends to enter this pin code",
                    style: textTheme.bodyMedium?.copyWith(color: frenchGray),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: room.onlyYou && !kDebugMode
              ? null
              : () => ref.read(createPlayFriendBoardProvider.future).then(
                    (value) {
                      ref.read(setGameRoomStartProvider);
                    },
                  ),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(darkPurple),
          ),
          child: const Text("Let's Play"),
        ),
        Gap((Theme.of(context).appBarTheme.toolbarHeight ?? 60) * 1.2),
      ],
    );
  }
}
