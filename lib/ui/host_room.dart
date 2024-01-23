import 'package:animate_do/animate_do.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';

import 'package:random_avatar/random_avatar.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../logic/my_names.dart';
import '../logic/room_level_notifier.dart';
import '../logic/room_provider.dart';
import '../logic/room_type_notifier.dart';
import '../model/room.dart';
import '../router/my_route.dart';
import '../theme/my_color.dart';

import '../theme/my_theme.dart';

//const List<double> _colSize = [0.12, 0.42, 0.36];

class HostRoom extends ConsumerWidget {
  const HostRoom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      sGameStartProvider.select((data) => data.value ?? false),
      (previous, next) {
        if (next) {
          context.router.push(const PlayFriendRoute());
        }
      },
    );

    final Room? room = ref.watch(roomProvider).when(
        data: (x) => x,
        error: (e, s) {
          debugPrintStack(stackTrace: s);
          return null;
        },
        loading: () => null);
    final int i = mockInteger(1, 3);
    final pTheme = SlidingPanelTheme();
    return room == null
        ? Container()
        : Container(
            padding: pTheme.slidingPanelPadding,
            alignment: Alignment.centerLeft,
            child: LayoutBuilder(
              builder: (_, c) => ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    dense: true,
                    tileColor: xantHous,
                    minLeadingWidth: 0,
                    contentPadding: EdgeInsets.zero,
                    leading: AnimatedFlipCounter(
                      value: mockInteger(1, 999999),
                      wholeDigits: 6,
                      duration: const Duration(milliseconds: 1200),
                      textStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30.r,
                        color: federalBlue,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5.r,
                      ),
                    ),
                    trailing: SizedBox(
                      width: 90.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(Icons.done, size: 21.r),
                            onPressed: () =>
                                ref.watch(createBoardProvider.future).then(
                              (created) {
                                debugPrint("Created $created");
                                if (created) {
                                  ref.read(gameStartProvider);
                                }
                              },
                            ).catchError(
                              (e, s) {
                                debugPrintStack(stackTrace: s);
                              },
                            ),
                          ),
                          Icon(Icons.close, size: 21.r),
                        ],
                      ),
                    ),
                  ),
                  Gap(3.r),
                  AutoSizeText(
                    "${myRandomName()} created this room. "
                    "Share the code with your friends",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12.r,
                      height: 2.1.r,
                      fontWeight: FontWeight.normal,
                      color: gray,
                    ),
                    maxFontSize: 15,
                    minFontSize: 9,
                    maxLines: 1,
                  ),
                  Gap(30.r),
                  Container(
                    height: 105.h,
                    //  margin: EdgeInsets.symmetric(vertical: 24.r),
                    width: 330.w,
                    decoration: BoxDecoration(
                      color: majorelleBlue,
                      borderRadius: BorderRadius.circular(7.5.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.5.r),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          i,
                          (index) => FadeInRight(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              color: gridColor[index],
                              width: c.maxWidth / i,
                              child: Stack(
                                children: [
                                  /*  Positioned(
                                    left: c.maxWidth * 0.024,
                                    top: c.maxHeight * 0.024,
                                    child: AutoSizeText(
                                      myRandomName(),
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: i == 3 ? 12.r : 15.r,
                                        */ /*color: mockInteger(0, 1) == 0
                                      ? cornellRed
                                      : federalBlue,*/ /*
                                        color: federalBlue,
                                        letterSpacing: 0.r,
                                      ),
                                    ),
                                  ),*/
                                  Positioned.fill(
                                    bottom: -c.maxHeight * 0.018,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: FadeInUp(
                                        child: RandomAvatar(
                                          mockString(),
                                          trBackground: true,
                                          height: c.maxWidth * 0.24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(21.r),
                  /*Container(
              height: c.maxHeight * 0.12,
              //color: Colors.red,
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                "${List.generate(
                  mockInteger(1, 3),
                  (index) => myRandomName(),
                ).fold("", (previousValue, element) => " $previousValue, $element,")} "
                "are waiting",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.r,
                  fontWeight: FontWeight.w500,
                  color: federalBlue,
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),*/
                  Container(
                    decoration: BoxDecoration(
                      color: magnolia,
                      borderRadius: BorderRadius.circular(7.5.r),
                    ),
                    height: 144.h,
                    width: 330.w,
                    child: LayoutBuilder(builder: (context, c1) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Gap(3.r),
                          ToggleSwitch(
                            radiusStyle: true,
                            labels: List.from(
                                RoomLevel.values.map((e) => firstCaps(e.name))),
                            customWidths: [75.w, 105.w, 75.w],
                            minHeight: c1.maxHeight * 0.24,
                            onToggle: (index) => ref
                                .read(levelProvider.notifier)
                                .state = RoomLevel.values[index!],
                            inactiveBgColor: magnolia,
                            inactiveFgColor: charcoal,
                            activeBgColor: const [tropicalIndigo],
                            animate: true,
                            animationDuration: 150,
                            dividerColor: ghostWhite,
                            dividerMargin: 1.2.r,
                            customTextStyles: [
                              TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.r,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          Gap(30.r),
                          ToggleSwitch(
                            radiusStyle: true,
                            labels: List.from(
                              RoomType.values.map((e) => firstCaps(e.name)),
                            ),
                            customWidths: [105.w, 90.w, 120.w],
                            minHeight: c1.maxHeight * 0.255,
                            onToggle: (index) => ref
                                .read(typeProvider.notifier)
                                .state = RoomType.values[index!],
                            inactiveBgColor: magnolia,
                            inactiveFgColor: charcoal,
                            activeBgColor: const [federalBlue],
                            //animate: true,
                            animationDuration: 120,
                            dividerColor: ghostWhite,
                            dividerMargin: 1.2.r,
                            customTextStyles: [
                              TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.4.r,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                  /* Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 30.r),
              child: ToggleSwitch(
                radiusStyle: true,
                labels:
                    List.from(RoomLevel.values.map((e) => firstCaps(e.name))),
                customWidths: [75.w, 105.w, 75.w],
                minHeight: 40.h,
                onToggle: (index) => ref.read(levelProvider.notifier).state =
                    RoomLevel.values[index!],
                inactiveBgColor: magnolia,
                inactiveFgColor: charcoal,
                activeBgColor: const [tropicalIndigo],
                animate: true,
                animationDuration: 150,
                dividerColor: ghostWhite,
                dividerMargin: 1.2.r,
                customTextStyles: [
                  TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15.r,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 24.r),
              child: ToggleSwitch(
                radiusStyle: true,
                labels: List.from(
                  RoomType.values.map((e) => firstCaps(e.name)),
                ),
                customWidths: [105.w, 90.w, 120.w],
                minHeight: 43.5.h,
                onToggle: (index) => ref.read(typeProvider.notifier).state =
                    RoomType.values[index!],
                inactiveBgColor: magnolia,
                inactiveFgColor: charcoal,
                activeBgColor: const [federalBlue],
                //animate: true,
                animationDuration: 120,
                dividerColor: ghostWhite,
                dividerMargin: 1.2.r,
                customTextStyles: [
                  TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.4.r,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),*/
                  Gap(30.r),
                  /*ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    */ /* textStyle: MaterialStatePropertyAll(
                      TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.5.r,
                        color: ghostWhite,
                      ),
                    ),*/ /*
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                    ),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 15.r),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(cornellRed),
                  ),
                  child: Text(
                    "START GAME",
                    style: TextStyle(color: ghostWhite),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                    ),
                  ),
                  child: Text(
                    "LEAVE GAME",
                    style: TextStyle(color: gray),
                  ),
                )
              ],
            )*/
                ],
              ),
            ),
          );
  }
}

/*class HostRoom2 extends ConsumerWidget {
  const HostRoom2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pTheme = SlidingPanelTheme();
    return Container(
      alignment: Alignment.centerLeft,
      padding: pTheme.slidingPanelPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedFlipCounter(
            value: 8,
            wholeDigits: 6,
            textStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 36.r,
              letterSpacing: 1.2.r,
            ),
          ),
          Text("kkk"),
          Gap(15.r),
          Container(
            height: 150.h,
            decoration: BoxDecoration(
              color: majorelleBlue,
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
          // Gap(15.r),
          Text("kkk"),
          Gap(1.r),
          ToggleSwitch(
            radiusStyle: true,
            labels: List.from(RoomLevel.values.map((e) => firstCaps(e.name))),
            customWidths: [75.w, 105.w, 75.w],
            minHeight: 40.h,
            onToggle: (index) => ref.read(levelProvider.notifier).state =
                RoomLevel.values[index!],
            inactiveBgColor: magnolia,
            inactiveFgColor: charcoal,
            activeBgColor: const [tropicalIndigo],
            animate: true,
            animationDuration: 150,
            dividerColor: ghostWhite,
            dividerMargin: 1.2.r,
            customTextStyles: [
              TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15.r,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          Gap(30.r),
          ToggleSwitch(
            radiusStyle: true,
            labels: List.from(
              RoomType.values.map((e) => firstCaps(e.name)),
            ),
            customWidths: [105.w, 90.w, 120.w],
            minHeight: 43.5.h,
            onToggle: (index) =>
                ref.read(typeProvider.notifier).state = RoomType.values[index!],
            inactiveBgColor: magnolia,
            inactiveFgColor: charcoal,
            activeBgColor: const [federalBlue],
            //animate: true,
            animationDuration: 120,
            dividerColor: ghostWhite,
            dividerMargin: 1.2.r,
            customTextStyles: [
              TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14.4.r,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          //   Gap(30.r),
          SizedBox(
            height: 90.h,
            child: ButtonBar(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 15.w),
                    ),
                    backgroundColor:
                        const MaterialStatePropertyAll(chocolateCosmos),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: AutoSizeText(
                    "CREATE GAME",
                    style: TextStyle(color: ghostWhite, fontSize: 14.4.r),
                    maxLines: 1,
                  ),
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                    ),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 15.w),
                    ),
                    side: MaterialStatePropertyAll(
                      BorderSide(color: majorelleBlue, width: 0.3.r),
                    ),
                  ),
                  onPressed: () {},
                  child: AutoSizeText(
                    "ENTER ROOM CODE",
                    maxLines: 1,
                    style: TextStyle(fontSize: 14.4.r),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}*/

/*class HostRoom1 extends ConsumerWidget {
  const HostRoom1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pTheme = SlidingPanelTheme();
    return Container(
      decoration: BoxDecoration(
        //color: Colors.red,
        borderRadius: pTheme.slidingPanelRadius,
      ),
      padding: pTheme.slidingPanelPadding,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: pTheme.slidingPanelPadding,
              children: [
                Container(
                  height: 45.h,
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    leading: CircleAvatar(radius: 15.r),
                    minLeadingWidth: 0.r,
                    title: AutoSizeText(
                      "${myRandomName()} created this room",
                      style: TextStyle(
                        fontSize: 12.r,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: AutoSizeText(
                      "${mockInteger(111111, 999999)}",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 24.r,
                      ),
                    ),
                  ),
                ),
                Gap(15.r),
                Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: majorelleBlue,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
                Gap(15.r),
                Container(
                  height: 300.h,
                  alignment: Alignment.topLeft,
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      final double pH = constraints.maxHeight;
                      final double pW = constraints.maxWidth;
                      return DataTable(
                        horizontalMargin: 0.w,
                        dividerThickness: 0.6.r,
                        columnSpacing: 3.w,
                        headingTextStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.r,
                        ),
                        dataTextStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.r,
                        ),
                        headingRowHeight: pH * 0.12,
                        dataRowMinHeight: pH * 0.15,
                        dataRowMaxHeight: pH * 0.18,
                        columns: [
                          DataColumn(
                            label: Container(
                              width: 60.w,
                              padding:
                                  EdgeInsets.symmetric(horizontal: pW * 0.018),
                              // height: pH * 0.18,
                              alignment: Alignment.centerLeft,
                              //color: Colors.amber,
                            ),
                          ),
                          ...List.generate(
                            3,
                            (index) => DataColumn(
                              label: Container(
                                // color: gridColor[index],
                                width: pW * 0.255,
                                //height: pH * 0.18,
                                padding: EdgeInsets.symmetric(
                                    horizontal: pW * 0.018),
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  myRandomName(),
                                  style: TextStyle(fontSize: 15.r),
                                  minFontSize: 9,
                                  stepGranularity: 1.5,
                                  maxFontSize: 13.5,
                                ),
                              ),
                            ),
                          )
                        ],
                        rows: [
                          DataRow(cells: [
                            const DataCell(Text("Matches")),
                            ...List.generate(
                              3,
                              (index) => DataCell(
                                Container(
                                  width: pW * 0.255,
                                  alignment: Alignment.centerLeft,
                                  //color: gridColor[index],
                                  padding: EdgeInsets.symmetric(
                                      horizontal: pW * 0.018),
                                  child: Text("kk"),
                                ),
                              ),
                            )
                          ]),
                          DataRow(cells: [
                            const DataCell(Text("Matches")),
                            ...List.generate(
                              3,
                              (index) => DataCell(
                                Container(
                                  width: pW * 0.255,
                                  alignment: Alignment.centerLeft,
                                  //color: gridColor[index],
                                  padding: EdgeInsets.symmetric(
                                      horizontal: pW * 0.018),
                                  child: Text("kk"),
                                ),
                              ),
                            )
                          ]),
                          DataRow(cells: [
                            const DataCell(Text("Matches")),
                            ...List.generate(
                              3,
                              (index) => DataCell(
                                Container(
                                  width: pW * 0.255,
                                  alignment: Alignment.centerLeft,
                                  //color: gridColor[index],
                                  padding: EdgeInsets.symmetric(
                                      horizontal: pW * 0.018),
                                  child: Text("kk"),
                                ),
                              ),
                            )
                          ]),
                        ],
                      );
                    },
                  ),
                )
                */ /*Expanded(
                  child: LayoutBuilder(
                    builder: (_, BoxConstraints constraints) {
                      final double pH = constraints.maxHeight;
                      final double pW = constraints.maxWidth;

                      return Theme(
                        data:
                            Theme.of(context).copyWith(dividerColor: charcoal),
                        child: DataTable(
                          horizontalMargin: 12.w,
                          dividerThickness: 0.6.r,
                          columnSpacing: 3.w,
                          headingRowHeight: pH * 0.18,
                          dataRowMinHeight: pH * 0.21,
                          dataRowMaxHeight: pH * 0.21,
                          headingTextStyle: TextStyle(
                            fontSize: 15.r,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            color: giantOrange,
                          ),
                          dataTextStyle: TextStyle(
                            fontSize: 15.r,
                            color: richBlack,
                            fontFamily: 'Poppins',
                          ),
                          columns: List.generate(
                            3,
                            (index) {
                              return DataColumn(
                                label: Container(
                                  color: index == 3 ? chocolateCosmos : null,
                                  width: pW * _colSize[index],
                                  child: Text(colName[index]),
                                ),
                              );
                            },
                          ),
                          rows: [
                            DataRow(
                              cells: [
                                DataCell(Container()),
                                DataCell(Container()),
                                DataCell(Container()),
                              ],
                            )
                          ],
                          */ /* */ /* rows: recentTourList.isEmpty
                              ? []
                              : List.generate(
                            recentTourList.length <= 4
                                ? recentTourList.length
                                : 4,
                                (index) {
                              final TDuration tD = recentTourList[index];
                              final bool isMe = tD.userId == fUser!.uid;
                              final MyUser? xUser =
                                  ref.watch(xUserProvider(tD.userId)).value;

                              final int myRank = bestDList.indexOf(tD.userId);
                              // final
                              return DataRow(
                                color: MaterialStatePropertyAll(
                                    isMe ? bitterSweet : null),
                                cells: [
                                  DataCell(
                                    Container(
                                      width: pW * _colSize[0],
                                      margin:
                                      EdgeInsets.only(left: pW * 0.03),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${myRank + 1}".padLeft(2, '0'),
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.r,
                                          color:
                                          isMe ? lightOrange : cardinal,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Container(
                                      width: pW * _colSize[1],
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        xUser == null ? "" : xUser.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13.2.r,
                                          color: isMe
                                              ? lightOrange
                                              : hookerGreen,
                                          fontFamily: 'Montserrat',
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                      width: pW * _colSize[2],
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          ShowPlayedDuration(
                                              tD.tDuration, isMe),
                                          ShowPlayedAt(tD.playedAt, isMe),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),*/ /* */ /*
                        ),
                      );
                    },
                  ),
                ),*/ /*
              ],
            ),
          ),
          Container(
            height: 45.h,
            width: double.maxFinite,
            color: Colors.indigo,
            child: TextButton(
              onPressed: () {},
              child: const Text("START GAME"),
            ),
          ),
        ],
      ),
    );
  }
}*/
