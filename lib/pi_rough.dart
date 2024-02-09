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

/*
class SettingsSlidingPanel extends StatelessWidget {
  const SettingsSlidingPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final slidingPanelTheme = SlidingPanelTheme();
    return Container(
      decoration: BoxDecoration(
        color: majorelleBlue,
        borderRadius: slidingPanelTheme.slidingPanelRadius,
      ),
      padding: slidingPanelTheme.slidingPanelPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(15.r),
          AutoSizeText(
            "Edit Profile",
            style: TextStyle(
              fontFamily: 'WendyOne',
              fontSize: 21.r,
              color: ghostWhite,
            ),
          ),
          Gap(30.r),
          const LoginTextField(),
        ],
      ),
    );
  }
}

List<String> _settings = ["Card Collection", */
/* "Game Statistics",*/ /*
 "Log Out"];

const List<String> _tileText = ['Games', 'Best Duration', 'Rank'];



class SettingsState1 extends ConsumerWidget {
  const SettingsState1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BestD? myBestD = ref.watch(myBestDProvider).value;

    return SafeArea(
      minimum: EdgeInsets.all(15.r),
      child: Column(
        children: [
          const SettingHeader(),
          Gap(24.r),
          AnimatedSwitcher(
            duration: const Duration(microseconds: 500),
            child: myBestD == null
                ? Container(
                    height: 30.h,
                    padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "Open challenge is still pending on your to-do list.",
                      style: TextStyle(
                        fontFamily: 'Cabin',
                        fontSize: 15.r,
                        fontWeight: FontWeight.w900,
                        color: cinerous,
                      ),
                      maxLines: 1,
                    ),
                  )
                : FadeIn(child: ShowBestDTile(myBestD)),
          ),
          Gap(15.r),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, int index) {
                final bool isLogOut = _settings[index] == _settings.last;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: isLogOut ? lavenderWeb : magnolia,
                    borderRadius: BorderRadius.circular(1.5.r),
                  ),
                  child: OpenContainer(
                    closedColor: magnolia,
                    closedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5.r),
                    ),
                    closedBuilder:
                        (BuildContext context, void Function() action) =>
                            ListTile(
                      onTap: isLogOut
                          ? () {
                              if (isLogOut) {
                                ref.read(signOutProvider);
                              }
                            }
                          : action,
                      dense: true,
                      leading: isLogOut
                          ? Icon(
                              FontAwesomeIcons.rightFromBracket,
                              size: 21.r,
                              color: jasper,
                            )
                          : null,
                      title: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 54.h,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _settings[index],
                          style: TextStyle(
                            fontFamily: 'WendyOne',
                            fontWeight: FontWeight.normal,
                            fontSize: 21.r,
                            color: isLogOut ? jasper : charcoal,
                          ),
                        ),
                      ),
                      trailing: SizedBox(
                        height: 30.h,
                        width: 30.w,
                        //color: Colors.amber,
                        child: Icon(
                          Icons.chevron_right,
                          color: isLogOut ? jasper : charcoal,
                        ),
                      ),
                    ),
                    openColor: magnolia,
                    openBuilder:
                        (_, void Function({Object? returnValue}) action) {
                      return isLogOut ? Container() : CardCollection(action);
                    },
                  ),
                );
              },
              separatorBuilder: (_, __) => Gap(7.5.r),
              itemCount: _settings.length,
            ),
          )
        ],
      ),
    );
  }
}

class ShowBestDTile extends ConsumerWidget {
  final BestD myBestD;

  const ShowBestDTile(this.myBestD, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(authUserProvider).value;
    final TextStyle tTheme = Theme.of(context).textTheme.titleLarge!;

    final List<String> bestDList = ref.watch(bestDListProvider).value ?? [];

    if (bestDList.isEmpty || user == null) return Container();
    final List<Widget> tileValue = [
      Text(
        "${myBestD.tCount}".padLeft(2, '0'),
        style: tTheme.copyWith(
          fontFamily: 'WendyOne',
          color: tropicalIndigo,
          fontSize: 27.r,
        ),
      ),
      AutoSizeText.rich(
        showTScore(
          myBestD.bestD,
          minute: tropicalIndigo,
          mm: periwinkle,
          tSize: 27,
          sSize: 12,
          family: 'WendyOne',
        ),
        style: tTheme.copyWith(
          fontFamily: 'WendyOne',
          color: tropicalIndigo,
          fontSize: 27.r,
        ),
      ),
      Text(
        "${bestDList.indexOf(user.uid) + 1}".padLeft(2, '0'),
        style: tTheme.copyWith(
          fontFamily: 'WendyOne',
          color: tropicalIndigo,
          fontSize: 27.r,
        ),
      ),
    ];
    return SizedBox(
      height: 90.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          3,
          (index) => AspectRatio(
            aspectRatio: index == 1 ? 1.8 : 1.05,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: magnolia,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              margin: EdgeInsets.symmetric(horizontal: 3.r),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  tileValue[index],
                  Gap(5.4.r),
                  AutoSizeText(
                    _tileText[index],
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: tropicalIndigo,
                      letterSpacing: 0,
                    ),
                    maxLines: 1,
                    minFontSize: 10.5,
                    maxFontSize: 12,
                    stepGranularity: 1.5,
                  ),
                  Gap(6.r),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/

/*
class ViewLeaderBoard extends ConsumerStatefulWidget {
  final void Function({Object? returnValue}) action;

  const ViewLeaderBoard(this.action, {super.key});

  @override
  ConsumerState createState() => _ViewLeaderBoardState();
}

class _ViewLeaderBoardState extends ConsumerState<ViewLeaderBoard> {
  Map<String, BestD> mapD = {};

*/
/*  @override
  void initState() {
    super.initState();
    setState(() {
      mapD = Map<String, BestD>.from(
        ref.watch(viewLeaderBoardProvider).value ?? {},
      );
    });
  }*/ /*


  @override
  Widget build(BuildContext context) {
    setState(() {
      mapD = ref.watch(viewLeaderBoardProvider).value ?? {};
      debugPrint(mapD.toString());
    });
    return AnimatedList(
      itemBuilder: (_, int index, Animation<double> animation) => InkWell(
        onTap: widget.action,
        child: const Text("ss"),
      ),
      initialItemCount: mapD.length,
    );
  }
}
*/

/*class ViewLeaderBoard3 extends StatelessWidget {
  final void Function({Object? returnValue}) action;

  const ViewLeaderBoard3(this.action, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      itemBuilder: (_, int index, Animation<double> animation) =>
          Text("${mockInteger(0, 4)}"),
    );
  }
}

class ViewLeaderBoard2 extends StatelessWidget {
  final void Function({Object? returnValue}) action;

  const ViewLeaderBoard2(this.action, {super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> x = List.from([1, 2, 3, 4]..shuffle());
    return ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        debugPrint("Old $oldIndex New $newIndex");
      },
      header: InkWell(
        onTap: action,
        child: const Text("This is a widget"),
      ),
      children: x
          .map(
            (e) => Text(
              "$e",
              key: ValueKey(e),
            ),
          )
          .toList(),
    );
  }
}

class ViewLeaderBoard1 extends StatelessWidget {
  final void Function({Object? returnValue}) action;

  const ViewLeaderBoard1(this.action, {super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: SlidingPanelTheme().slidingPanelPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: action,
                  icon: Icon(Icons.close),
                ),
                Text(
                  "View Leaderboard",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: caputMortuum),
                ),
              ],
            ),
            Gap(30.r),
            Expanded(
                child: SingleChildScrollView(
              child: DataTable(
                horizontalMargin: 3.r,
                dividerThickness: 0.6.r,
                columnSpacing: 3.w,
                headingRowHeight: 45.h,
                dataRowMinHeight: 54.h,
                dataRowMaxHeight: 60.h,
                headingTextStyle: TextStyle(
                  fontSize: 18.r,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: giantOrange,
                ),
                dataTextStyle: TextStyle(
                  fontSize: 18.r,
                  color: richBlack,
                  fontFamily: 'Poppins',
                ),
                columns: List.generate(
                  3,
                  (index) {
                    return DataColumn(
                      label: Container(
                        //color: gridColor[index],
                        alignment: Alignment.centerLeft,
                        //color: index == 3 ? chocolateCosmos : null,
                        width: 360.w * _colSize[index],
                        child: Text(colName[index]),
                      ),
                    );
                  },
                ),
                rows: List.generate(
                  21,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Container(
                          alignment: Alignment.centerLeft,
                          //color: gridColor[0],
                          padding: EdgeInsets.only(left: 3.r),
                          child: Text("${index + 1}"),
                        ),
                      ),
                      DataCell(
                        Container(
                          alignment: Alignment.centerLeft,
                          //color: gridColor[1],
                          padding: EdgeInsets.only(left: 3.r),
                          child: Text(
                            myRandomName(),
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.r,
                            ),
                          ),
                        ),
                      ),
                      DataCell(Container(
                        //color: xantHous,
                        alignment: Alignment.centerLeft,
                        width: 120.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText.rich(
                              showTScore(
                                Duration(
                                    milliseconds: mockInteger(100000, 999999)),
                                tSize: 16.5,
                                sSize: 12,
                                //family: 'WendyOne',
                                minute: caputMortuum,
                                mm: oldRose,
                              ),
                              maxLines: 1,
                              style: TextStyle(letterSpacing: 0.3.r),
                            )
                            //ShowPlayedAt(tD.playedAt, isMe),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                */ /* rows: recentTourList.isEmpty
                  ? []
                  : List.generate(
                      recentTourList.length <= 4 ? recentTourList.length : 4,
                      (index) {
                        final TDuration tD = recentTourList[index];
                        final bool isMe = tD.userId == fUser!.uid;
                        final MyUser? xUser =
                            ref.watch(xUserProvider(tD.userId)).value;

                        final int myRank = bestDList.indexOf(tD.userId);
                        // final
                        return DataRow(
                          color:
                              MaterialStatePropertyAll(isMe ? bitterSweet : null),
                          cells: [
                            DataCell(
                              Container(
                                width: pW * _colSize[0],
                                margin: EdgeInsets.only(left: pW * 0.03),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${myRank + 1}".padLeft(2, '0'),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.r,
                                    color: isMe ? lightOrange : cardinal,
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
                                    color: isMe ? lightOrange : hookerGreen,
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
                                    ShowPlayedDuration(tD.tDuration, isMe),
                                    ShowPlayedAt(tD.playedAt, isMe),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),*/ /*
              ),
            )),
          ],
        ),
      );
}*/

/* AnimatedDefaultTextStyle(
                style: tTheme.copyWith(
                  color: violetBlue,
                  fontSize: 30.r,
                  fontFamily: 'WendyOne',
                  height: 0,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w700,
                  //  fontWeight: FontWeight.w700,
                ),
                duration: const Duration(milliseconds: 500),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: AutoSizeText.rich(
                    TextSpan(children: [TextSpan(text: name)]),
                    key: ValueKey(name),
                    maxLines: 1,
                    minFontSize: 21,
                    maxFontSize: 36,
                    stepGranularity: 3,
                  ),
                ),
              ),
              Gap(7.5.r),
              AnimatedEmoji(
                AnimatedEmojis.smileWithBigEyes,
                size: 30.r,
                repeat: true,
                animate: true,
                onLoaded: (duration) {},
                errorWidget: Icon(FontAwesomeIcons.faceSmile, size: 30.r),
              ),*/

/*
final btnClickProvider = FutureProvider.family.autoDispose<bool, String>(
  (ref, _icon) async {
    final boardDatabase = ref.read(boardDatabaseProvider);
    final notifier = ref.read(onlineBoardNotifier);
    final firebaseUser = ref.read(firebaseUserProvider!);

    final board = ref.read(boardProvider).data!.value;
    final iconsID = board.icons;

    final String color = notifier.myPlayer!.color;

    await boardDatabase.setIconCheck(_icon, true);
    notifier.alreadyClicked = !notifier.alreadyClicked;

    if (!notifier.alreadyClicked) {
      final List<LocalIcon> selectedIcons = notifier.icons
          .where((element) => element.isCheck && !element.isFound)
          .toList(growable: false);

      if (selectedIcons.length == 2) {
        final bool sameIcons =
            selectedIcons.first.checkIconCode(selectedIcons.last);
        bool _validate = false;

        if (notifier.type == GameType.orderWise) {
          if (sameIcons) {
            final String orderWiseIcon =
                await ref.read(currentIconProvider.last);
            if (orderWiseIcon.isEmpty) {
              _validate = sameIcons;
            } else {
              _validate = selectedIcons.first.iconCode == orderWiseIcon;
            }
          } else {
            _validate = false;
          }
        } else {
          _validate = sameIcons;
        }

        if (_validate) {
          await boardDatabase.increment(firebaseUser.uid);

          await Future.wait(
            selectedIcons.map(
              (e) {
                final updatedIcon =
                    e.copyWith(color: color, isFound: true, isCheck: false);
                return boardDatabase.updateIcon(
                    iconsID[e.iconNo! - 1], updatedIcon);
              },
            ),
          );

          if (notifier.type == GameType.orderWise) {
            if (notifier.orderWiseIcon) {
              await boardDatabase.setCurrentIcon("");
              notifier.orderWiseIcon = false;
            }
          }
        } else {
          final List<int> iconOrder = selectedIcons.map(
            (e) {
              final int i = e.iconNo! - 1;
              return i;
            },
          ).toList(growable: false);
          await Future.delayed(
            DurationCount.m500,
            () => Future.wait(
              iconOrder.map(
                (e) => boardDatabase.setIconCheck(iconsID[e], false),
              ),
            ),
          );
          if (notifier.type == GameType.orderWise) {
            if (!notifier.orderWiseIcon) {
              final List<LocalIcon> falseIcons = notifier.icons
                  .where((element) => !element.isCheck && !element.isFound)
                  .toList(growable: false);
              final String newOrderWiseIcon =
                  falseIcons[Random.secure().nextInt(falseIcons.length)]
                      .iconCode;
              await boardDatabase.setCurrentIcon(newOrderWiseIcon);
              notifier.orderWiseIcon = true;
            }
          }
          await ref.read(nextPlayerProvider.future);
        }
      } else if (selectedIcons.length > 2) {
        FirebaseCrashlytics.instance.recordError(
          "Exceeded Selected Icons",
          null,
          reason: 'BtnCLick Provider issue',
          fatal: false,
        );
        */
/*FirebaseCrashlytics.instance
            .log("Selected icons are more than ${selectedIcons.length}");*/ /*

        final List<int> iconOrder = selectedIcons.map(
          (e) {
            final int i = e.iconNo! - 1;
            return i;
          },
        ).toList(growable: false);

        Future.wait(
          [
            ...iconOrder.map(
              (e) => boardDatabase.setIconCheck(iconsID[e], false),
            ),
            ref.read(nextPlayerProvider.future)
          ],
        );
      }
      return true;
    } else
      return false;
  },
);

final AutoDisposeFutureProvider nextPlayerProvider = FutureProvider.autoDispose(
  (ref) async {
    final boardDatabase = ref.read(boardDatabaseProvider);
    final boardNotifier = ref.read(onlineBoardNotifier);
    final firebaseUser = ref.read(firebaseUserProvider!);

    final board = ref.read(boardProvider).data!.value;
    final List<String> playersID = List.castFrom(board.players);
    final players = boardNotifier.players;
    if (players.length != 1) {
      int i = boardNotifier.currentIndex.toInt();
      do {
        i++;
        if (i == players.length) i = 0;
      } while (!players[i.toInt()].isActive);
      if (playersID[i] != firebaseUser.uid)
        await boardDatabase.setCurrentID(playersID[i]);
    }
  },
);
*/

/*final StateNotifierProvider<DPanelOption, Widget> dPanelWidgetProvider =
    StateNotifierProvider<DPanelOption, Widget>(
  (_) => DPanelOption(),
);

class DPanelOption extends StateNotifier<Widget> {
  DPanelOption() : super(Container());

  @override
  set state(Widget value) => super.state = value;
}*/

//=============================================

/*final StateNotifierProvider<DPanelHeight, double> dPanelHeightProvider =
    StateNotifierProvider<DPanelHeight, double>(
  (_) => DPanelHeight(),
);

class DPanelHeight extends StateNotifier<double> {
  DPanelHeight() : super(300.h);

  @override
  set state(double value) => super.state = value;
}*/

/*class DSubtitle1 extends ConsumerWidget {
  final MyUser myUser;
  const DSubtitle1(this.myUser, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? fUser = ref.watch(authUserProvider).value;

    return StaggeredGridTile.fit(
      crossAxisCellCount: 20,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        alignment: Alignment.centerLeft,
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            fontSize: 12.r,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 3.r,
            color: tropicalIndigo,
          ),
          textAlign: TextAlign.start,
          duration: const Duration(milliseconds: 300),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: myUser.avatar == null
                ? AutoSizeText.rich(
                    TextSpan(
                      children: [
                        ...[
                          TextSpan(text: ref.read(welcomeSubtitleProvider)),
                          TextSpan(
                            text: "click here",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  ref.read(setCardAvatarProvider(fUser!.uid)),
                            style: const TextStyle(color: darkPastelGreen),
                          ),
                        ],
                      ],
                    ),
                    maxLines: 2,
                    minFontSize: 6,
                    maxFontSize: 15,
                  )
                : AutoSizeText(
                    ref.read(goodDayProvider),
                    maxLines: 1,
                    style: const TextStyle(letterSpacing: 0),
                    minFontSize: 9,
                    maxFontSize: 12,
                  ),
          ),
        ),
      ),
    );
  }
}
*/

/*SingleChildScrollView(
                child: DataTable(
                  horizontalMargin: 7.5.r,
                  headingRowHeight: 48.h,
                  dataRowMinHeight: 45.h,
                  dataRowMaxHeight: 45.h,
                  columnSpacing: 1.5.r,
                  columns: [
                    DataColumn(
                      label: Container(
                        width: 30.w,
                        alignment: Alignment.center,
                        child: Text("${mockInteger(1, 3)}."),
                      ),
                    ),
                    DataColumn(
                      label: Container(
                        width: 120.w,
                        padding: EdgeInsets.only(left: 3.r),
                        alignment: Alignment.centerLeft,
                        child: Text(myRandomName()),
                      ),
                    ),
                    DataColumn(
                      label: Container(
                        width: 180.w,
                        alignment: Alignment.centerLeft,
                        child: Text("${mockInteger(10, 20)}"),
                      ),
                    ),
                  ],
                  headingTextStyle:
                      TextStyle(fontSize: 15.r, fontFamily: 'Montserrat'),
                  dataTextStyle:
                      TextStyle(fontSize: 15.r, fontFamily: 'Montserrat'),
                  rows: List.generate(
                      2,
                      (index) => DataRow(
                            cells: [
                              DataCell(
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${mockInteger(1, 3)}.",
                                  ),
                                ),
                              ),
                              DataCell(Text(myRandomName())),
                              DataCell(
                                Text(mockInteger(10, 20).toString()),
                              ),
                            ],
                          )),
                ),
              )*/

/*class ResultScoreBoard extends StatelessWidget {
  const ResultScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7.5.r),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          2,
          (index) => FadeInRight(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: gridColor[index],
              // color: xColor[List.from(room.players.keys).indexOf(id)],
              width: 330.w / 2,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    //bottom: map.containsKey('avatar') ? -10.5.h : 7.5.h,
                    bottom: -10.5.h,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: 1 == 1
                          ? FadeInUp(
                              child: RandomAvatar(
                                mockString(),
                                trBackground: true,
                                height: 360.w * 0.27,
                              ),
                            )
                          : Text(
                              myRandomName(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                    ),
                  ),
                  Positioned(
                    top: 1.5.r,
                    left: 7.5.r,
                    height: 72.h,
                    width: 105.w,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: Container(
                        height: 40.5.h,
                        alignment: Alignment.bottomLeft,
                        child: AutoSizeText(
                          "${mockInteger(10, 20)}",
                          style: TextStyle(
                              fontFamily: 'Montserrat', fontSize: 21.r),
                        ),
                      ),
                      subtitle: Container(
                        height: 18.h,
                        alignment: Alignment.topLeft,
                        child: Text(
                          myRandomName(),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: federalBlue),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/

/* child: ListView(
        padding: pTheme.slidingPanelPadding,
        children: [
          ListTile(
            dense: true,
            tileColor: xantHous,
            horizontalTitleGap: 0,
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.zero,
            leading: AnimatedFlipCounter(
              value: mockInteger(111111, 999999),
              wholeDigits: 6,
              duration: const Duration(milliseconds: 1200),
              textStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 30.r,
                color: federalBlue,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.r,
              ),
            ),
            trailing: SizedBox(
              width: 90.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: IconButton(
                      icon: Icon(Icons.close, size: 27.r, color: gray),
                      onPressed: () =>
                          ref.read(leaveRoomProvider.future).whenComplete(
                                () => ref.read(idNotifier.notifier).empty(),
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (1 != 2) ...[
            FadeIn(
              child: AutoSizeText(
                "Easy | Normal",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.r,
                  height: 2.1.r,
                  fontWeight: FontWeight.normal,
                  color: federalBlue,
                ),
                maxFontSize: 15,
                minFontSize: 9,
                maxLines: 1,
              ),
            ),
            Gap(24.r),
            FadeIn(
              child: Container(
                height: 180.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: lavenderWeb,
                  borderRadius: BorderRadius.circular(7.5.r),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                          "Winner: ${myRandomName()} - ${mockInteger(10, 20)}"),
                    ),
                    Positioned(
                      bottom: 7.5.r,
                      left: 7.5.r,
                      child: Text(
                        "${myRandomName()} - ${mockInteger(10, 20)}",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 15.r, color: federalBlue),
                      ),
                    ),
                    Positioned(
                      bottom: 7.5.r,
                      right: 7.5.r,
                      child: Text(
                        "${myRandomName()} (You) - ${mockInteger(10, 20)}",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 15.r, color: federalBlue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(30.r),
          ],
          ...[
            Container(
              height: 60.h,
              //color: cornellRed,
            )
          ],
        ],
      ),*/

/*final AutoDisposeFutureProviderFamily<void, String> addFriendProvider =
    FutureProvider.autoDispose.family<void, String>(
  (ref, id) async {
    final userDatastore = ref.read(userDatastoreProvider);
    return userDatastore.addFriend(id);
  },
);*/

/*final AutoDisposeFutureProviderFamily validateAvatarCodeProvider =
    FutureProvider.autoDispose.family<dynamic, String>(
  (ref, code) async {
    final userDatastore = ref.read(userDatastoreProvider);
    final String? validUser = await userDatastore.validUser(code);
    if (validUser == null) {
      debugPrint("38-- No validUser");
      return false;
    } else {
      debugPrint("40--validUser $validUser");
      final List<String> otherUserAvatarArr =
          await ref.watch(myUserAvatarListProvider(validUser).future);
      debugPrint("44--otherUserAvatarArr $otherUserAvatarArr");
      final List<String> allCards =
          await ref.read(avatarCollectionProvider.future);

      final List<String> remainingCards =
          allCards.toSet().difference(otherUserAvatarArr.toSet()).toList();

      final String newCard = remainingCards.isEmpty
          ? mockString(16)
          : remainingCards[mockInteger(0, remainingCards.length - 1)];

      final userDatastore = ref.read(userDatastoreProvider);
      userDatastore.newAvatar(validUser, newCard);
      return validUser;
    }
  },
);*/

/*final StreamProvider<MyDuration?> myUserDurationProvider =
    StreamProvider<MyDuration?>(
  (ref) {
    final userDatastore = ref.read(userDatastoreProvider);
    return userDatastore.myUserDuration;
  },
);*/

/*final recentUserCollectionReferenceProvider =
    Provider.autoDispose<Query<PUser>>(
  (ref) {
    final datastore = ref.watch(userDatastoreProvider);
    return datastore.recentUserCollection;
  },
);

final AutoDisposeProvider<CollectionReference<PUser>>
    bestDurationCollReferenceProvider = Provider.autoDispose(
  (ref) {
    final datastore = ref.watch(userDatastoreProvider);
    return datastore.bestDurationColl;
  },
);*/

/*class EnterAvatarCode1 extends ConsumerWidget {
  const EnterAvatarCode1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    return myUser == null
        ? Container()
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "🎁 Gift your friends, a new avatars 😍",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(height: 1.8.r, color: cinerous),
                        maxLines: 2,
                      ),
                      //Gap(6.r),
                      AutoSizeText(
                        "Enter their code below "
                        "and present them with new avatars.",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: cinerous),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  margin: EdgeInsets.symmetric(vertical: 24.r),
                  height: 48.r,
                  decoration: BoxDecoration(
                    color: cinerous,
                    borderRadius: BorderRadius.circular(7.5.r),
                  ),
                  child: InkWell(
                    onTap: () => showGeneralDialog(
                      barrierColor: Colors.black.withOpacity(0.72),
                      transitionBuilder: (_, x, ___, __) => Transform.scale(
                        scale: x.value,
                        child: Opacity(
                          opacity: x.value,
                          child: AlertDialog(
                            backgroundColor: chocolateCosmos,
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.5.r),
                              borderSide: const BorderSide(
                                  width: 0, color: chocolateCosmos),
                            ),
                            title: const Text(
                              'Enter the avatar code',
                              style: TextStyle(
                                  fontFamily: 'WendyOne', color: xantHous),
                            ),
                            insetPadding:
                                EdgeInsets.symmetric(horizontal: 7.5.w),
                            content: AnimatedContainer(
                              color: chocolateCosmos,
                              duration: const Duration(milliseconds: 500),
                              height: 72.h,
                              // color: cinerous.withOpacity(0.15),
                              padding: EdgeInsets.symmetric(
                                horizontal: 3.w,
                                vertical: 3.h,
                              ),
                              alignment: Alignment.bottomCenter,
                              //child: const EnterAvatarCodePinPut(),
                              child: Container(),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "SHARE NOW",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: ghostWhite,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      transitionDuration: const Duration(milliseconds: 200),
                      barrierDismissible: true,
                      barrierLabel: '',
                      context: context,
                      pageBuilder: (_, animation1, animation2) => Container(),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.5.r),
                      child: Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            width: 225.w,
                            color: wheat,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: AutoSizeText.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(text: "Your code - "),
                                  TextSpan(
                                    text: myUser.avatarCode,
                                    style:
                                        const TextStyle(color: chocolateCosmos),
                                  ),
                                ],
                              ),
                              style: TextStyle(
                                fontSize: 12.r,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Poppins',
                                color: cinerous,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "ENTER CODE",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15.r,
                                  color: ghostWhite,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}*/

/*import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../my_widget/login_option_button.dart';
import '../theme/my_color.dart';

class CardCollection extends ConsumerWidget {
  final Function({Object? returnValue}) action;

  const CardCollection(this.action, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextStyle tTheme = Theme.of(context).textTheme.titleLarge!;
    final TextStyle sTheme = Theme.of(context).textTheme.bodyLarge!;
    final MyUser? myUser = ref.watch(myUserProvider).value;
    return SafeArea(
      minimum: EdgeInsets.only(top: 15.h, left: 1.5.w, right: 1.5.w),
      child: Container(
        color: magnolia,
        padding: EdgeInsets.only(top: 15.h, left: 9.w, right: 9.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Card Collection",
                  style: tTheme.copyWith(
                    fontFamily: "WendyOne",
                    fontSize: 36.r,
                    height: 1.8.r,
                    color: cinerous,
                  ),
                ),
                IconButton(
                  onPressed: action,
                  icon: Icon(
                    Icons.close,
                    size: 21.r,
                  ),
                ),
              ],
            ),
            Text(
              "Increase your avatar collection by encouraging your "
              "friends and family to use the code above.",
              style: sTheme.copyWith(
                height: 2.1.r,
                fontSize: 15.r,
                color: cinerous,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: EdgeInsets.symmetric(vertical: 15.h),
              height: 51.h,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 225.w,
                    margin: EdgeInsets.only(right: 15.w),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: magnolia,
                      borderRadius: BorderRadius.circular(7.5.r),
                      border: Border.all(width: 0.12.r, color: federalBlue),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          myUser!.avatarCode == null
                              ? "Hold on.."
                              : myUser.avatarCode!.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            letterSpacing: 0.3.r,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.r,
                            color: vanDyke,
                          ),
                        ),
                        Icon(
                          Icons.copy,
                          size: 20.1.r,
                          color: cinerous,
                        )
                      ],
                    ),
                  ),
                  LoginOptionButton(
                    bColor: majorelleBlue,
                    lChild: Icon(Icons.share, size: 20.1.r),
                    optionBtnPressed: () {},
                    borderWidth: 0.75,
                  )
                ],
              ),
            ),
            Gap(15.r),
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 4.5.r,
                crossAxisSpacing: 3.r,
                itemBuilder: (_, index) {
                  final bool currentAvatar =
                      (myUser.avatar ?? "") == myUser.avatarArr[index];
                  return FadeIn(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: (mockInteger(14, 15)) * 0.96 * 12.h,
                      decoration: BoxDecoration(
                        color: currentAvatar
                            ? majorelleBlue
                            : gridColor[mockInteger(0, 2)],
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                      child: LayoutBuilder(
                        builder: (_, BoxConstraints constraints) => Stack(
                          children: [
                            AnimatedPositioned(
                              duration: const Duration(milliseconds: 500),
                              top: 0,
                              bottom: -constraints.maxHeight * 0.81,
                              left: 0,
                              right: 0,
                              child: badges.Badge(
                                showBadge: currentAvatar,
                                badgeContent: Icon(
                                  FontAwesomeIcons.check,
                                  size: 18.r,
                                  color: ghostWhite,
                                ),
                                position: badges.BadgePosition.topEnd(
                                  top: 6.r,
                                  end: 6.r,
                                ),
                                badgeStyle: badges.BadgeStyle(
                                  badgeColor: darkPastelGreen,
                                  shape: badges.BadgeShape.circle,
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: RandomAvatar(
                                  myUser.avatarArr[index],
                                  trBackground: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: myUser.avatarArr.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

/*import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/my_names.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../theme/my_color.dart';
import '../theme/my_theme.dart';

class EnterAvatarCodeOpenBuilder extends StatelessWidget {
  final void Function({Object? returnValue}) action;
  const EnterAvatarCodeOpenBuilder(this.action, {super.key});

  @override
  Widget build(BuildContext context) {
    final pTheme = SlidingPanelTheme();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /* Text(
          "Click here to enter code",
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 15.r),
        ),*/
        SizedBox(
          height: 600.h,
          child: ListView(
            padding: pTheme.slidingPanelPadding,
            children: List.generate(
              12,
              (index) => Container(
                height: 45.h,
                margin: EdgeInsets.symmetric(vertical: 1.5.r),
                color: gridColor[mockInteger(0, 2)].withOpacity(0.03),
                alignment: Alignment.centerLeft,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 7.5.r),
                  leadingAndTrailingTextStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    color: gray,
                    fontSize: 12.r,
                  ),
                  leading: Container(
                    constraints: BoxConstraints.tight(Size(63.w, 30.h)),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          size: 15.r,
                          color: drabDarkBrown,
                        ),
                        Gap(4.5.r),
                        AutoSizeText(
                          "${mockInteger(1, 12).toString().padLeft(2, '0')}: ${mockInteger(1, 59).toString().padLeft(2, '0')} PM",
                          stepGranularity: 1.5,
                          minFontSize: 6,
                          maxFontSize: 9,
                        ),
                      ],
                    ),
                  ),
                  titleTextStyle: TextStyle(
                    fontSize: 9.r,
                    fontFamily: 'Montserrat',
                    color: federalBlue,
                    fontWeight: FontWeight.normal,
                  ),
                  title: Container(
                    margin: EdgeInsets.only(bottom: 12.r),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 12.r,
                          child: RandomAvatar(mockString()),
                        ),
                        Gap(9.r),
                        AutoSizeText(myRandomName(), minFontSize: 9),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 21.r),
                          child: const Icon(
                            Icons.arrow_right_alt,
                            color: gray,
                          ),
                        ),
                        CircleAvatar(
                          radius: 12.r,
                          child: RandomAvatar(mockString()),
                        ),
                        Gap(9.r),
                        AutoSizeText(myRandomName(), minFontSize: 9),
                      ],
                    ),
                  ),
                  /*subtitle: Padding(
                    padding: EdgeInsets.only(left: 1.5.w),
                    child: Text("Sharing new avatar to ${myRandomName()}"),
                  ),*/
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 210.h,
          color: cornellRed,
          child: Column(
            children: [
              Container(
                color: federalBlue,
                height: 60.h,
              ),
              Expanded(
                child: GridView.custom(
                  //scrollDirection: Axis.horizontal,
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 6,
                    mainAxisSpacing: 1.5.r,
                    crossAxisSpacing: 1.5.r,
                    pattern: [
                      const WovenGridTile(1, crossAxisRatio: 0.9),
                      const WovenGridTile(1, crossAxisRatio: 0.9),
                      const WovenGridTile(1),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (_, index) => Card(
                      margin: EdgeInsets.all(3.r),
                      elevation: 3.r,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.2.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4.5.r),
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                color: [
                                  ...gridColorDark,
                                  ...gridColor
                                ][mockInteger(0, 5)],
                                child: Stack(
                                  children: [],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      //padding: EdgeInsets.all(3.r),
                    ),
                    childCount: 12,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class EnterAvatarCodeOpenBuilder1 extends StatelessWidget {
  final void Function({Object? returnValue}) action;
  const EnterAvatarCodeOpenBuilder1(this.action, {super.key});

  @override
  Widget build(BuildContext context) {
    final pTheme = SlidingPanelTheme();

    return SlidingUpPanel(
      //padding: pTheme.slidingPanelPadding,
      body: const EnterAvatarCodeBody(),
      borderRadius: pTheme.slidingPanelRadius,
      panel: const EnterAvatarCodePanel(),
      minHeight: 0,
    );
  }
}

class EnterAvatarCodeBody extends StatelessWidget {
  const EnterAvatarCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final pTheme = SlidingPanelTheme();
    return SafeArea(
      minimum: pTheme.slidingPanelPadding,
      child: Column(
        children: [
          //Container(height: 150.h),
          Gap(60.r),
          const AvatarTextField(),
          Gap(30.r),
          // Divider(height: 60.r, thickness: 0.3.r),
          SizedBox(
            height: 450.h,
            //color: cornellRed,
            child: ListView(
              children: List.generate(
                6,
                (index) => Container(
                  height: 42.h,
                  //padding: EdgeInsets.symmetric(vertical: 15.r),
                  margin: EdgeInsets.symmetric(vertical: 4.5.r),
                  color: gridColor[mockInteger(0, 2)].withOpacity(0.03),
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.r),
                    titleTextStyle: TextStyle(
                      fontSize: 9.r,
                      fontFamily: 'Montserrat',
                      color: federalBlue,
                      fontWeight: FontWeight.normal,
                    ),
                    title: Container(
                      margin: EdgeInsets.only(bottom: 12.r),
                      child: Row(
                        children: [
                          Icon(Icons.timer_outlined,
                              size: 18.r, color: drabDarkBrown),
                          Gap(7.5.r),
                          const Text(
                            "9:30 PM",
                            style: TextStyle(fontFamily: 'Montserrat'),
                          ),
                          Gap(30.r),
                          CircleAvatar(
                            radius: 12.r,
                            child: RandomAvatar(mockString()),
                          ),
                          Gap(12.r),
                          AutoSizeText(
                            myRandomName(),
                            minFontSize: 10,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.r),
                            child: const Icon(Icons.arrow_right_alt),
                          ),
                          CircleAvatar(
                            radius: 12.r,
                            child: RandomAvatar(mockString()),
                          ),
                          Gap(12.r),
                          AutoSizeText(
                            myRandomName(),
                            minFontSize: 10,
                          ),
                        ],
                      ),
                    ),
                    /*subtitle: Padding(
                      padding: EdgeInsets.only(left: 1.5.w),
                      child: Text("Sharing new avatar to ${myRandomName()}"),
                    ),*/
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

class AvatarTextField extends ConsumerStatefulWidget {
  const AvatarTextField({super.key});

  @override
  ConsumerState createState() => _AvatarTextFieldState();
}

class _AvatarTextFieldState extends ConsumerState<AvatarTextField> {
  final tController = TextEditingController();
  final pTheme = SlidingPanelTheme();

  @override
  void initState() {
    super.initState();
    tController.addListener(
      () {
        debugPrint("77--");
        debugPrint(tController.text);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    tController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.r,
      child: Container(
        decoration: BoxDecoration(
          color: ghostWhite,
          //border: Border.all(color: gray, width: 0.3.r),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Column(
            children: [
              Gap(15.r),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.r),
                child: TextFormField(
                  maxLines: 1,
                  maxLength: 6,
                  showCursor: false,
                  controller: tController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.none,
                  style: TextStyle(
                      fontSize: 24.r, height: 1.5.r, letterSpacing: 7.5.r),
                  decoration: InputDecoration(
                    hintText: 'Enter the avatar code here to share',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 0,
                      fontSize: 15.r,
                      color: gray,
                      fontWeight: FontWeight.w300,
                    ),
                    counterStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color: gray,
                      letterSpacing: 1.5.r,
                    ),
                    isDense: true,
                    isCollapsed: false,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                color: tropicalIndigo,
                child: StaggeredGrid.count(
                  crossAxisCount: 5,
                  mainAxisSpacing: 1.5.r,
                  crossAxisSpacing: 1.5.r,
                  children: [
                    ...List.generate(
                      9,
                      (index) => StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: magnolia,
                            borderRadius: BorderRadius.circular(3.6.r),
                          ),
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () => tController.text += emojiArr[index],
                            child: Text(
                              emojiArr[index],
                              style: TextStyle(fontSize: 24.r),
                            ),
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: Container(
                        color: lavenderWeb,
                        child: InkWell(
                          onTap: () {
                            if (tController.text.isNotEmpty) {
                              tController.text = "";
                            } else {
                              Navigator.of(context).pop();
                            }
                          },
                          child: Icon(Icons.backspace, size: 24.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EnterAvatarCodePanel extends StatelessWidget {
  const EnterAvatarCodePanel({super.key});

  @override
  Widget build(BuildContext context) {
    final pTheme = SlidingPanelTheme();
    final tTheme = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: pTheme.slidingPanelRadius,
      child: Container(
        color: beige,
        padding: pTheme.slidingPanelPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(15.r),
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Text(
                "My Card Collection",
                style: tTheme.bodyMedium!.copyWith(
                  height: 1.8.r,
                  color: federalBlue,
                  //fontFamily: 'LuckiestGuy',
                  fontSize: 30.r,
                  letterSpacing: 0.3.r,
                ),
                maxLines: 2,
              ),
            ),
            Gap(30.r),
            Expanded(
              child: GridView.custom(
                gridDelegate: SliverWovenGridDelegate.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1.5.r,
                  crossAxisSpacing: 1.5.r,
                  pattern: [
                    //const WovenGridTile(1, crossAxisRatio: 0.9),
                    const WovenGridTile(
                      5 / 6,
                      crossAxisRatio: 0.9,
                      alignment: AlignmentDirectional.centerEnd,
                    ),
                    //const WovenGridTile(1, crossAxisRatio: 0.9),
                    const WovenGridTile(
                      7 / 9,
                      crossAxisRatio: 0.9,
                      alignment: AlignmentDirectional.centerEnd,
                    ),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  (_, index) => Card(
                    margin: EdgeInsets.all(3.r),
                    elevation: 3.r,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.2.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.5.r),
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              color: [
                                ...gridColorDark,
                                ...gridColor
                              ][mockInteger(0, 5)],
                              child: Stack(
                                children: [
                                  Positioned(
                                    width: 105.r,
                                    height: 105.r,
                                    bottom: -9.r,
                                    child: RandomAvatar(
                                      mockString(),
                                      trBackground: true,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    //padding: EdgeInsets.all(3.r),
                  ),
                  childCount: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

/*@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize screenSize = ref.read(sizeProvider);
    final bool isPhone = screenSize == ScreenSize.phone;
    final SlidingPanelTheme slidingPanelTheme = SlidingPanelTheme();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: majorelleBlue,
        titleSpacing: 0,
        iconTheme: IconThemeData(color: ghostWhite, size: 24.r),
        centerTitle: false,
        toolbarHeight: 75.h,
        titleTextStyle: TextStyle(
          fontFamily: 'WendyOne',
          fontSize: 24.r,
          letterSpacing: 0.3.r,
        ),
        title: const AutoSizeText(
          "Settings",
          style: TextStyle(color: ghostWhite),
        ),
      ),
      backgroundColor: ghostWhite,
      body: SlidingUpPanel(
        controller: ref.watch(settingPanelProvider),
        minHeight: 0.h,
        maxHeight: 300.h,
        borderRadius: slidingPanelTheme.slidingPanelRadius,
        backdropEnabled: true,
        panel: Container(),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: !isPhone ? Container() : const SettingsState(),
        ),
      ),
    );
  }
}

class SettingsState extends ConsumerWidget {
  const SettingsState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tTheme = Theme.of(context).textTheme;
    final pTheme = SlidingPanelTheme();
    final MyUser? myUser = ref.watch(myUserProvider).value;
    return SafeArea(
      minimum: pTheme.slidingPanelPadding,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: myUser == null
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(15.r),
                  AspectRatio(
                    aspectRatio: 2.1,
                    child: SlideInLeft(
                      child: FadeIn(
                        child: Card(
                          color: magnolia,
                          // color: cornellRed,
                          child: Padding(
                            padding: pTheme.slidingPanelPadding,
                            child: GridTile(
                              header: Center(
                                child: AutoSizeText(
                                  "Earn your first avatar",
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: richBlack,
                                    fontSize: 21.r,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Lottie.asset(
                                  'lottie/b_male_01.json',
                                  width: 210.r,
                                  onLoaded: (composition) {
                                    debugPrint("93--");
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(15.r),
                  SizedBox(
                    // color: cornellRed,
                    height: 60.h,
                    child: ListTile(
                      iconColor: jasper,
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 7.5.r,
                      dense: true,
                      onTap: () {
                        ref.read(setActiveProvider(false));
                        ref.read(signOutProvider);
                      },
                      leading: Icon(Icons.logout, size: 21.r),
                      title: Container(
                        height: 45.h,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Log Out",
                          style: tTheme.bodySmall!.copyWith(
                            fontSize: 21.r,
                            fontWeight: FontWeight.w700,
                            color: jasper,
                          ),
                        ),
                      ),
                      trailing:
                          Icon(Icons.chevron_right, color: jasper, size: 30.r),
                    ),
                  ),
                  ref.watch(packageInfoProvider).maybeWhen(
                        orElse: () => Container(),
                        data: (app) => Text(
                          "Version ${app.version} (${app.buildNumber})",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: gray,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.r,
                                  ),
                        ),
                      ),
                ],
              ),
      ),
    );
  }
}*/

/*import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/panel_provider.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/auth_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

class SettingHeader extends ConsumerWidget {
  const SettingHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser myUser = ref.watch(myUserProvider).value!;
    final User? user = ref.watch(authUserProvider).value;

    final TextStyle tTheme = Theme.of(context).textTheme.titleLarge!;
    final TextStyle sTheme = Theme.of(context).textTheme.bodyLarge!;

    final PanelController controller = ref.watch(settingPanelProvider);
    if (user == null) return Container();
    return Card(
      margin: EdgeInsets.zero,
      elevation: 3.r,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 150.h,
        decoration: BoxDecoration(
          color: magnolia,
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        padding: EdgeInsets.all(7.5.r),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 45.r,
                    child: myUser.avatar == null
                        ? Text(
                            myUser.name.substring(0, 2).toUpperCase(),
                            style: tTheme.copyWith(
                              fontFamily: 'WendyOne',
                              letterSpacing: 0,
                            ),
                          )
                        : RandomAvatar(myUser.avatar ?? mockString(2)),
                  ),
                  Gap(15.r),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 2,
                          child: AutoSizeText(
                            myUser.name,
                            style: tTheme.copyWith(
                              fontFamily: 'WendyOne',
                              color: charcoal,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              AutoSizeText(
                                user?.email ?? "Anonymous User",
                                style: sTheme.copyWith(color: tropicalIndigo),
                                minFontSize: 10.5,
                                stepGranularity: 1.5,
                                maxFontSize: 15,
                                maxLines: 1,
                              ),
                              VerticalDivider(
                                thickness: .9.r,
                                color: majorelleBlue,
                                indent: 1.5.r,
                                endIndent: 1.5.r,
                              ),
                              AutoSizeText(
                                DateFormat.yMMMMd('en_US')
                                    .format(user!.metadata.creationTime!),
                                style: sTheme.copyWith(
                                  color: tropicalIndigo,
                                  fontSize: 9.r,
                                ),
                                minFontSize: 10.5,
                                stepGranularity: 1.5,
                                maxFontSize: 15,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: tropicalIndigo,
              thickness: 0.45.r,
              height: 24.h,
              indent: 7.5.w,
              endIndent: 7.5.w,
            ),
            Flexible(
              child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.only(left: 15.r),
                  ),
                  minimumSize: MaterialStatePropertyAll(
                    Size.fromWidth(120.w),
                  ),
                ),
                onPressed: () {
                  debugPrint("133-");
                  if (controller.isPanelClosed) {
                    controller.open();
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.userPen,
                      size: 21.r,
                      color: federalBlue,
                    ),
                    Gap(15.r),
                    Text(
                      "Edit profile",
                      style: TextStyle(
                        fontFamily: 'Cabin',
                        fontSize: 15.r,
                        color: federalBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

/* Positioned(
                  left: 0.r,
                  right: 120.r,
                  child: AutoSizeText(
                    "Congratulations ${winners.fold("", (previousValue, x) => "$previousValue${x.name}")} !!",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ghostWhite,
                      fontFamily: 'WendyOne',
                      fontSize: 21.r,
                      fontWeight: FontWeight.normal,
                    ),
                    maxLines: 1,
                  ),
                ),*/

/* Align(
                  alignment: Alignment.bottomCenter,
                  child: Lottie.asset(
                    'lottie/trophy.json',
                    width: 90.r,
                    height: 90.r,
                    fit: BoxFit.fill,
                  ),
                )*/

/*AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            decoration:
                                const BoxDecoration(color: drabDarkBrown),
                            alignment: Alignment.center,
                            width: 150.w,
                            padding: EdgeInsets.symmetric(horizontal: 4.5.w),
                            child: InkWell(
                              onTap: action,
                              child: AutoSizeText(
                                "SHARE WITH FRIENDS",
                                style: tTheme.bodySmall!.copyWith(
                                  fontSize: 13.5.r,
                                  color: ghostWhite,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxFontSize: 15,
                                minFontSize: 9,
                                maxLines: 1,
                              ),
                            ),
                          )*/
/*OpenContainer(
                  tappable: false,
                  closedBuilder: (_, void Function() action) => Container(
                    height: 54.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.5.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.5.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              key: ValueKey(myUser.avatarCode),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: animatedEmojiList,
                              ),
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 1,
                            child: InkWell(
                              onTap: action,
                              child: Icon(Icons.group, size: 30.r),
                            ),
                          )
                          */ /*AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            decoration:
                                const BoxDecoration(color: drabDarkBrown),
                            alignment: Alignment.center,
                            width: 150.w,
                            padding: EdgeInsets.symmetric(horizontal: 4.5.w),
                            child: InkWell(
                              onTap: action,
                              child: AutoSizeText(
                                "SHARE WITH FRIENDS",
                                style: tTheme.bodySmall!.copyWith(
                                  fontSize: 13.5.r,
                                  color: ghostWhite,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxFontSize: 15,
                                minFontSize: 9,
                                maxLines: 1,
                              ),
                            ),
                          )*/ /*
                        ],
                      ),
                    ),
                  ),
                  closedColor: beige,
                  openColor: ghostWhite,
                  openBuilder:
                      (_, void Function({Object? returnValue}) action) =>
                          EnterAvatarCodeBuilder(action),
                )*/

/*    /*appBar: AppBar(
        toolbarHeight: 90.h,
        titleSpacing: 0,
        backgroundColor: majorelleBlue,
        title: AutoSizeText(
          "My Avatars",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ghostWhite,
                fontFamily: 'Poppins',
                fontSize: 21.r,
                fontWeight: FontWeight.w500,
              ),
          maxLines: 2,
        ),
      ),*/
  */

/*
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/my_names.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

final PanelController _panelController = PanelController();

class EnterAvatarCodeBuilder extends ConsumerStatefulWidget {
  final void Function({Object? returnValue}) action;

  const EnterAvatarCodeBuilder(this.action, {super.key});

  @override
  ConsumerState createState() => _EnterAvatarCodeBuilderState();
}

class _EnterAvatarCodeBuilderState
    extends ConsumerState<EnterAvatarCodeBuilder> {
  final tController = TextEditingController();
  final pTheme = SlidingPanelTheme();
  final List<String> _a = [];

  @override
  void initState() {
    super.initState();
    tController.addListener(
      () {
        debugPrint("77--");
        debugPrint(tController.text);
      },
    );

    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        if (!_panelController.isPanelOpen) {
          _panelController.open();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    tController.dispose();
  }

  @override
  Widget build(BuildContext context) => SlidingUpPanel(
        controller: _panelController,
        borderRadius: pTheme.slidingPanelRadius,
        panel: Container(
          decoration: BoxDecoration(
            color: tropicalIndigo,
            borderRadius: pTheme.slidingPanelRadius,
          ),
          padding: pTheme.slidingPanelPadding,
          child: Column(
            children: [
              Container(
                width: 330.w,
                padding: EdgeInsets.only(left: 1.5.w),
                child: TextFormField(
                  maxLines: 1,
                  //maxLength: 6,
                  cursorColor: chocolateCosmos,
                  cursorWidth: 1.2.r,
                  controller: tController,
                  keyboardType: TextInputType.none,
                  style: TextStyle(
                    fontSize: 24.r,
                    height: 1.8.r,
                    letterSpacing: 4.5.r,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Type the emoji to enter avatar code',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 0,
                      fontSize: 15.r,
                      color: ghostWhite,
                      fontWeight: FontWeight.w300,
                    ),
                    isDense: true,
                    isCollapsed: false,
                    suffixIcon: Container(
                      constraints: BoxConstraints.tight(Size.square(30.r)),
                      child: IconButton(
                        //onPressed: onSubmitted(),
                        onPressed: () {
                          if (_a.isNotEmpty) {
                            setState(() {
                              _a.removeLast();
                              tController.text =
                                  _a.map((e) => emojiArr[int.parse(e)]).join();
                            });
                          }
                        },
                        icon: Icon(
                          Icons.backspace,
                          size: 21.r,
                          color: ghostWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Gap(24.r),
              Expanded(
                child: GridView.custom(
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 8,
                    pattern: [
                      const WovenGridTile(1, crossAxisRatio: 0.9),
                      const WovenGridTile(1, crossAxisRatio: 0.9),
                      const WovenGridTile(1),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (_, index) => Container(
                      padding: EdgeInsets.all(4.5.r),
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Text(emojiArr[index]),
                        onTap: () {
                          setState(() => _a.add("$index"));
                          tController.text =
                              _a.map((e) => emojiArr[int.parse(e)]).join();
                        },
                      ),
                    ),
                    childCount: 8,
                  ),
                ),
              )
            ],
          ),
        ),
        maxHeight: 180.h,
        minHeight: 0,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 72.h,
                child: ListTile(
                  contentPadding: pTheme.slidingPanelPadding,
                  horizontalTitleGap: 1.5.r,
                  dense: true,
                  leading: InkWell(
                    onTap: widget.action,
                    child: Icon(Icons.close, size: 18.r),
                  ),
                  title: AutoSizeText(
                    "See what others are sharing . . .",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24.r,
                      color: federalBlue,
                      //height: 2.1.r,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
              Expanded(
                //height: 630.h,
                child: ListView(
                  //padding: pTheme.slidingPanelPadding,
                  children: List.generate(
                      15, (index) => const EnterAvatarCodeListTile()),
                ),
              ),
            ],
          ),
        ),
      );
}

*/
/*Expanded(
              child: SlideInUp(
                child: FadeInUp(
                  child: Container(
                    //height: 210.h,
                    decoration: BoxDecoration(
                      borderRadius: pTheme.slidingPanelRadius,
                      color: ashGray,
                    ),
                    //color: federalBlue,
                    padding: pTheme.slidingPanelPadding,
                    child: ClipRRect(
                      borderRadius: pTheme.slidingPanelRadius,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 330.w,
                            padding: EdgeInsets.only(left: 1.5.w),
                            child: TextFormField(
                              maxLines: 1,
                              //maxLength: 6,
                              cursorColor: chocolateCosmos,
                              cursorWidth: 1.2.r,
                              controller: tController,
                              //textAlign: TextAlign.center,

                              //controller: controller,
                              keyboardType: TextInputType.none,

                              //onFieldSubmitted: (x) => onSubmitted(),
                              //onEditingComplete: onSubmitted(),
                              style: TextStyle(
                                fontSize: 24.r,
                                height: 1.8.r,
                                letterSpacing: 4.5.r,
                              ),

                              decoration: InputDecoration(
                                hintText: 'Type the emoji to enter avatar code',
                                hintStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0,
                                  fontSize: 15.r,
                                  color: richBlack,
                                  fontWeight: FontWeight.w300,
                                ),
                                isDense: true,
                                isCollapsed: false,
                                suffixIcon: Container(
                                  constraints:
                                      BoxConstraints.tight(Size.square(30.r)),
                                  child: IconButton(
                                    //onPressed: onSubmitted(),
                                    onPressed: () {
                                      if (_a.isNotEmpty) {
                                        List<String> b = _a.split('');
                                        b.removeLast();

                                        tController.text = b
                                            .map((e) => emojiArr[b.indexOf(e)])
                                            .join();
                                      }
                                    },
                                    icon: Icon(
                                      Icons.backspace,
                                      size: 21.r,
                                      color: cornellRed,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(24.r),
                          Expanded(
                            child: GridView.custom(
                              //scrollDirection: Axis.horizontal,
                              gridDelegate: SliverWovenGridDelegate.count(
                                crossAxisCount: 8,
                                //mainAxisSpacing: 1.5.r,
                                //crossAxisSpacing: 1.5.r,
                                pattern: [
                                  const WovenGridTile(1, crossAxisRatio: 0.9),
                                  const WovenGridTile(1, crossAxisRatio: 0.9),
                                  const WovenGridTile(1),
                                ],
                              ),
                              childrenDelegate: SliverChildBuilderDelegate(
                                (_, index) => Container(
                                  padding: EdgeInsets.all(4.5.r),
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    child: Text(emojiArr[index]),
                                    onTap: () {
                                      setState(() => _a += "$index");
                                      tController.text += emojiArr[index];
                                    },
                                  ),
                                ),
                                childCount: 8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )*/ /*


class EnterAvatarCodeListTile extends ConsumerWidget {
  const EnterAvatarCodeListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 45.h,
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      margin: EdgeInsets.symmetric(vertical: 1.5.r),
      decoration: BoxDecoration(
        color: mockInteger(0, 9) == 9
            ? gridColor[mockInteger(0, 2)].withOpacity(1)
            : null,
        borderRadius: BorderRadius.circular(3.r),
      ),
      alignment: Alignment.center,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 4.5.r),
        leadingAndTrailingTextStyle: TextStyle(
          fontFamily: 'Montserrat',
          color: gray,
          fontSize: 12.r,
        ),
        dense: true,
        //isThreeLine: true,
        subtitleTextStyle: TextStyle(fontSize: 9.r),
        //subtitle: Text("ss"),
        horizontalTitleGap: 1.5.r,
        leading: Container(
          constraints: BoxConstraints.tight(Size(72.w, 30.h)),
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Icon(
                Icons.timer_outlined,
                size: 15.r,
                color: drabDarkBrown,
              ),
              Gap(4.5.r),
              AutoSizeText(
                "${mockInteger(1, 12).toString().padLeft(2, '0')}: ${mockInteger(1, 59).toString().padLeft(2, '0')} PM",
                stepGranularity: 1.5,
                overflow: TextOverflow.ellipsis,
                minFontSize: 6,
                maxFontSize: 9,
              ),
            ],
          ),
        ),
        titleTextStyle: TextStyle(
          fontSize: 10.5.r,
          fontFamily: 'Montserrat',
          color: federalBlue,
          fontWeight: FontWeight.normal,
        ),
        title: Container(
          margin: EdgeInsets.only(bottom: 12.r),
          child: Row(
            children: [
              CircleAvatar(
                radius: 12.r,
                child: RandomAvatar(mockString()),
              ),
              Gap(9.r),
              AutoSizeText(
                myRandomName(),
                minFontSize: 9,
                maxFontSize: 12,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13.2.r),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18.r),
                child: const Icon(
                  Icons.arrow_right_alt,
                  color: gray,
                ),
              ),
              CircleAvatar(
                radius: 12.r,
                child: RandomAvatar(mockString()),
              ),
              Gap(9.r),
              Expanded(
                child: AutoSizeText(
                  myRandomName(),
                  style: TextStyle(fontSize: 13.2.r),
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 9,
                  maxFontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

/*Container(
                color: cornellRed,
                child: EmojiPicker(
                  onEmojiSelected: (Category? category, Emoji emoji) {
                    // Do something when emoji is tapped (optional)
                  },
                  onBackspacePressed: () {
                    // Do something when the user taps the backspace button (optional)
                    // Set it to null to hide the Backspace-Button
                  },
                  //textEditingController:
                  //    _controller, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
                  config: Config(
                    //height: 256,
                    // bgColor: const Color(0xFFF2F2F2),
                    checkPlatformCompatibility: true,
                    emojiViewConfig: EmojiViewConfig(
                      // Issue: https://github.com/flutter/flutter/issues/28894
                      emojiSizeMax: 28 *
                          (foundation.defaultTargetPlatform ==
                                  TargetPlatform.iOS
                              ? 1.20
                              : 1.0),
                    ),
                    swapCategoryAndBottomBar: false,
                    skinToneConfig: const SkinToneConfig(),
                    categoryViewConfig: const CategoryViewConfig(),
                    bottomActionBarConfig: BottomActionBarConfig(
                      customBottomActionBar: (config, state, showSearchView) =>
                          Container(),
                    ),
                    searchViewConfig: SearchViewConfig(
                      customSearchView: (config, state, showEmojiView) =>
                          Container(),
                    ),
                  ),
                ),
              )*/

/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_provider.dart';
import 'firebase_init.dart';

final passAvatarDatabaseProvider = Provider((ref) => PassAvatarDatabase(ref));

class PassAvatarDatabase {
  final Ref ref;

  late DatabaseReference firebaseReference;
  late FirebaseFirestore firebaseFirestore;
  late User? user;
  late DatabaseReference passAvatarReference;

  PassAvatarDatabase(this.ref) {
    firebaseFirestore = ref.read(fireStoreProvider);
    firebaseReference = ref.read(databaseProvider).ref();

    user = ref.watch(authUserProvider).value;

    passAvatarReference = firebaseReference.child('pass_avatar');
  }
}*/

/*  /*border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                    color: ghostWhite,
                    width: 0.3.r,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                    color: chocolateCosmos,
                    width: 0.3.r,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.3.r),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius: BorderRadius.circular(6.r),
                ),*/*/

/*TextFormField(
            controller: textEditingController,
            keyboardType: TextInputType.name,
            cursorHeight: 15.r,
            scrollPadding: EdgeInsets.zero,
            maxLines: null,
            showCursor: false,
            expands: true,
            decoration: InputDecoration(contentPadding: EdgeInsets.zero),
          ),*/

//contentPadding:
//    EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h)
/*contentPadding: EdgeInsets.only(
                  left: 15.w,
                  bottom: 15.h,
                  top: 30.h,
                  right: 15.w,
                ),*/

/* style: TextStyle(
                color: chocolateCosmos,
                fontSize: 18.r,
                height: 2.1.r,
              ),*/
//cursorHeight: 36.r,
