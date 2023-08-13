import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:group_button/group_button.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../my_widgets/my_names.dart';

class DashboardP extends ConsumerStatefulWidget {
  const DashboardP({super.key});

  @override
  ConsumerState createState() => _DashboardPState();
}

class _DashboardPState extends ConsumerState<DashboardP> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(6.sp),
      child: LayoutBuilder(
        builder: (_, p1) => StaggeredGrid.count(
          crossAxisCount: 20,
          mainAxisSpacing: 6.w,
          crossAxisSpacing: 6.h,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 6,
              mainAxisCellCount: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: FittedBox(
                      child: AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "${mockInteger(10, 100)}",
                              style: TextStyle(
                                fontSize: 36.sp,
                                color: const Color(0xff942911),
                              ),
                            ),
                            TextSpan(
                              text: " ${mockInteger(10, 50)}%",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: const Color(0xff9D8420),
                              ),
                            ),
                          ],
                        ),
                        style: const TextStyle(
                          fontFamily: 'LilitaOne',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Flexible(
                    child: FittedBox(
                      child: Text(
                        "Overall Players",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xff1A1B25),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 14,
              mainAxisCellCount: 4,
              child: GroupButton(
                buttons: const [
                  "EveryOne",
                  "My Friends",
                  //"My Friends",
                ],
                options: GroupButtonOptions(
                  buttonHeight: 30.h,
                  buttonWidth: p1.maxWidth * 0.27,
                  spacing: 9.w,
                  runSpacing: 9.h,
                  elevation: 3,
                  unselectedColor: const Color(0xffedf2f4),
                  selectedColor: const Color(0xffa72608),
                  crossGroupAlignment: CrossGroupAlignment.start,
                  selectedTextStyle: TextStyle(
                    fontSize: 11.1.sp,
                    color: const Color(0xffedf2f4),
                  ),
                  unselectedTextStyle: TextStyle(
                    fontSize: 11.1.sp,
                    color: const Color(0xff090c02),
                  ),
                  borderRadius: BorderRadius.circular(p1.maxWidth * 0.009),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffEDF2F4),
                  borderRadius: BorderRadius.circular(3.w),
                ),
                child: ListView(
                  //padding: EdgeInsets.all(6.w),
                  scrollDirection: Axis.horizontal,
                  children: [
                    const _TopPlayersTile(),
                    ...List.generate(
                      4,
                      (index) => Container(
                        width: 78.w,
                        decoration: BoxDecoration(
                          color: [
                            const Color(0xffa72608),
                            const Color(0xff2d2d2a)
                          ][mockInteger(0, 1)],
                          borderRadius: BorderRadius.circular(6.sp),
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 18.h,
                          horizontal: 3.w,
                        ),
                        child: LayoutBuilder(
                          builder: (_, p1) => Stack(
                            children: [
                              Positioned(
                                width: p1.maxWidth * 0.96,
                                height: p1.maxHeight,
                                left: p1.maxWidth * 0.03,
                                bottom: -p1.maxHeight * 0.21,
                                child: RandomAvatar(
                                  mockString(),
                                  trBackground: true,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 3.h,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Text(
                  "Daily Leaderboard",
                  style: TextStyle(
                    fontSize: 13.5.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 19.8.h,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffceeddb),
                  borderRadius: BorderRadius.circular(4.5.w),
                ),
                child: LayoutBuilder(
                  builder: (_, p1) => DataTable(
                    columnSpacing: 0,
                    horizontalMargin: p1.maxWidth * 0.025,
                    checkboxHorizontalMargin: 0,
                    headingRowHeight: p1.maxHeight * 0.125,
                    dataRowMaxHeight: p1.maxHeight * 0.18,
                    dataRowMinHeight: p1.maxHeight * 0.1,
                    headingTextStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color: const Color(0xff85baa1),
                      fontWeight: FontWeight.w700,
                      fontSize: p1.maxWidth * 0.04,
                    ),
                    dataTextStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: p1.maxWidth * 0.035,
                      color: const Color(0xff2a0c4e),
                    ),
                    columns: [
                      DataColumn(
                        label: Container(
                          //color: Colors.red,
                          width: p1.maxWidth * 0.275,
                          alignment: Alignment.center,
                          child:
                              const Text('NAME', textAlign: TextAlign.center),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          alignment: Alignment.center,
                          //color: Colors.blue,
                          width: p1.maxWidth * 0.125,
                          child: const Text(
                            'RANK',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          alignment: Alignment.center,
                          width: p1.maxWidth * 0.25,
                          child: const FittedBox(
                            child: AutoSizeText(
                              'SUBMITTED ON',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          width: p1.maxWidth * 0.2,
                          alignment: Alignment.center,
                          //color: Colors.indigo,
                          child: const AutoSizeText(
                            'TIME',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      ...List.generate(
                        5,
                        (index) => DataRow(
                          cells: [
                            DataCell(
                              SizedBox(
                                width: p1.maxWidth * 0.275,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: p1.maxWidth * 0.03,
                                      child: RandomAvatar(mockString()),
                                    ),
                                    SizedBox(width: 6.w),
                                    Expanded(
                                      child: Text(
                                        myRandomName(),
                                        maxLines: 1,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                alignment: Alignment.center,
                                width: p1.maxWidth * 0.125,
                                child: Text(
                                  "#${mockInteger(1, 10)}",
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff9e2b25),
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                width: p1.maxWidth * 0.25,
                                alignment: Alignment.center,
                                child: Text(
                                  "August ${mockInteger(1, 30)}, 12:30 PM",
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: p1.maxWidth * 0.03,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                width: p1.maxWidth * 0.2,
                                padding: EdgeInsets.all(4.5.w),
                                // alignment: Alignment.centerRight,
                                child: FittedBox(
                                  child: AutoSizeText.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "0${mockInteger(1, 5)}:"
                                                "${mockInteger(10, 59)}",
                                            style: TextStyle(fontSize: 7.5.sp)),
                                        TextSpan(
                                          text: ":${mockInteger(100, 599)}",
                                          style: TextStyle(
                                            fontSize: 4.5.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    style: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff280c4e),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 3,
              child: Container(
                color: Colors.red,
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 6,
              child: Container(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopPlayersTile extends StatelessWidget {
  const _TopPlayersTile();

  @override
  Widget build(BuildContext context) => Container(
        //width: 180.w,
        //color: Colors.red,
        margin: EdgeInsets.only(right: 9.w),
        padding: EdgeInsets.only(left: 9.w, top: 3.h, bottom: 3.h),
        alignment: Alignment.centerLeft,
        child: LayoutBuilder(
          builder: (_, p1) => AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "My\nCards\n",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    fontSize: 24.sp,
                    height: 1.2,
                  ),
                ),
                TextSpan(
                  text: "Make friends",
                  style: TextStyle(
                    color: const Color(0xffD80032),
                    fontSize: 12.sp,
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: " by\ncollecting unique avatars",
                  style: TextStyle(
                    fontSize: 10.5.sp,
                    height: 1.8,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
              style: const TextStyle(
                color: Color(0xff2B2D42),
                fontFamily: 'Cabin',
              ),
            ),
          ),
        ),
      );
}

class _PlayWithFriendTile extends StatelessWidget {
  const _PlayWithFriendTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 150.h,
      //margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: const Color(0xffa3d9ff),
        borderRadius: BorderRadius.circular(6.w),
      ),
      padding: EdgeInsets.all(6.w),
      child: LayoutBuilder(
        builder: (_, p1) => Row(
          children: [
            Flexible(
              child: Lottie.asset('assets/friends_joystick.json'),
            ),
            SizedBox(width: 15.w),
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 0.9,
                child: FittedBox(
                  child: AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Play with\n",
                          style: TextStyle(
                            fontSize: p1.maxWidth * 0.025,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff17255A),
                          ),
                        ),
                        TextSpan(
                          text: "Friends",
                          style: TextStyle(
                            fontSize: p1.maxWidth * 0.05,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Montserrat',
                            color: const Color(0xff18206F),
                          ),
                        ),
                      ],
                    ),
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
