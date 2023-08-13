import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/my_widgets/my_names.dart';
import 'package:random_avatar/random_avatar.dart';

class DailyDashboardTable extends StatelessWidget {
  const DailyDashboardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      padding: EdgeInsets.symmetric(horizontal: 4.5.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xffceeddb),
        // borderRadius: BorderRadius.circular(4.5.w),
      ),
      child: LayoutBuilder(
        builder: (_, p1) => DataTable(
          columnSpacing: 0,
          horizontalMargin: p1.maxWidth * 0.024,
          checkboxHorizontalMargin: 0,
          dividerThickness: p1.maxHeight * 0.003,
          headingRowHeight: p1.maxHeight * 0.12,
          dataRowMaxHeight: p1.maxHeight * 0.156,
          dataRowMinHeight: p1.maxHeight * 0.12,
          headingTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            color: const Color(0xff85baa1),
            fontWeight: FontWeight.w700,
            fontSize: p1.maxWidth * 0.036,
          ),
          dataTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: p1.maxWidth * 0.03,
            color: const Color(0xff2a0c4e),
          ),
          columns: [
            DataColumn(
              label: Container(
                //color: Colors.red,
                width: p1.maxWidth * 0.39,
                alignment: Alignment.centerLeft,
                child: const FittedBox(child: Text('NAME')),
              ),
            ),
            DataColumn(
              label: Container(
                alignment: Alignment.center,
                width: p1.maxWidth * 0.12,
                child: const FittedBox(
                  child: Text('RANK'),
                ),
              ),
            ),
            DataColumn(
              label: Container(
                alignment: Alignment.center,
                width: p1.maxWidth * 0.3,
                child: const FittedBox(
                  child: Text(
                    'SUBMITTED ON',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            DataColumn(
              label: Container(
                width: p1.maxWidth * 0.09,
                alignment: Alignment.centerRight,
                child: const FittedBox(child: Text('TIME')),
              ),
            ),
          ],
          rows: [
            ...List.generate(
              5,
              (index) => DataRow(
                cells: [
                  DataCell(
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: p1.maxHeight * 0.015),
                      width: p1.maxWidth * 0.24,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: p1.maxWidth * 0.03,
                            child: RandomAvatar(mockString()),
                          ),
                          SizedBox(width: p1.maxWidth * 0.021),
                          Expanded(
                            child: Container(
                              height: p1.maxHeight * 0.06,
                              alignment: Alignment.centerLeft,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  myRandomName(),
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 10.2.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
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
                      margin:
                          EdgeInsets.symmetric(vertical: p1.maxHeight * 0.015),
                      width: p1.maxWidth * 0.123,
                      child: Text(
                        "#${mockInteger(1, 10)}",
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w900,
                          color: Color(0xff9e2b25),
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: p1.maxWidth * 0.24,
                      margin:
                          EdgeInsets.symmetric(vertical: p1.maxHeight * 0.015),
                      alignment: Alignment.center,
                      child: Text(
                        "Aug ${mockInteger(1, 30)}, 12:30 PM",
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: p1.maxWidth * 0.024,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: p1.maxWidth * 0.21,
                      height: p1.maxHeight * 0.075,
                      margin:
                          EdgeInsets.symmetric(vertical: p1.maxHeight * 0.015),

                      alignment: Alignment.centerLeft,
                      //color: Colors.indigo,
                      //  margin: EdgeInsets.only(bottom: 3.h, left: 9.w),
                      child: FittedBox(
                        // fit: BoxFit.fitWidth,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "0${mockInteger(1, 5)}:"
                                    "${mockInteger(10, 59)}",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              TextSpan(
                                text: ":${mockInteger(100, 599)}",
                                style: TextStyle(
                                  fontSize: 9.sp,
                                ),
                              ),
                            ],
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w900,
                              color: Color(0xff280c4e),
                            ),
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
    );
  }
}
