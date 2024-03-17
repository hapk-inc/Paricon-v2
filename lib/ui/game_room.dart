import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../logic/dashboard_panel_provider.dart';
import '../logic/panel_provider.dart';
import '../logic/room_id.dart';
import '../logic/room_level_notifier.dart';
import '../logic/room_provider.dart';
import '../logic/room_type_notifier.dart';
import '../logic/validate_room.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';
import 'edit_profile.dart';

class CreateGameRoom extends ConsumerStatefulWidget {
  const CreateGameRoom({super.key});

  @override
  ConsumerState createState() => _CreateGameRoomState();
}

class _CreateGameRoomState extends ConsumerState<CreateGameRoom>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final pTheme = SlidingPanelTheme();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    ref.read(dashboardPanelNotifierProvider).tabController = _tabController;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, c) {
          final dPanelNotifier = ref.watch(dashboardPanelNotifierProvider);
          return Container(
            decoration: BoxDecoration(
              borderRadius: pTheme.slidingPanelRadius,
              //color: magnolia,
            ),
            padding: pTheme.slidingPanelPadding,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: c.maxHeight * 0.6,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: dPanelNotifier.tabController,
                      children: const [
                        CreateRoom(),
                        EnterRoomCode(),
                      ],
                    ),
                  ),
                  const CreateRoomFooter()
                ],
              ),
            ),
          );
        },
      );
}

class CreateRoomFooter extends ConsumerWidget {
  const CreateRoomFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dPanelNotifier = ref.watch(dashboardPanelNotifierProvider);
    final tabController = dPanelNotifier.tabController;
    final double aR = 900.h / 360.w;
    final bool isSmallScreen = aR > 2.3;
    return SizedBox(
      height: 90.h,
      child: ButtonBar(
        children: [
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 15.w),
              ),
              backgroundColor: const MaterialStatePropertyAll(chocolateCosmos),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5.r),
                ),
              ),
            ),
            onPressed: dPanelNotifier.tab == 0
                ? () => ref.read(createRoomProvider.future).then(
                      (_) {
                        ref.read(joinRoomProvider);
                        dPanelNotifier.dCollapsedWidget =
                            const HostRoomCollapsed("Creating a Room");
                        // dPanelNotifier.dWidget = const HostRoom();
                      },
                    ).whenComplete(
                      () {
                        dPanelNotifier.dMinHeight = 72.h;
                        return ref.read(dashboardPanelProvider).close();
                      },
                    )
                : () {
                    dPanelNotifier.tab = 0;
                    tabController.animateTo(0);
                  },
            child: AutoSizeText(
              "CREATE GAME",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: ghostWhite,
                //fontStyle: FontStyle.italic,
                fontSize: isSmallScreen ? 13.5.r : 12.r,
              ),
              maxLines: 1,
            ),
          ),
          OutlinedButton(
            onPressed: tabController.index == 0
                ? () {
                    dPanelNotifier.tab = 1;
                    tabController.animateTo(1);
                  }
                : () {
                    debugPrint("Already in Code");
                  },
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
            child: AutoSizeText(
              "ENTER ROOM CODE",
              maxLines: 1,
              style: TextStyle(
                fontSize: isSmallScreen ? 13.5.r : 12.r,
                fontFamily: 'Montserrat',
                //fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreateRoom extends ConsumerWidget {
  const CreateRoom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(3.r),
          ToggleSwitch(
            //changeOnTap: false,
            radiusStyle: true,
            labels: List.from(RoomLevel.values.map((e) => firstCaps(e.name))),
            customWidths: [105.w, 75.w],
            minHeight: 40.h,
            onToggle: (index) => ref.read(levelProvider.notifier).state =
                RoomLevel.values[index!],
            inactiveBgColor: magnolia,
            inactiveFgColor: charcoal,
            activeBgColor: const [majorelleBlue],
            animate: true,
            animationDuration: 150,
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
          Gap(24.r),
          ToggleSwitch(
            //changeOnTap: false,
            radiusStyle: true,
            labels: List.from(
              RoomType.values.map((e) => firstCaps(e.name)),
            ),
            customWidths: [105.w, 90.w, 120.w],
            minHeight: 40.h,
            onToggle: (index) =>
                ref.read(typeProvider.notifier).state = RoomType.values[index!],
            inactiveBgColor: ghostWhite1,
            inactiveFgColor: charcoal,
            activeBgColor: const [majorelleBlue],
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
}

class EnterRoomCode extends StatelessWidget {
  const EnterRoomCode({super.key});

  @override
  Widget build(BuildContext context) => Container(
        //color: magnolia,
        padding: EdgeInsets.all(15.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header1(
              "Enter the room code to join",
              hStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 13.5.r,
                    color: violetBlue,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            Gap(7.5.r),
            const RoomCodeEdit(),
          ],
        ),
      );
}

class HostRoomCollapsed extends StatelessWidget {
  final String text;
  const HostRoomCollapsed(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final pTheme = SlidingPanelTheme();
    return Container(
      alignment: Alignment.centerLeft,
      padding: pTheme.slidingPanelPadding,
      child: AutoSizeText(
        text,
        style: TextStyle(
          color: federalBlue,
          fontFamily: 'Montserrat',
          fontSize: 15.r,
        ),
        maxLines: 1,
      ),
    );
  }
}

class RoomCodeEdit extends ConsumerStatefulWidget {
  const RoomCodeEdit({super.key});

  @override
  ConsumerState createState() => _RoomCodeEditState();
}

class _RoomCodeEditState extends ConsumerState<RoomCodeEdit> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  static const length = 6;
  static const Color borderColor = darkPastelGreen;
  static const Color errorColor = chocolateCosmos;
  static const Color fillColor = lavenderWeb;
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

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    debugPrint("RoomEdit Init");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      dashboardPanelNotifierProvider.select((value) => value.tab),
      (previous, next) {
        debugPrint("Tab Change $next");
        if (next == 0) {
          FocusScope.of(context).unfocus();
        }
      },
    );
    final dashboardNotifier = ref.watch(dashboardPanelNotifierProvider);
    return Container(
      alignment: Alignment.centerLeft,
      height: 75.h,
      child: Pinput(
        length: length,
        autofocus: dashboardNotifier.tab == 1,
        cursor: VerticalDivider(
          indent: 18.r,
          endIndent: 18.r,
          color: majorelleBlue,
          width: 7.5.r,
        ),
        controller: controller,
        keyboardType: TextInputType.number,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
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
        onCompleted: (pin) => ref.read(validateCodeProvider(pin).future).then(
          (value) {
            debugPrint("value--$pin");
            if (value is ValidateRoom) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "The requested room could not be found. Please verify the code and try again.",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ghostWhite1, fontSize: 15.r, height: 2.1.r),
                  ),
                ),
              );
            } else if (value is String) {
              ref.read(idNotifier.notifier).state = value;
              ref.read(joinRoomProvider);
            }
          },
        ),
      ),
    );
  }
}
