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

/*class EnterAvatarCodePinPut extends StatefulWidget {
  const EnterAvatarCodePinPut({super.key});

  @override
  EnterAvatarCodePinPutState createState() => EnterAvatarCodePinPutState();

  @override
  String toStringShort() => 'Rounded Filled';
}

class EnterAvatarCodePinPutState extends State<EnterAvatarCodePinPut> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    const length = 6;
    const borderColor = darkPastelGreen;
    const errorColor = chocolateCosmos;
    Color fillColor = magnolia;
    final defaultPinTheme = PinTheme(
      width: 54.r,
      height: 60.r,
      textStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 24.r,
        color: federalBlue,
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(7.5.r),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Container(
      height: 75.h,
      alignment: Alignment.centerLeft,
      //color: chocolateCosmos,
      child: Consumer(builder: (_, ref, __) {
        return Pinput(
          length: length,
          controller: controller,
          keyboardType: TextInputType.text,
          focusNode: focusNode,
          defaultPinTheme: defaultPinTheme,
          onCompleted: (pin) {
            ref.read(validateCodeProvider(pin).future).then(
                  (value) {
                debugPrint("value--$pin");
                if (value is ValidateRoom) {
                } else if (value is String) {
                  ref.read(idNotifier.notifier).state = value;
                  ref.read(joinRoomProvider.future).catchError(
                        (e, s) {
                      debugPrint("244-- $e");
                      debugPrintStack(stackTrace: s);
                    },
                  ).whenComplete(
                        () {
                      //ref.read(dPanelHeightProvider.notifier).state = 540.h;
                      //ref.read(dPanelWidgetProvider.notifier).state =
                      const HostRoom();
                    },
                  );
                }
              },
            ).onError(
                  (error, stackTrace) {
                debugPrint(error.toString());
              },
            );
          },
          focusedPinTheme: defaultPinTheme.copyWith(
            height: 75.r,
            width: 60.r,
            decoration: defaultPinTheme.decoration!.copyWith(
              border: Border.all(color: borderColor),
            ),
          ),
          errorPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              color: errorColor,
              borderRadius: BorderRadius.circular(9.r),
            ),
          ),
        );
      }),
    );
  }
}*/
