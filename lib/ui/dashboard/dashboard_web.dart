import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:group_button/group_button.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

class DashboardW extends StatelessWidget {
  const DashboardW({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 120.w,
          color: Colors.red,
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (_, p1) {
              double a = p1.biggest.aspectRatio;
              print(p1.biggest.aspectRatio);
              if (a < 0.66) {
                return const _DashboardWPhone();
              } else if (a < 0.78) {
                return const _DashboardWPhone();
              } else if (a < 1.2) {
                return const _DashboardWPhone();
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }
}

class _DashboardWPhone extends StatelessWidget {
  const _DashboardWPhone();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(6.sp),
      child: LayoutBuilder(
        builder: (_, p1) => StaggeredGrid.count(
          crossAxisCount: 20,
          mainAxisSpacing: 9.h,
          crossAxisSpacing: 3.w,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 5,
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
                                fontSize: 18.sp,
                                color: const Color(0xff942911),
                              ),
                            ),
                            TextSpan(
                              text: " ${mockInteger(10, 50)}%",
                              style: TextStyle(
                                fontSize: 9.sp,
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
                  SizedBox(height: 3.h),
                  Flexible(
                    child: FittedBox(
                      child: Text(
                        "Overall Players",
                        style: TextStyle(
                          fontSize: 6.sp,
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
              crossAxisCellCount: 15,
              mainAxisCellCount: 4,
              child: Align(
                alignment: Alignment.centerLeft,
                child: GroupButton(
                  buttons: const [
                    "EveryOne",
                    "My Friends",
                    //"My Friends",
                  ],
                  options: GroupButtonOptions(
                    buttonHeight: 30.h,
                    buttonWidth: p1.maxWidth * 0.24,
                    spacing: 9.w,
                    runSpacing: 9.h,
                    elevation: 3,
                    unselectedColor: const Color(0xffedf2f4),
                    selectedColor: const Color(0xffa72608),
                    crossGroupAlignment: CrossGroupAlignment.start,
                    selectedTextStyle: TextStyle(
                      fontSize: 6.sp,
                      color: const Color(0xffedf2f4),
                    ),
                    unselectedTextStyle: TextStyle(
                      fontSize: 6.sp,
                      color: const Color(0xff090c02),
                    ),
                    borderRadius: BorderRadius.circular(p1.maxWidth * 0.009),
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
                crossAxisCellCount: 8,
                mainAxisCellCount: 8,
                child: Container()),
            StaggeredGridTile.count(
              crossAxisCellCount: 12,
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
                      2,
                      (index) => Container(
                        width: 51.w,
                        decoration: BoxDecoration(
                          color: [
                            const Color(0xffa72608),
                            const Color(0xff2d2d2a)
                          ][mockInteger(0, 1)],
                          borderRadius: BorderRadius.circular(3.sp),
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 18.h,
                          horizontal: 3.w,
                        ),
                        child: LayoutBuilder(
                          builder: (_, p1) => Stack(
                            children: [
                              Positioned(
                                width: p1.maxWidth * 0.9,
                                height: p1.maxHeight,
                                bottom: -p1.maxHeight * 0.255,
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
                color: Colors.red,
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 12,
              child: Container(
                color: Colors.red,
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
        padding: EdgeInsets.only(left: 6.w, top: 3.h, bottom: 3.h),
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
                    fontSize: 12.sp,
                    height: 1.2,
                  ),
                ),
                TextSpan(
                  text: "Make friends",
                  style: TextStyle(
                    color: const Color(0xffD80032),
                    fontSize: 6.sp,
                    height: 1.8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: "\nby collecting\nunique avatars",
                  style: TextStyle(
                    fontSize: 5.1.sp,
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
