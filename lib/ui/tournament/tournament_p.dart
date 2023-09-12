import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mock_data/mock_data.dart';

import '../../logic/s_size.dart';
import '../../my_widgets/tournament_grid.dart';
import '../../theme/my_color.dart';

class TournamentP extends ConsumerWidget {
  const TournamentP({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    final bool isTab = sSize == ScreenSize.tab;
    return SafeArea(
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 20,
          children: [
            const StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 3,
              child: SizedBox(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: isTab ? 21 : 27,
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 18.r),
                color: mintCream2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5.r),
                ),
                // alignment: Alignment.center,
                child: Column(
                  children: [
                    const Flexible(
                      flex: 3,
                      child: ShowTimerIndicator(),
                    ),
                    Expanded(
                      flex: 16,
                      child: Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: const TournamentGrid(),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 0.75,
              child: SizedBox(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 9,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "    Choose a",
                        style: TextStyle(
                          fontSize: 18.r,
                          color: azure,
                          fontWeight: FontWeight.w100,
                          fontFamily: [
                            'Cabin',
                            'Poppins',
                            'Montserrat'
                          ][mockInteger(0, 2)],
                        ),
                      ),
                      TextSpan(
                        text: " block to tap,",
                        style: TextStyle(
                          fontSize: 18.r,
                          fontFamily: [
                            'Cabin',
                            'Poppins',
                            'Montserrat'
                          ][mockInteger(0, 2)],
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      TextSpan(
                        text: " remember it and then",
                        style: TextStyle(
                          fontSize: 14.r,
                          color: azure,
                          fontFamily: [
                            'Cabin',
                            'Poppins',
                            'Montserrat'
                          ][mockInteger(0, 2)],
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      TextSpan(
                        text: " click the next block ",
                        style: TextStyle(
                          fontSize: 24.r,
                          fontFamily: ['Cabin', 'Poppins'][mockInteger(0, 1)],
                          color: azure,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "to find its match",
                        style: TextStyle(
                          fontSize: 15.r,
                          height: 1.8,
                          color: azure,
                          fontWeight: FontWeight.w100,
                          fontFamily: [
                            'Cabin',
                            'Poppins',
                            'Montserrat'
                          ][mockInteger(0, 2)],
                        ),
                      )
                    ],
                    style: TextStyle(
                      fontSize: 30.r,
                      height: 1.8,
                      fontFamily: 'Montserrat',
                      color: azure,
                      //fontWeight: FontWeight.w900,
                    ),
                  ),
                  maxLines: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShowTimerIndicator extends ConsumerWidget {
  const ShowTimerIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    final isPhone = sSize == ScreenSize.phone;
    return LayoutBuilder(
      builder: (_, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                height: p1.maxHeight * 0.45,
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      // const TextSpan(text: " "),
                      WidgetSpan(child: SizedBox(width: 7.5.w)),
                      WidgetSpan(
                        child: Icon(Icons.timer, size: 24.r),
                      ),
                      WidgetSpan(child: SizedBox(width: 4.5.w)),
                      TextSpan(text: "${mockInteger(1, 10)}".padLeft(2, '0')),
                      const TextSpan(text: ":"),
                      TextSpan(text: "${mockInteger(1, 59)}".padLeft(2, '0')),
                    ],
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                      fontSize: isPhone ? 18.r : 18.r,
                      color: barnRed,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7.5.w),
            margin: EdgeInsets.symmetric(vertical: 7.5.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3.w),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey.shade300,
                value: mockInteger(1, 100) * 0.01,
                minHeight: 4.5.h,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class __PlayTournament extends ConsumerWidget {
  const __PlayTournament();

  @override
  Widget build(BuildContext context, WidgetRef ref) => LayoutBuilder(
        builder: (_, p1) {
          debugPrint(p1.biggest.aspectRatio.toString());
          final sSize = ref.read(sizeProvider);
          final isTab = sSize == ScreenSize.tab;
          return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(3.r),
            child: Column(
              children: [
                const Spacer(flex: 2),
                Flexible(
                  flex: 3,
                  child: Stack(
                    children: [
                      Positioned(
                        width: 360.w,
                        top: 0,
                        //top: -15.h,
                        bottom: 0,
                        child: ListTile(
                          minVerticalPadding: 0,
                          dense: true,
                          contentPadding: EdgeInsets.only(
                            left: 15.w,
                            top: isTab ? 3.h : 9.h,
                            right: 9.w,
                          ),
                          title: Text(
                            "Open Challenge",
                            style: TextStyle(
                              fontSize: isTab ? 18.r : 32.r,
                              fontFamily: 'BrunoAceSC',
                              fontWeight: FontWeight.w700,
                              color: eggShell,
                              height: 1.8,
                            ),
                            maxLines: 2,
                          ),
                          /* subtitle: Container(
                            margin: EdgeInsets.only(top: 3.h),
                            child: Text(
                              "Try to beat under 5 minutes",
                              style: TextStyle(
                                fontSize: 12.r,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                color: lavenderBush,
                              ),
                            ),
                          ),*/
                        ),
                      ),
                      /*  Positioned(
                        bottom: 21.h,
                        right: 15.w,
                        child: ElevatedButton(
                          onPressed: () {
                            context.router.push(const TournamentRoute());
                          },
                          child: Text(
                            "Play Now",
                            maxLines: 1,
                            style: TextStyle(fontSize: 15.r),
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
}
