import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../my_widgets/my_names.dart';
import '../../my_widgets/tournament_grid_revised.dart';

class TournamentP extends StatelessWidget {
  const TournamentP({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, p1) => SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: p1.maxHeight * 0.175,
              padding: EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.05),
              margin: EdgeInsets.symmetric(
                  horizontal: p1.maxWidth * 0.025,
                  vertical: p1.maxHeight * 0.01),
              decoration: BoxDecoration(
                color: Color(0xffCBF7ED),
                borderRadius: BorderRadius.circular(p1.maxWidth * 0.015),
              ),
              child: const _ToHeader(),
            ),
            Container(
              color: Colors.blue.shade50.withOpacity(0.25),
              height: 420.sp,
              padding: EdgeInsets.all(3.w),
              child: const TournamentGridRevised(),
            ),
            Container(
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
            )
          ],
        ),
      ),
    );
  }
}

class _ToHeader extends StatelessWidget {
  const _ToHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: p1.maxHeight * 0.15),
          ClipRRect(
            borderRadius: BorderRadius.circular(p1.maxWidth * 0.05),
            child: LinearProgressIndicator(minHeight: p1.maxHeight * 0.075),
          ),
          SizedBox(height: p1.maxWidth * 0.025),
          SizedBox(
            height: p1.maxHeight * 0.324,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      //color: Colors.blue,
                      borderRadius: BorderRadius.circular(p1.maxWidth * 0.0125),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "0${mockInteger(1, 5)}",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: p1.maxWidth * 0.054,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "Minutes",
                          style: TextStyle(
                              fontSize: p1.maxWidth * 0.021,
                              fontWeight: FontWeight.w100),
                        )
                      ],
                    ),
                  ),
                ),
                // SizedBox(width: p1.maxWidth * 0.001),
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      //  color: Colors.blue,
                      borderRadius: BorderRadius.circular(p1.maxWidth * 0.0125),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "${mockInteger(10, 59)}",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: p1.maxWidth * 0.054,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "Seconds",
                          style: TextStyle(
                              fontSize: p1.maxWidth * 0.021,
                              fontWeight: FontWeight.w100),
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

/*/*Positioned(
            bottom: p1.maxHeight * 0.05,
            height: p1.maxHeight * 0.01,
            left: p1.maxWidth * 0.2,
            width: p1.maxWidth * 0.75,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(p1.maxWidth * 0.005),
              child: LinearProgressIndicator(
                value: 0.7,
              ),
            ),
          ),
          Positioned(
            width: p1.maxWidth * 0.2,
            bottom: p1.maxHeight * 0.04,
            left: p1.maxWidth * 0.01,
            height: p1.maxHeight * 0.08,
            child: const TrophyRank(),
          ),
          Positioned(
            bottom: p1.maxHeight * 0.06,
            height: p1.maxHeight * 0.06,
            width: p1.maxWidth * 0.75,
            left: p1.maxWidth * 0.2,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Flexible(
                        child: FractionallySizedBox(
                          heightFactor: 0.8,
                          widthFactor: 1,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              "Remaining",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: p1.maxHeight * 0.001),
                      Flexible(
                        flex: 2,
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          heightFactor: 0.8,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              mockInteger(1, 72).toString().padLeft(2, "0"),
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Flexible(
                        child: FractionallySizedBox(
                          heightFactor: 0.8,
                          widthFactor: 1,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              "Remaining",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: p1.maxHeight * 0.001),
                      Flexible(
                        flex: 2,
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          heightFactor: 0.8,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              mockInteger(1, 72).toString().padLeft(2, "0"),
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Flexible(
                        child: FractionallySizedBox(
                          heightFactor: 0.8,
                          widthFactor: 1,
                          child: FittedBox(
                            alignment: Alignment.centerRight,
                            child: AutoSizeText(
                              "Remaining",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: p1.maxHeight * 0.001),
                      Flexible(
                        flex: 2,
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          heightFactor: 0.8,
                          child: FittedBox(
                            alignment: Alignment.centerRight,
                            child: AutoSizeText(
                              mockInteger(1, 72).toString().padLeft(2, "0"),
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )*/*/
