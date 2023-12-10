import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/router/my_route.dart';
import 'package:pinput/pinput.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../logic/my_names.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

final PanelController panelController = PanelController();

@RoutePage()
class HostRoomPage extends StatelessWidget {
  const HostRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SlidingPanelTheme slidingPanelTheme = SlidingPanelTheme();
    return Scaffold(
      backgroundColor: ghostWhite,
      appBar: AppBar(
        backgroundColor: majorelleBlue,
        titleSpacing: 0,
        iconTheme: IconThemeData(color: ghostWhite, size: 18.r),
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'WendyOne',
          fontSize: 24.r,
          letterSpacing: 0.3.r,
        ),
        toolbarHeight: 72.h,
        title: const AutoSizeText("Play with Friends/Family"),
      ),
      body: SlidingUpPanel(
        controller: panelController,
        borderRadius: slidingPanelTheme.slidingPanelRadius,
        body: const __PlayFriend(),
        minHeight: 0,
        backdropEnabled: true,
        maxHeight: 600.h,
        panel: const RoomPanel(),
      ),
    );
  }
}

class RoomPanel extends StatelessWidget {
  const RoomPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final SlidingPanelTheme pTheme = SlidingPanelTheme();

    return Container(
      decoration: BoxDecoration(
        color: pTheme.slidingPanelColor,
        borderRadius: pTheme.slidingPanelRadius,
      ),
      padding: pTheme.slidingPanelPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 45.h,
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    FontAwesomeIcons.userTie,
                    size: 18.r,
                  ),
                  Gap(12.r),
                  const Text(
                    "Players Joined",
                    style: TextStyle(fontFamily: 'WendyOne'),
                  ),
                  const Spacer(),
                  Icon(
                    FontAwesomeIcons.message,
                    size: 18.r,
                    color: periwinkle,
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 330.h,
              //color: chocolateCosmos,
              alignment: Alignment.center,
              child: ListView(
                padding: EdgeInsets.all(3.r),
                children: List.generate(
                  4,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 75.h,
                    margin: EdgeInsets.symmetric(vertical: 3.h),
                    color: magnolia,
                    alignment: Alignment.center,
                    child: ListTile(
                      isThreeLine: true,
                      enabled: false,
                      tileColor: magnolia,
                      minLeadingWidth: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      dense: true,
                      // isThreeLine: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 6.w),
                      leading: Card(
                        shape: const CircleBorder(),
                        margin: EdgeInsets.zero,
                        elevation: 3.r,
                        child: CircleAvatar(
                          radius: 30.r,
                          backgroundColor: majorelleBlue,
                          child: RandomAvatar(
                            mockString(),
                            trBackground: true,
                            width: 60.r,
                          ),
                        ),
                      ),
                      title: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 30.h,
                        //color: darkPastelGreen,
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          "${myRandomName()} $myLastName",
                          style: TextStyle(
                            fontSize: 48.r,
                            fontFamily: 'WendyOne',
                            color: charcoal,
                          ),
                          maxLines: 1,
                          minFontSize: 15,
                          maxFontSize: 48,
                        ),
                      ),
                      subtitle: Container(
                        //color: pictonBlue,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: 3.h),
                        height: 21.h,
                        child: Text(
                          "${myRandomName()} $myLastName ${mockString(16)}",
                          style: TextStyle(
                            fontSize: 9.6.r,
                            fontFamily: 'Poppins',
                            color: gray,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Gap(15.r),
            ButtonBar(
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                    ),
                    side: const MaterialStatePropertyAll(
                        BorderSide(color: periwinkle)),
                    textStyle: MaterialStatePropertyAll(
                      TextStyle(
                        fontSize: 15.r,
                        fontFamily: "Montserrat",
                        color: periwinkle,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: periwinkle),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.router.replace(const PlayFriendRoute());
                  },
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                    ),
                    backgroundColor:
                        const MaterialStatePropertyAll(tropicalIndigo),
                  ),
                  child: const Text(
                    "Start Game",
                    style:
                        TextStyle(fontFamily: 'Montserrat', color: ghostWhite),
                  ),
                )
              ],
            ),
            Container(
              height: 90.h,
              color: chocolateCosmos,
            )
          ],
        ),
      ),
    );
  }
}

class __PlayFriend extends StatelessWidget {
  const __PlayFriend();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(15.r),
          AutoSizeText.rich(
            const TextSpan(
              children: [
                TextSpan(text: "🔎"),
                TextSpan(text: " Enter the room code"),
              ],
            ),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontFamily: 'WendyOne',
                  color: charcoal,
                  fontWeight: FontWeight.w500,
                  height: 2.1.r,
                  fontSize: 24.r,
                  //fontSize: 30.r,
                ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.h),
            child: const FilledRoundedPinPut(),
          ),
          Gap(15.r),
          Container(
            margin: EdgeInsets.all(15.r),
            child: AutoSizeText.rich(
              const TextSpan(
                children: [
                  TextSpan(
                    text: "or",
                  ),
                  TextSpan(
                    text: " Host your own game",
                    style: TextStyle(color: charcoal),
                  ),
                  TextSpan(text: " and"),
                  TextSpan(
                    text: " share the code to join",
                    style: TextStyle(color: charcoal),
                  )
                ],
              ),
              style: TextStyle(
                fontFamily: 'WendyOne',
                fontSize: 30.r,
                color: gray,
                height: 2.4.r,
                fontWeight: FontWeight.w300,
              ),
              maxFontSize: 15,
              minFontSize: 9,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.maxFinite,
            height: 60.h,
            decoration: BoxDecoration(
              color: magnolia,
              borderRadius: BorderRadius.circular(7.5.r),
            ),
            child: ToggleSwitch(
              radiusStyle: true,
              labels: const ["Easy", "Medium", "Hard"],
              customWidths: [90.w, 108.w, 96.w],
              minHeight: 45.h,
              // customHeights: [60.h],
              inactiveBgColor: magnolia,
              inactiveFgColor: charcoal,
              activeBgColor: const [tropicalIndigo],
              animate: true,
              animationDuration: 150,
              dividerColor: ghostWhite,
              dividerMargin: 1.2.r,
              customTextStyles: [
                TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.r,
                ),
              ],
            ),
          ),
          Gap(30.r),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            alignment: Alignment.center,
            height: 60.h,
            decoration: BoxDecoration(
              color: magnolia,
              borderRadius: BorderRadius.circular(7.5.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 1.5.r),
            child: ToggleSwitch(
              radiusStyle: true,
              labels: const ["Normal", "Closed", "OrderWise"],
              customWidths: [108.w, 90.w, 108.w],
              customHeights: [60.h],
              inactiveBgColor: magnolia,
              inactiveFgColor: charcoal,
              activeBgColor: const [tropicalIndigo],
              animate: true,
              animationDuration: 150,
              dividerColor: ghostWhite,
              dividerMargin: 1.2.r,
              customTextStyles: [
                TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 13.5.r,
                ),
              ],
            ),
          ),
          Gap(45.r),
          ElevatedButton(
            onPressed: () {
              panelController.open();
            },
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(chocolateCosmos),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5.r),
                ),
              ),
            ),
            child: Container(
              height: 54.h,
              //width: double.maxFinite,
              alignment: Alignment.center,
              child: Text(
                "Create Game",
                style: TextStyle(
                  fontFamily: 'WendyOne',
                  color: ghostWhite,
                  fontSize: 21.r,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class __PlayFriend1 extends StatelessWidget {
  const __PlayFriend1();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 7.5.r),
          padding: EdgeInsets.all(15.r),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 72.h,
            // color: cinerous.withOpacity(0.15),
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
            alignment: Alignment.bottomCenter,
            child: TextFormField(
              enabled: true,
              expands: true,
              maxLines: null,
              cursorHeight: 24.r,

              //initialValue: myUser.name,
              style: TextStyle(
                fontSize: 18.r,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3.r,
                color: charcoal,
              ),
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () {
                    debugPrint("Confirm");
                  },
                  child: Container(
                    width: 90.w,
                    //color: majorelleBlue,
                    alignment: Alignment.center,
                    child: Text(
                      "CHANGE",
                      style: TextStyle(
                        fontSize: 15.r,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w700,
                        color: cinerous,
                      ),
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                    // color: spaceCadet,
                    width: 0.3.r,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    // color: frenchGray,
                    width: 0.3.r,
                  ),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      //color: barnRed,
                      ),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                labelText: 'Enter Room Code',
                labelStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15.r, color: periwinkle,
                  fontWeight: FontWeight.w300,
                  //color: frenchGray,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 60.h,
          color: periwinkle.withOpacity(0.15),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 15.r),
          child: Text(
            "Game Type",
            style: TextStyle(
              fontFamily: 'WendyOne',
              color: majorelleBlue,
              fontSize: 18.r,
            ),
          ),
        ),
        Container(
          width: 360.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: periwinkle.withOpacity(0.15),
            borderRadius: BorderRadius.circular(7.5.r),
          ),
          padding: EdgeInsets.all(4.5.r),
          child: ToggleSwitch(
            initialLabelIndex: 0,
            totalSwitches: 3,
            cornerRadius: 7.5.r,
            radiusStyle: true,
            customWidths: [90.w, 105.w, 90.w],
            inactiveBgColor: periwinkle.withOpacity(0.15),
            inactiveFgColor: majorelleBlue,
            activeBgColor: const [majorelleBlue],
            /*activeBgColors: [
              [Colors.cyan],
              [Colors.redAccent],
              [Colors.redAccent],
            ],*/
            customTextStyles: [
              TextStyle(
                fontFamily: 'Cabin',
                fontSize: 18.r,
                fontWeight: FontWeight.w700,
              ),
            ],
            minHeight: 48.h,
            labels: const ['Easy', 'Medium', 'Hard'],
            onToggle: (index) {
              print('switched to: $index');
            },
          ),
        ),
        Container(
          height: 30.h,
          color: periwinkle.withOpacity(0.15),
        ),
        Gap(45.r),
        Container(
          height: 60.h,
          color: periwinkle.withOpacity(0.15),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 15.r),
          child: Text(
            "Game Type",
            style: TextStyle(
              fontFamily: 'WendyOne',
              color: majorelleBlue,
              fontSize: 18.r,
            ),
          ),
        ),
        Container(
          width: 360.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: periwinkle.withOpacity(0.15),
            borderRadius: BorderRadius.circular(7.5.r),
          ),
          padding: EdgeInsets.all(4.5.r),
          child: ToggleSwitch(
            initialLabelIndex: 0,
            totalSwitches: 3,
            cornerRadius: 7.5.r,
            radiusStyle: true,
            customWidths: [90.w, 105.w, 90.w],
            inactiveBgColor: periwinkle.withOpacity(0.15),
            inactiveFgColor: majorelleBlue,
            activeBgColor: const [majorelleBlue],
            /*activeBgColors: [
              [Colors.cyan],
              [Colors.redAccent],
              [Colors.redAccent],
            ],*/
            customTextStyles: [
              TextStyle(
                fontFamily: 'Cabin',
                fontSize: 18.r,
                fontWeight: FontWeight.w700,
              ),
            ],
            minHeight: 48.h,
            labels: const ['Easy', 'Medium', 'Hard'],
            onToggle: (index) {
              print('switched to: $index');
            },
          ),
        ),
        Container(
          height: 30.h,
          color: periwinkle.withOpacity(0.15),
        ),
      ],
    );
  }
}

class FilledRoundedPinPut extends StatefulWidget {
  const FilledRoundedPinPut({super.key});

  @override
  FilledRoundedPinPutState createState() => FilledRoundedPinPutState();

  @override
  String toStringShort() => 'Rounded Filled';
}

class FilledRoundedPinPutState extends State<FilledRoundedPinPut> {
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
      child: Pinput(
        length: length,
        controller: controller,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        onCompleted: (pin) {
          setState(() => showError = pin == '555555');
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
      ),
    );
  }
}
