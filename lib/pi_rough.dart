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
