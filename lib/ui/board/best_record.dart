import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';

import '../../model/user_record.dart';
import '../../my_widget/my_duration.dart';
import '../../my_widget/small_duration.dart';
import '../../values/colors.dart';

class BestRecordWidget extends ConsumerWidget {
  final UserRecord bestRecord;
  const BestRecordWidget(this.bestRecord, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.5.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: AspectRatio(
                  aspectRatio: 2.1,
                  child: Center(
                    child: ListTile(
                      title: MyDuration(
                        bestRecord.recordTimeTaken,
                        size: 33,
                        textColor: ghostWhite,
                      ),
                      /* subtitle: SizedBox(
                        height: 36.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.trending_up,
                              size: 21.r,
                              color: ghostWhite,
                            ),
                            Gap(3.r),
                            SmallDuration(
                              bestRecord.recordTimeTaken,
                              color: ghostWhite,
                              size: 15,
                            )
                          ],
                        ),
                      ),*/
                    ),
                  )),
            ),
            Flexible(
              child: AspectRatio(
                aspectRatio: 3.6,
                child: ListTile(
                  title: Container(
                    height: 24.h,
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Rank",
                      style: textTheme.bodyMedium?.copyWith(
                        color: ghostWhite,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 13.5.r,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  subtitle: Text(
                    "${mockInteger(1, 10)}",
                    style: TextStyle(
                      fontFamily: 'RussoOne',
                      fontSize: 30.r,
                      color: ghostWhite,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyDuration(
              bestRecord.recordTimeTaken,
              size: 33,
              textColor: ghostWhite,
            ),
            //  Gap(15.r),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*  Text(
                                    "Record Difference",
                                    style: GoogleFonts.montserrat(
                                      textStyle: textTheme.bodySmall?.copyWith(
                                        color: ghostWhite,
                                      ),
                                    ),
                                  ),*/
                    Gap(4.5.r),
                    Row(
                      children: [
                        Icon(
                          Icons.trending_up,
                          size: 18.r,
                          color: mintGreen,
                        ),
                        Gap(7.5.r),
                        AnimatedFlipCounter(
                          value: mockInteger(1, 10),
                          wholeDigits: 2,
                          suffix: ": ",
                          /* textStyle: GoogleFonts.montserrat(
                            textStyle: textTheme.bodySmall?.copyWith(
                              color: mintGreen,
                              // fontSize: 12.r,
                            ),
                          ),*/
                        ),
                        AnimatedFlipCounter(
                          value: mockInteger(10, 50),
                          wholeDigits: 2,
                          suffix: " ",
                          /*textStyle: GoogleFonts.montserrat(
                            textStyle: textTheme.bodySmall?.copyWith(
                              color: mintGreen,
                            ),
                          )*/ /*TextStyle(
                                          color: ghostWhite,
                                          fontFamily: 'RussoOne',
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15.r,
                                        )*/
                        ),
                        AnimatedFlipCounter(
                          value: mockInteger(100, 500),
                          wholeDigits: 3,
                          suffix: " ",
                          /* textStyle: GoogleFonts.montserrat(
                            textStyle: textTheme.bodySmall
                                ?.copyWith(color: mintGreen, fontSize: 7.5.r),
                          )*/ /*TextStyle(
                                          color: ghostWhite,
                                          fontFamily: 'RussoOne',
                                          // fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w200,
                                          fontSize: 9.r,
                                        )*/
                        )
                      ],
                    ),
                    /*MyDuration(
                                    myBest.recordTimeTaken,
                                    size: 18,
                                    textColor: ghostWhite,
                                  ),*/
                  ],
                )
              ],
            )
          ],
        ),*/
