import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/values/colors.dart';

import '../../my_widget/create_room.dart';
import '../../router/my_route.dart';

class RoomBody extends ConsumerWidget {
  const RoomBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return StaggeredGrid.count(
      crossAxisCount: 15,
      children: [
        const StaggeredGridTile.count(
          crossAxisCellCount: 15,
          mainAxisCellCount: 1.2,
          child: SizedBox(),
        ),
        const CreateRoom(),
        const StaggeredGridTile.count(
          crossAxisCellCount: 15,
          mainAxisCellCount: 1.2,
          child: SizedBox(),
        ),
        StaggeredGridTile.fit(
          crossAxisCellCount: 15,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text("Participants", style: textTheme.bodyMedium),
          ),
        ),
        const StaggeredGridTile.count(
          crossAxisCellCount: 15,
          mainAxisCellCount: 0.3,
          child: SizedBox(),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 15,
          mainAxisCellCount: 3.6,
          child: Center(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 30.w),
              itemBuilder: (_, index) => CircleAvatar(radius: 36.r),
              separatorBuilder: (_, __) => Gap(15.r),
              itemCount: 3,
            ),
          ),
        ),
        const StaggeredGridTile.count(
          crossAxisCellCount: 15,
          mainAxisCellCount: 0.3,
          child: SizedBox(),
        ),
        StaggeredGridTile.fit(
          crossAxisCellCount: 15,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text("Room Code", style: textTheme.bodyMedium),
          ),
        ),
        const StaggeredGridTile.count(
          crossAxisCellCount: 15,
          mainAxisCellCount: 0.75,
          child: SizedBox(),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 15,
          mainAxisCellCount: 2.4,
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              decoration: BoxDecoration(
                color: magnolia,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              alignment: Alignment.center,
              child: Text(
                "${mockInteger(111111, 999999)}",
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
        const StaggeredGridTile.count(
          crossAxisCellCount: 15,
          mainAxisCellCount: 0.75,
          child: SizedBox(),
        ),
        const StaggeredGridTile.fit(
          crossAxisCellCount: 15,
          child: Center(
            child: Text(
              "Share the above code to invite",
              style: TextStyle(color: frenchGray),
            ),
          ),
        ),
        const StaggeredGridTile.count(
          crossAxisCellCount: 15,
          mainAxisCellCount: 3,
          child: SizedBox(),
        ),
        StaggeredGridTile.fit(
          crossAxisCellCount: 15,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(hookerGreen),
              ),
              onPressed: () => context.router.replace(const PlayFriendRoute()),
              child: const Text("Create Room"),
            ),
          ),
        ),
      ],
    );
  }
}
