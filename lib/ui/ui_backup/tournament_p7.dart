import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mock_data/mock_data.dart';

import '../../my_widgets/tournament_grid.dart';

class TournamentP extends StatelessWidget {
  const TournamentP({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        mainAxisSpacing: 9.h,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 5.4,
            child: Container(
              alignment: Alignment.center,
              child: const ShowIconDone(),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 27,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              color: const Color(0xffF2F7F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5.w)),
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
          StaggeredGridTile.count(
            crossAxisCellCount: 9,
            mainAxisCellCount: 3.6,
            child: Container(
              margin: EdgeInsets.only(left: 15.w, top: 12.h, bottom: 12.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.5.w),
                child: ElevatedButton(
                  onPressed: () {},
                  child: SizedBox(
                    child: Text(
                      "End Timer",
                      style: TextStyle(fontSize: 13.5.w),
                    ),
                  ),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 4.5,
            child: Container(
              // color: Colors.amber.shade50,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                dense: true,
                title: SizedBox(
                  height: 24.h,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your previous rank",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TournamentT extends StatelessWidget {
  const TournamentT({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        mainAxisSpacing: 9.h,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 4.5,
            child: Container(
              alignment: Alignment.center,
              child: const ShowIconDone(),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 25.2,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              color: const Color(0xffF2F7F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5.w)),
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
          StaggeredGridTile.count(
            crossAxisCellCount: 8,
            mainAxisCellCount: 3.3,
            child: Container(
              margin: EdgeInsets.only(left: 15.w, top: 12.h, bottom: 12.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.5.w),
                child: ElevatedButton(
                  onPressed: () {},
                  child: SizedBox(
                    child: Text(
                      "End Timer",
                      style: TextStyle(fontSize: 13.5.w),
                    ),
                  ),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 4.5,
            child: Container(
              // color: Colors.amber.shade50,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                dense: true,
                title: SizedBox(
                  height: 24.h,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your previous rank",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ShowTimerIndicator2 extends StatelessWidget {
  const ShowTimerIndicator2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.centerLeft,
      child: LayoutBuilder(
        builder: (_, p1) => Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                color: Colors.amber,
                child: Icon(
                  Icons.timer,
                  size: 24.sp,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}

class ShowTimerIndicator extends StatelessWidget {
  const ShowTimerIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                //color: Colors.pink,
                // width: p1.maxWidth * 0.3,
                height: p1.maxHeight * 0.45,
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(text: " "),
                      WidgetSpan(
                        child: Icon(Icons.timer, size: 21.sp),
                      ),
                      const TextSpan(text: " "),
                      TextSpan(text: "${mockInteger(1, 10)}".padLeft(2, '0')),
                      const TextSpan(text: ":"),
                      TextSpan(text: "${mockInteger(1, 59)}".padLeft(2, '0')),
                    ],
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                      fontSize: 18.w,
                      color: Colors.red,
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

class ShowTimerIndicator3 extends StatelessWidget {
  const ShowTimerIndicator3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      alignment: Alignment.centerLeft,
      child: LayoutBuilder(
        builder: (_, p1) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // color: Colors.pink,
              width: p1.maxWidth * 0.3,
              margin: EdgeInsets.only(right: 6.w),
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: " "),
                    WidgetSpan(
                      child: Icon(Icons.timer, size: 21.sp),
                    ),
                    const TextSpan(text: " "),
                    TextSpan(text: "${mockInteger(1, 10)}".padLeft(2, '0')),
                    const TextSpan(text: ":"),
                    TextSpan(text: "${mockInteger(1, 59)}".padLeft(2, '0')),
                  ],
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                      fontSize: 18.w,
                      color: Colors.red),
                ),
              ),
            ),
            //SizedBox(width: 15.w),
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                minLeadingWidth: 0.w,
                /* leading: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(text: " "),
                      WidgetSpan(
                        child: Icon(Icons.timer, size: 21.sp),
                      ),
                      TextSpan(text: " ${mockInteger(1, 10)}".padLeft(2, '0')),
                      TextSpan(text: ": "),
                      TextSpan(text: "${mockInteger(1, 59)}".padLeft(2, '0')),
                    ],
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),*/
                titleTextStyle: const TextStyle(color: Colors.red),
                subtitleTextStyle: const TextStyle(color: Colors.red),
                title: Container(
                  height: 27.h,
                  margin: EdgeInsets.only(bottom: 3.h),

                  //color: Colors.red,
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    child: AutoSizeText(
                      "Try to complete below ${mockInteger(1, 5)}:${mockInteger(11, 59)}",
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        color: Colors.red,
                        fontSize: 72,
                        //decorationThickness: 40,
                      ),
                    ),
                  ),
                ),
                subtitle: Container(
                  height: 12.h,
                  //color: Colors.amber,
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3.w),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey.shade300,
                      value: mockInteger(1, 100) * 0.01,
                      minHeight: 4.5.h,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShowIconDone extends StatelessWidget {
  const ShowIconDone({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, p1) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Text("${mockInteger(1, 36).toString().padLeft(2, '0')} / 36",
                style: TextStyle(
                  fontSize: p1.maxWidth * 0.066,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  shadows: const <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                )),
          ),
          Flexible(
            flex: 2,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 0,
              title: Container(
                height: p1.maxHeight * 0.36,
                margin: EdgeInsets.symmetric(vertical: 4.5.h),
                //color: Colors.red,
                alignment: Alignment.centerLeft,
                child: const FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    "Open Challenge",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                      color: Colors.white60,
                      fontSize: 72,
                      //decorationThickness: 40,
                    ),
                  ),
                ),
              ),
              subtitle: Container(
                height: p1.maxHeight * 0.15,
                //color: Colors.amber,
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  child: Text(
                    "${mockInteger(1, 50)} users have played this challenge",
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Cabin',
                      fontSize: 72,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
