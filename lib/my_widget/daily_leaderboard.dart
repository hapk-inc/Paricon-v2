import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';

import '../logic/my_names.dart';
import '../theme/my_color.dart';

const List<String> _header = ["Name", "Rank", "Played on", "Duration"];

class DailyLeaderBoard extends StatelessWidget {
  const DailyLeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    List<num> hSize = [30, 14, 26, 30];
    return Container(
      color: cream,
      alignment: Alignment.center,
      child: DataTable(
        horizontalMargin: 6.r,
        columnSpacing: 0,
        dividerThickness: .9.r,
        dataRowMaxHeight: 54.r,
        dataRowMinHeight: 30.r,
        headingRowHeight: 54.r,
        headingRowColor: const MaterialStatePropertyAll(straw),
        //dataRowColor: MaterialStateProperty.,
        headingTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 15.r,
            color: jet),
        dataTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.normal,
          fontSize: 15.r,
        ),
        columns: List.generate(
          4,
          (index) => DataColumn(
            label: SizedBox(
              width: 360.w * (.01 * hSize[index]),
              child: Text(_header[index]),
            ),
          ),
        ),
        rows: [
          ...List.generate(
            6,
            (index) => DataRow(
              color: MaterialStatePropertyAll(index.isEven ? cream : beige),
              cells: [
                DataCell(
                  Container(
                    width: 360.w * (.01 * 30),
                    margin: EdgeInsets.only(right: 3.r),
                    child: Row(
                      children: [
                        if (mockInteger(0, 1) == 0) ...[
                          CircleAvatar(radius: 12.r),
                          SizedBox(width: 9.r),
                        ],
                        Expanded(
                          child: AutoSizeText(
                            myRandomName(),
                            style: TextStyle(
                              fontSize: 13.5.r,
                              color: onyx,
                              fontFamily: "Montserrat",
                            ),
                            minFontSize: 9,
                            maxFontSize: 15,
                            stepGranularity: 3,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    mockInteger(1, 20).toString().padLeft(2, '0'),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.r,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                        color: imperialRed,
                        letterSpacing: 0.3.r),
                  ),
                ),
                DataCell(
                  Text(
                    "Yesterday, ${mockInteger(1, 23).toString().padLeft(2, '0')}:45",
                    style: TextStyle(
                        fontSize: 12.r,
                        fontWeight: FontWeight.w300,
                        color: redWood,
                        fontFamily: 'Poppins'),
                  ),
                ),
                DataCell(
                  RichText(
                    text: TextSpan(
                      text: "${mockInteger(1, 5).toString().padLeft(2, '0')}:"
                          "${mockInteger(1, 59).toString().padLeft(2, '0')} ",
                      children: [
                        TextSpan(
                          text: "${mockInteger(100, 599)}",
                          style: TextStyle(
                            fontSize: 12.r,
                            color: beaver,
                          ),
                        )
                      ],
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        // fontStyle: FontStyle.italic,
                        color: cafeNoir,
                        fontSize: 16.5.r,
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
