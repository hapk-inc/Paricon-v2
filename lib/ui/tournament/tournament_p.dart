import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/my_widgets/tournament_grid_revised.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../my_widgets/my_logo.dart';
import '../../my_widgets/my_names.dart';

class TournamentP extends StatelessWidget {
  const TournamentP({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      //physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 180.h,
          collapsedHeight: 90.h,
          toolbarHeight: 81.h,
          leadingWidth: 30.w,
          leading: IconButton(
            onPressed: () => context.router.pop(),
            icon: Icon(
              Icons.chevron_left,
              size: 30.sp,
            ),
          ),
          elevation: 8,
          centerTitle: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.w),
              bottomRight: Radius.circular(15.w),
            ),
          ),
          title: SizedBox(
            width: 150.w,
            //color: Colors.green,
            child: const FittedBox(
              alignment: Alignment.centerLeft,
              child: Text(
                "Daily Tournament",
                maxLines: 1,
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
            ),
          ),
          flexibleSpace: const FlexibleSpaceBar(
            title: _ToHeader(),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 15.h),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            height: 450.sp,
            child: const TournamentGridRevised(),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 135.h,
            width: 360.w,
            color: const Color(0xffceeddb),
            child: LayoutBuilder(
              builder: (_, p1) => DataTable(
                columnSpacing: 0,
                horizontalMargin: p1.maxWidth * 0.025,
                checkboxHorizontalMargin: 0,
                headingRowHeight: 36.h,
                dataRowMaxHeight: 45.h,
                dataRowMinHeight: 21.h,
                headingTextStyle: TextStyle(
                  fontFamily: 'Poppins',
                  color: const Color(0xff85baa1),
                  fontSize: p1.maxWidth * 0.04,
                ),
                dataTextStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: p1.maxWidth * 0.035,
                  color: const Color(0xff2a0c4e),
                ),
                columns: [
                  DataColumn(
                    label: SizedBox(
                      //color: Colors.red,
                      width: p1.maxWidth * 0.275,
                      child: const Text('NAME', textAlign: TextAlign.center),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      //color: Colors.blue,
                      width: p1.maxWidth * 0.125,
                      child: const Text(
                        'RANK',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: p1.maxWidth * 0.25,
                      //color: Colors.amber,
                      child: const FittedBox(
                        child: AutoSizeText(
                          'SUBMITTED ON',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: p1.maxWidth * 0.2,
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
                    2,
                    (index) => DataRow(
                      cells: [
                        DataCell(
                          SizedBox(
                            width: p1.maxWidth * 0.275,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: p1.maxWidth * 0.04,
                                  child: RandomAvatar(mockString()),
                                ),
                                SizedBox(width: 6.w),
                                Expanded(
                                  child: Text(
                                    myRandomName(),
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontFamily: 'Cabin',
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
                              "July 22, 12:30 PM",
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
                            alignment: Alignment.centerRight,
                            child: FittedBox(
                              child: AutoSizeText.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text:
                                            "0${mockInteger(1, 5)}:${mockInteger(10, 59)}"),
                                    TextSpan(
                                        text: ":${mockInteger(100, 599)}",
                                        style: TextStyle(
                                            fontSize: p1.maxWidth * 0.02)),
                                  ],
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
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
        )
      ],
    );
  }
}

class _ToHeader extends StatelessWidget {
  const _ToHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: 39.h,
      margin: EdgeInsets.symmetric(horizontal: 9.w),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.w),
            child: LinearProgressIndicator(
              minHeight: 6.h,
              value: 0.75,
            ),
          ),
          SizedBox(height: 3.h),
          Expanded(
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 0.21.w,
                      ),
                      borderRadius: BorderRadius.circular(1.w),
                    ),
                    child: LayoutBuilder(
                      builder: (context, p1) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "0${mockInteger(1, 5)}",
                            style: TextStyle(
                              fontSize: p1.maxWidth * 0.54,
                              color: Colors.white,
                              fontFamily: 'LilitaOne',
                            ),
                          ),
                          Text(
                            "Minutes",
                            style: TextStyle(
                              fontSize: p1.maxWidth * 0.15,
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                //SizedBox(width: 3.w),
                AspectRatio(
                  aspectRatio: 1,
                  child: LayoutBuilder(
                    builder: (context, p1) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${mockInteger(10, 59)}",
                          style: TextStyle(
                            fontSize: p1.maxWidth * 0.54,
                            color: Colors.white,
                            fontFamily: 'LilitaOne',
                          ),
                        ),
                        Text(
                          "Seconds",
                          style: TextStyle(
                            fontSize: p1.maxWidth * 0.15,
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
