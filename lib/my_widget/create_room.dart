import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../logic/panel/bloc.dart';
import '../router/my_route.dart';
import '../values/colors.dart';
import 'create_room/board_level.dart';

class CreateRoom extends ConsumerWidget {
  const CreateRoom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
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
                  //debugPrint(context.router.current.name == "");
                  // if(context.router.currentChild == GameRoomRoute())
                  switch (context.router.current.name) {
                    case DashboardRoute.name:
                      {
                        final dashboardPanel =
                            ref.read(dashboardPanelControllerProvider);
                        ref.read(panelNotifierProvider.notifier).state =
                            const BoardLevel();
                        if (dashboardPanel.isPanelClosed) {
                          dashboardPanel.open();
                        }
                        break;
                      }
                  }
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
              child: Row(
                children: [
                  AutoSizeText(
                    "vs.",
                    //style: textTheme.bodyMedium?.copyWith(color: gray),
                    style: GoogleFonts.poppins(
                      textStyle: textTheme.bodySmall?.copyWith(
                        color: hookerGreen,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_drop_down_outlined, color: hookerGreen)
                ],
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
                  const Icon(Icons.arrow_drop_down_outlined, color: hookerGreen)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
