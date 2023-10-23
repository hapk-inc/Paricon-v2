import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mock_data/mock_data.dart';

import '../../theme/my_color.dart';
import '../logic/s_size.dart';
import '../my_widget/tournament_grid.dart';

@RoutePage()
class TournamentPage extends ConsumerWidget {
  const TournamentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    return Scaffold(
      // appBar: buildAppBar(sSize, context),
      body: sSize != ScreenSize.phone
          ? Container()
          : SafeArea(
              top: false,
              bottom: false,
              child: ColoredBox(
                color: majorelleBlue,
                child: SingleChildScrollView(
                  child: StaggeredGrid.count(
                    crossAxisCount: 20,
                    children: [
                      const StaggeredGridTile.count(
                        crossAxisCellCount: 20,
                        mainAxisCellCount: 4.5,
                        child: SizedBox(),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 20,
                        mainAxisCellCount: 30,
                        child: Card(
                          color: ghostWhite,
                          margin: EdgeInsets.symmetric(horizontal: 15.r),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.5.r),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(4.5.r),
                            child: Column(
                              children: [
                                const Flexible(
                                  flex: 2,
                                  child: ShowTimerIndicator(),
                                ),
                                Expanded(
                                  flex: 11,
                                  child: FractionallySizedBox(
                                    heightFactor: 1,
                                    widthFactor: 1,
                                    child: AnimatedContainer(
                                      //color: coyote,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 9.r),
                                      child: const TournamentGrid(),
                                    ),
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
                        mainAxisCellCount: 15,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.r,
                            vertical: 15.r,
                          ),
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
                                FadeAnimatedText(
                                  'Press any block ' 'to start the game',
                                ),
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
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 7.5.r),
      title: SizedBox(
        height: 60.h,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(Icons.timer, size: 24.r, color: gunMetal),
                SizedBox.square(dimension: 7.5.r),
                AnimatedFlipCounter(
                  value: mockInteger(0, 10),
                  suffix: " : ",
                  wholeDigits: 2,
                  textStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    fontSize: 18.r,
                    color: barnRed,
                    letterSpacing: 0.12.r,
                  ),
                ),
                SizedBox.square(dimension: 1.5.r),
                AnimatedFlipCounter(
                  value: mockInteger(0, 59),
                  wholeDigits: 2,
                  textStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    fontSize: 18.r,
                    color: barnRed,
                    letterSpacing: 0.12.r,
                  ),
                ),
              ],
            ),
          ),
          trailing: InkWell(
            onTap: () => context.router.pop(),
            child: Icon(Icons.close, size: 21.r),
          ),
        ),
      ),
      subtitle: ClipRRect(
        borderRadius: BorderRadius.circular(3.r),
        child: LinearProgressIndicator(
          backgroundColor: Colors.grey.shade300,
          color: majorelleBlue,
          value: .9,
          minHeight: 6.r,
        ),
      ),
    );
  }
}

/*class ShowTimerIndicator1 extends ConsumerWidget {
  const ShowTimerIndicator1({super.key});

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
            heightFactor: 1,
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
                        WidgetSpan(child: Icon(Icons.timer, size: 24.r))
                        */
/*WidgetSpan(child: Icon(Icons.timer, size: 24.r)),
                        WidgetSpan(child: SizedBox(width: 4.5.r)),
                        WidgetSpan(
                          child: AnimatedDigitWidget(
                            value: 02,
                            prefix: "0",
                            suffix: " : ",
                            textStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w900,
                              fontSize: 18.r,
                              color: barnRed,
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: AnimatedDigitWidget(
                            value: mockInteger(0, 59),
                            prefix: mockInteger(0, 1) == 0 ? "0" : "",
                            //separateLength: 2,
                            // fractionDigits: 2,
                            textStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w900,
                              fontSize: 18.r,
                              color: barnRed,
                            ),
                          ),
                        ),*/
/*
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
                    child: Icon(Icons.close, size: 21.r, color: barnRed),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 7.5.w),
          margin: EdgeInsets.symmetric(vertical: 4.5.h),
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
}*/
