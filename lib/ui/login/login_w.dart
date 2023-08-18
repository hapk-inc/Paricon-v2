import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';

import 'login_theme.dart';
import 'l_alreadyExisting.dart';
import 'l_button.dart';
import 'l_dots.dart';
import 'l_title.dart';

class LoginW extends StatelessWidget {
  const LoginW({super.key, required this.theme});

  final LoginTheme theme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15.w, right: 7.5.w),
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        children: [
          StaggeredGridTile.count(
              crossAxisCellCount: 11, mainAxisCellCount: 1, child: Container()),
          StaggeredGridTile.count(
            crossAxisCellCount: 11,
            mainAxisCellCount: 4,
            child: Container(
              //padding: EdgeInsets.all(3.sp),
              alignment: Alignment.centerLeft,
              child: LoginTitle(
                theme: theme,
                tFontSize: 12,
                subFontSize: 4.5,
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 9,
            mainAxisCellCount: 8,
            child: Container(
              // color: Colors.green,
              child: Lottie.asset(
                'assets/jigsaw_green.json',
                repeat: false,
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 11,
            mainAxisCellCount: 2,
            child: Container(
              //  color: Colors.blue,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: LButton(
                          txtSize: 900.h / 360.w > 0.7 ? 5.4 : 4.5,
                          hMargin: 3)),
                  /*   ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 3.w),
                      child: Text(
                        "Let's Get started",
                        style: TextStyle(fontSize: 7.5.sp),
                      ),
                    ),
                  ),*/
                  //LDots(theme: theme, bigR: 4.8, smallR: 3.6, space: 3)
                  LAlreadyExisting(theme: theme, txtSize: 4.5)
                ],
              ),
            ),
          ),
          /* StaggeredGridTile.count(
            crossAxisCellCount: 11,
            mainAxisCellCount: 1,
            child: Container(
              //color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              alignment: Alignment.centerLeft,
              child: LAlreadyExisting(theme: theme, txtSize: 4.5),
            ),
          ),*/
        ],
      ),
    );
  }
}

class LoginW3 extends StatelessWidget {
  const LoginW3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 9.h),
          decoration: const BoxDecoration(
              /*    gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffFBF9FF),
                Color(0xffFBF8FF),
                Color(0xffE2DAF2),
              ],
            ),*/
              ),
          child: Row(
            children: [
              Container(
                width: 180.w,
                padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                //color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12.h),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Engage and Unlock "
                                "your Mind's Potential\n",
                            style: TextStyle(
                              fontSize: 12.w,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w900,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text:
                                "Challenge yourself in the Puzzle Universe and "
                                "seize victory in competitive tournaments.",
                            style: TextStyle(
                              fontFamily: 'Cabin',
                              fontWeight: FontWeight.w100,
                              fontSize: 7.5.w,
                              height: 1.8,
                            ),
                          )
                        ], style: const TextStyle(color: Colors.red)),
                      ),
                    ),
                    Container(
                      //height: 90.h,
                      margin: EdgeInsets.symmetric(vertical: 12.h),

                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.1.sp),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 6.h,
                            horizontal: 3.w,
                          ),
                          child: Text(
                            "Get started",
                            style: TextStyle(fontSize: 15.h),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Lottie.asset(
                  'assets/jigsaw_green.json',
                  repeat: false,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
