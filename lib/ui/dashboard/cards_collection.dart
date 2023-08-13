import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

class CardsCollection extends StatelessWidget {
  const CardsCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.sp)),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffEDF2F4),
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: LayoutBuilder(
          builder: (_, p) => ListView(
            //padding: EdgeInsets.all(6.w),
            scrollDirection: Axis.horizontal,
            children: [
              const _TopPlayersTile(),
              ...List.generate(
                4,
                (index) => Container(
                  width: p.maxWidth * 0.24,
                  decoration: BoxDecoration(
                    color: [
                      const Color(0xffa72608),
                      const Color(0xff2d2d2a)
                    ][mockInteger(0, 1)],
                    borderRadius: BorderRadius.circular(4.5.w),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 18.h, horizontal: 3.w),
                  child: LayoutBuilder(
                    builder: (_, p1) => Stack(
                      children: [
                        Positioned(
                          width: p1.maxWidth * 0.96,
                          height: p1.maxHeight,
                          left: p1.maxWidth * 0.03,
                          bottom: -p1.maxHeight * 0.21,
                          child: RandomAvatar(mockString(), trBackground: true),
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
    );
  }
}

class _TopPlayersTile extends StatelessWidget {
  const _TopPlayersTile();

  @override
  Widget build(BuildContext context) => Container(
        //width: 180.w,
        //color: Colors.red,
        margin: EdgeInsets.only(right: 15.w),
        padding: EdgeInsets.only(left: 9.w, top: 3.h, bottom: 3.h),
        alignment: Alignment.centerLeft,
        child: LayoutBuilder(
          builder: (_, p1) => RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "My\nCards\n",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    fontSize: 21.w,
                    height: 1.2,
                  ),
                ),
                TextSpan(
                  text: "Make friends",
                  style: TextStyle(
                    color: const Color(0xffD80032),
                    fontSize: 10.8.w,
                    height: 2.1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: " by\ncollecting unique avatars",
                  style: TextStyle(
                    fontSize: 9.w,
                    height: 1.65,
                    fontWeight: FontWeight.w500,
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

class CardsCollectionWeb extends StatelessWidget {
  const CardsCollectionWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.sp),
      margin: EdgeInsets.all(3.sp),
      decoration: BoxDecoration(
        color: const Color(0xffEDF2F4),
        borderRadius: BorderRadius.circular(3.w),
      ),
      child: LayoutBuilder(
        builder: (_, p) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "My Cards\n",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                      fontSize: 12.w,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: "Make friends",
                    style: TextStyle(
                      color: const Color(0xffD80032),
                      fontSize: 8.1.w,
                      //height: 2.1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: " by collecting unique avatars",
                    style: TextStyle(
                      fontSize: 7.5.w,
                      height: 1.65,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                style: const TextStyle(
                  color: Color(0xff2B2D42),
                  fontFamily: 'Cabin',
                ),
              ),
            ),
            Expanded(
              child: ListView(
                //padding: EdgeInsets.all(6.w),
                scrollDirection: Axis.horizontal,
                children: [
                  // const _TopPlayersTile(),
                  ...List.generate(
                    4,
                    (index) => Container(
                      width: p.maxWidth * 0.36,
                      decoration: BoxDecoration(
                        color: [
                          const Color(0xffa72608),
                          const Color(0xff2d2d2a)
                        ][mockInteger(0, 1)],
                        borderRadius: BorderRadius.circular(4.5.w),
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 18.h, horizontal: 3.w),
                      child: LayoutBuilder(
                        builder: (_, p1) => Stack(
                          children: [
                            Positioned(
                              width: p1.maxWidth * 0.96,
                              height: p1.maxHeight,
                              left: p1.maxWidth * 0.03,
                              bottom: -p1.maxHeight * 0.21,
                              child: RandomAvatar(mockString(),
                                  trBackground: true),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
