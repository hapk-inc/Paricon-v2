import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mock_data/mock_data.dart';

import '../../theme/my_color.dart';
import '../logic/s_size.dart';
import '../my_widget/build_app_bar.dart';
import '../my_widget/tournament_grid.dart';

@RoutePage()
class TournamentPage extends ConsumerWidget {
  const TournamentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    return Scaffold(
      appBar: buildAppBar(sSize, context),
      body: SafeArea(
        child: ColoredBox(
          color: majorelleBlue,
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
                  mainAxisCellCount: 27,
                  child: Card(
                    color: ghostWhite,
                    margin: EdgeInsets.symmetric(horizontal: 18.r),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5.r),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ghostWhite,
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                      child: Column(
                        children: [
                          const Flexible(
                            flex: 3,
                            child: ShowTimerIndicator(),
                          ),
                          Expanded(
                            flex: 16,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10.5.r),
                              child: const TournamentGrid(),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 20,
                  mainAxisCellCount: 9,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.r, vertical: 15.r),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: azure,
                        height: 1.5,
                        fontSize: 24.r,
                        fontWeight: FontWeight.w500,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          FadeAnimatedText('Press any block to start the game'),
                          //FadeAnimatedText('do it RIGHT!!'),
                          //FadeAnimatedText('do it RIGHT NOW!!!'),
                        ],
                        //repeatForever: true,
                        totalRepeatCount: 2,
                        stopPauseOnTap: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 0.6,
            child: Container(
              //  height: p1.maxHeight * 0.45,
              padding: EdgeInsets.symmetric(horizontal: 15.r),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(child: Icon(Icons.timer, size: 24.r)),
                        WidgetSpan(child: SizedBox(width: 4.5.r)),
                        TextSpan(text: "${mockInteger(1, 10)}".padLeft(2, '0')),
                        const TextSpan(text: " : "),
                        TextSpan(text: "${mockInteger(1, 59)}".padLeft(2, '0')),
                      ],
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                        fontSize: 18.r,
                        color: barnRed,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.router.pop();
                    },
                    child: Icon(
                      Icons.close,
                      size: 21.r,
                      color: barnRed,
                    ),
                  )
                ],
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
    );
  }
}
