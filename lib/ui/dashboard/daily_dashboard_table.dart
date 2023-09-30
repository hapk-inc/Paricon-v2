import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../logic/s_size.dart';
import '../../my_widgets/my_names.dart';
import '../../theme/my_color.dart';

const List<String> _hText = ["Name", "Rank", "Played On", "Current Time"];
const List<String> _hText1 = [
  "Name",
  "Rank",
  "Played On",
  "Current Time",
  "Best Time"
];

class DailyDashboardTable extends ConsumerWidget {
  const DailyDashboardTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    final bool isTab = sSize == ScreenSize.tab;
    final bool isPad = sSize == ScreenSize.iPad;
    List<num> hSize = [isTab ? 35 : 34, 14, 26, 25];
    List<num> hSize1 = [27, 14, 21, 18, 16];
    return Container(
      color: mintCream,
      alignment: Alignment.center,
      margin: EdgeInsets.all(1.5.r),
      // padding: EdgeInsets.symmetric(horizontal: 3.r),
      child: LayoutBuilder(
        builder: (_, p1) {
          return DataTable(
            horizontalMargin: 6.r,
            columnSpacing: 0,
            dividerThickness: .9.h,
            // dataRowMinHeight: p1.maxHeight * 0.14,
            dataRowMinHeight: 24.r,
            dataRowMaxHeight: 45.r,
            //  dataRowMaxHeight: p1.maxHeight * 0.141,
            headingRowHeight: p1.maxHeight * 0.12,
            headingTextStyle: TextStyle(
              fontSize: 13.5.r,
              color: crayola,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
            dataTextStyle: TextStyle(
              fontSize: 12.r,
              color: Colors.blue,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
            columns: [
              ...List.generate(
                isPad ? _hText1.length : 4,
                (index) => DataColumn(
                  label: Container(
                    width: p1.maxWidth *
                        (0.01 * (isPad ? hSize1[index] : hSize[index])),
                    padding: EdgeInsets.only(right: 15.w),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      isPad ? _hText1[index] : _hText[index],
                      style: TextStyle(fontSize: 13.5.r),
                    ),
                  ),
                ),
              )
            ],
            rows: List.generate(isPad ? 8 : 7, (index) {
              List<String> dataText = [
                myRandomName(),
                "# ${mockInteger(1, 100)}",
                mockInteger(0, 1) == 0
                    ? "Today ${mockInteger(10, 18)}:${mockInteger(10, 59)}"
                    : "Yesterday",
                "${mockInteger(1, 5)}:${mockInteger(10, 59)}",
                if (isPad) "${mockInteger(1, 5)}:${mockInteger(10, 59)}",
              ];
              return DataRow(
                cells: List.generate(
                  isPad ? 5 : 4,
                  (index) => index == 0
                      ? DataCell(
                          Container(
                            alignment: Alignment.centerLeft,
                            //color: ghostWhite,
                            padding:
                                EdgeInsets.only(right: p1.maxWidth * 0.009),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 14.r,
                                  child: RandomAvatar(mockString()),
                                ),
                                SizedBox(width: p1.maxWidth * 0.024),
                                Expanded(
                                  child: Text(
                                    dataText[index],
                                    style: TextStyle(
                                      fontSize: isPad
                                          ? 13.2.r
                                          : isTab
                                              ? 12.r
                                              : 10.5.r,
                                      color: spaceCadet,
                                      fontFamily:
                                          isPad ? 'Montserrat' : 'Montserrat',
                                      fontWeight: isPad
                                          ? FontWeight.normal
                                          : FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : index == 3 || index == 4
                          ? DataCell(RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "0${mockInteger(1, 5)}:${mockInteger(10, 59)}",
                                    style: TextStyle(
                                        fontSize: sSize == ScreenSize.phone
                                            ? 13.5.r
                                            : 15.r),
                                  ),
                                  TextSpan(
                                    text: ": ${mockInteger(100, 500)}",
                                    style: TextStyle(
                                        fontSize: sSize == ScreenSize.phone
                                            ? 10.2.r
                                            : 10.2.r),
                                  )
                                ],
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: coyote,
                                  //color: txtColor[i],
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ))
                          : DataCell(
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  dataText[index],
                                  style: TextStyle(
                                    fontSize: isTab
                                        ? index == 1
                                            ? 13.5.r
                                            : 12.r
                                        : 11.1.r,
                                    color: index == 1
                                        ? crayola
                                        : index == 2
                                            ? bronze
                                            : darkPurple,
                                    // fontSize: index == 3 ? 14.4.r : null,
                                  ),
                                ),
                              ),
                            ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class DailyDashboardTable1 extends ConsumerWidget {
  const DailyDashboardTable1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    List<num> hSize = [36, 15, 24, 27];
    bool isPhoneTab = sSize == ScreenSize.phone || sSize == ScreenSize.tab;

    List<Color> txtColor = [
      const Color(0xff363537),
      const Color(0xffEF2D56),
      const Color(0xffED7D3A),
      const Color(0xff00916E),
    ];
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 7.5.w),
      decoration: const BoxDecoration(
        color: Color(0xffE5F3ED),
      ),
      child: LayoutBuilder(
        builder: (_, p1) => DataTable(
          horizontalMargin: 0,
          columnSpacing: 0,
          dataRowHeight:
              isPhoneTab ? p1.maxHeight * 0.135 : p1.maxHeight * 0.132,
          headingRowHeight: p1.maxHeight * (isPhoneTab ? 0.12 : 0.15),
          dividerThickness: .6.h,
          headingTextStyle: TextStyle(
            fontSize: sSize == ScreenSize.phone ? 11.1.w : 9.w,
            color: const Color(0xffEF2D56),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
          dataTextStyle:
              TextStyle(fontSize: sSize == ScreenSize.phone ? 10.5.w : 9.w),
          columns: [
            ...List.generate(
              4,
              (index) => DataColumn(
                label: Container(
                  width: p1.maxWidth * (0.01 * hSize[index]),
                  padding: EdgeInsets.only(
                      right: sSize == ScreenSize.phone ? 15.w : 12.w),
                  alignment: Alignment.centerLeft,
                  child: Text(_hText[index]),
                ),
              ),
            )
          ],
          rows: [
            ...List.generate(
              6,
              (index) => DataRow(
                cells: [
                  ...List.generate(
                    4,
                    (i) {
                      List<String> dataText = [
                        myRandomName(),
                        "# ${mockInteger(1, 11)}",
                        mockInteger(0, 1) == 0
                            ? "Today ${mockInteger(10, 18)}:${mockInteger(10, 59)}"
                            : "Yesterday",
                        "${mockInteger(1, 5)} : ${mockInteger(10, 59)}"
                      ];
                      return DataCell(
                        Container(
                          //   color: Colors.indigo.withOpacity(0.1 * _i),
                          width: p1.maxWidth * (0.01 * hSize[i]),
                          alignment: i == 3
                              ? Alignment.centerLeft
                              : Alignment.centerLeft,
                          child: i == 0
                              ? Row(children: [
                                  CircleAvatar(
                                    radius: sSize == ScreenSize.phone
                                        ? 10.5.w
                                        : 9.w,
                                    child: RandomAvatar(mockString()),
                                  ),
                                  SizedBox(
                                      width: sSize == ScreenSize.phone
                                          ? 6.w
                                          : 4.5.w),
                                  Text(
                                    dataText[i],
                                    style: TextStyle(
                                      color: const Color(0xff363537),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: sSize == ScreenSize.phone
                                          ? 9.6.w
                                          : 8.1.w,
                                    ),
                                  ),
                                ])
                              : i == 3
                                  ? RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "0${mockInteger(1, 5)}:${mockInteger(10, 59)}",
                                            style: TextStyle(
                                                fontSize:
                                                    sSize == ScreenSize.phone
                                                        ? 12.w
                                                        : 10.5.w),
                                          ),
                                          TextSpan(
                                            text: ": ${mockInteger(100, 500)}",
                                            style: TextStyle(
                                                fontSize:
                                                    sSize == ScreenSize.phone
                                                        ? 9.w
                                                        : 7.5.w),
                                          )
                                        ],
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: txtColor[i],
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      dataText[i],
                                      style: TextStyle(
                                          color: txtColor[i],
                                          fontFamily: 'Montserrat',
                                          fontWeight:
                                              i == 1 ? FontWeight.w700 : null,
                                          fontSize: i == 2
                                              ? sSize == ScreenSize.phone
                                                  ? 9.w
                                                  : 7.5.w
                                              : null),
                                    ),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DailyDashboardTableWeb extends ConsumerWidget {
  const DailyDashboardTableWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    List<num> hSize1 = [30, 12, 18, 20, 20];
    List<String> hText1 = [
      "Name",
      "Rank",
      "Played On",
      "Duration",
      "Best Score"
    ];
    bool isPhoneTab = sSize == ScreenSize.phone || sSize == ScreenSize.tab;

    List<Color> txtColor = [
      const Color(0xff363537),
      const Color(0xffEF2D56),
      const Color(0xffED7D3A),
      const Color(0xff00916E),
      const Color(0xff00916E),
    ];
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 7.5.w),
      decoration: const BoxDecoration(
        color: Color(0xffE5F3ED),
      ),
      child: LayoutBuilder(
        builder: (context, p1) => DataTable(
          horizontalMargin: 0,
          columnSpacing: 0,
          dataRowHeight:
              isPhoneTab ? p1.maxHeight * 0.135 : p1.maxHeight * 0.132,
          headingRowHeight: p1.maxHeight * (isPhoneTab ? 0.12 : 0.15),
          dividerThickness: .6.h,
          headingTextStyle: TextStyle(
            fontSize: sSize == ScreenSize.phone ? 11.1.w : 9.w,
            color: const Color(0xffEF2D56),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
          dataTextStyle: TextStyle(
              fontSize: isPhoneTab
                  ? 8.1.w
                  : sSize == ScreenSize.phone
                      ? 10.5.w
                      : 9.w),
          columns: [
            ...List.generate(
              5,
              (index) => DataColumn(
                label: Container(
                  width: p1.maxWidth * (0.01 * hSize1[index]),
                  padding: EdgeInsets.only(
                      right: sSize == ScreenSize.phone ? 15.w : 12.w),
                  alignment: Alignment.centerLeft,
                  child: Text(hText1[index]),
                ),
              ),
            )
          ],
          rows: [
            ...List.generate(
              6,
              (index) => DataRow(
                cells: [
                  ...List.generate(
                    5,
                    (i) {
                      List<String> dataText = [
                        myRandomName(),
                        "# ${mockInteger(1, 11)}",
                        mockInteger(0, 1) == 0
                            ? "Today ${mockInteger(10, 18)}:${mockInteger(10, 59)}"
                            : "Yesterday",
                        "${mockInteger(1, 5)} : ${mockInteger(10, 59)}",
                        "${mockInteger(1, 5)} : ${mockInteger(10, 59)}",
                      ];
                      return DataCell(
                        Container(
                          //   color: Colors.indigo.withOpacity(0.1 * _i),
                          width: p1.maxWidth * (0.01 * hSize1[i]),
                          alignment: i == 3
                              ? Alignment.centerLeft
                              : Alignment.centerLeft,
                          child: i == 0
                              ? Row(children: [
                                  CircleAvatar(
                                    radius: sSize == ScreenSize.phone
                                        ? 10.5.w
                                        : 9.w,
                                    child: RandomAvatar(mockString()),
                                  ),
                                  SizedBox(
                                      width: sSize == ScreenSize.phone
                                          ? 6.w
                                          : 4.5.w),
                                  Text(
                                    dataText[i],
                                    style: TextStyle(
                                      color: const Color(0xff363537),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: !isPhoneTab
                                          ? 7.2.w
                                          : sSize == ScreenSize.phone
                                              ? 9.6.w
                                              : 8.1.w,
                                    ),
                                  ),
                                ])
                              : i == 3 || i == 4
                                  ? RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "0${mockInteger(1, 5)}:${mockInteger(10, 59)}",
                                            style: TextStyle(
                                                fontSize: !isPhoneTab
                                                    ? 9.w
                                                    : sSize == ScreenSize.phone
                                                        ? 12.w
                                                        : 10.5.w),
                                          ),
                                          TextSpan(
                                            text: ": ${mockInteger(100, 500)}",
                                            style: TextStyle(
                                                fontSize: !isPhoneTab
                                                    ? 6.w
                                                    : sSize == ScreenSize.phone
                                                        ? 9.w
                                                        : 7.5.w),
                                          )
                                        ],
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: txtColor[i],
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      dataText[i],
                                      style: TextStyle(
                                          color: txtColor[i],
                                          fontFamily: 'Montserrat',
                                          fontWeight:
                                              i == 1 ? FontWeight.w700 : null,
                                          fontSize: isPhoneTab
                                              ? 6.w
                                              : i == 2
                                                  ? sSize == ScreenSize.phone
                                                      ? 9.w
                                                      : 7.5.w
                                                  : null),
                                    ),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
