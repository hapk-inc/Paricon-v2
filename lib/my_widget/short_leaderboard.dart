import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';

import '../logic/my_names.dart';
import '../theme/my_color.dart';

class ShortLeaderBoard extends StatelessWidget {
  const ShortLeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, p) => DataTable(
        horizontalMargin: 0,
        columnSpacing: 3.w,
        headingRowHeight: p.maxHeight * 0.15,
        dataRowMinHeight: p.maxHeight * 0.21,
        dataRowMaxHeight: p.maxHeight * 0.21,
        // headingRowColor:
        //     const MaterialStatePropertyAll(Colors.green),
        headingTextStyle: TextStyle(
          fontSize: 12.r,
          fontFamily: 'DelaGothic',
          color: spaceCadet,
        ),
        dataTextStyle: TextStyle(
          fontSize: 15.r,
          color: richBlack,
          fontFamily: 'Poppins',
        ),
        columns: [
          DataColumn(
            label: SizedBox(
              // color: deepSkyBlue,
              width: p.maxWidth * 0.18,
              child: const Text("Rank"),
            ),
          ),
          DataColumn(
            label: SizedBox(
              width: p.maxWidth * 0.45,
              //color: deepSkyBlue,
              child: const Text("Name"),
            ),
          ),
          DataColumn(
            label: SizedBox(
              width: p.maxWidth * 0.36,
              //color: deepSkyBlue,
              child: const Text("Duration"),
            ),
          ),
        ],
        rows: [
          ...List.generate(
            4,
            (index) => DataRow(
              cells: [
                DataCell(
                  Container(
                    width: p.maxWidth * 0.18,
                    margin: EdgeInsets.only(left: p.maxWidth * 0.03),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${"${mockInteger(1, 30)}".padLeft(2, '0')}.",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.r,
                      ),
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    width: p.maxWidth * 0.45,
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      myRandomName(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.r,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: p.maxWidth * 0.36,
                    child: AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  "${"${mockInteger(1, 9)}".padLeft(2, '0')} : ${"${mockInteger(1, 59)}".padLeft(2, '0')}"),
                          TextSpan(
                            text: " ${mockInteger(100, 500)}",
                            style: TextStyle(
                              fontSize: 10.8.r,
                              color: battleshipGray,
                            ),
                          )
                        ],
                        style: const TextStyle(fontFamily: 'Montserrat'),
                      ),
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
