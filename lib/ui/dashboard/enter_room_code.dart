import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:pinput/pinput.dart';

import '../../values/colors.dart';
import '../my_theme.dart';

final SlidingPanelTheme _panelTheme = SlidingPanelTheme();

const length = 6;
const Color borderColor = darkPastelGreen;
const Color errorColor = lightOrange;
const Color fillColor = magnolia;

class EnterRoomCode extends StatelessWidget {
  const EnterRoomCode({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final focusNode = FocusNode();

    final PinTheme defaultPinTheme = PinTheme(
      width: 48.w,
      height: 48.w * 1.05,
      textStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 24.r,
        color: caputMortuum,
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(7.5.r),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return SizedBox(
      height: 420.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 420.h * 0.75,
            padding: _panelTheme.slidingPanelPadding,
            decoration: BoxDecoration(
              borderRadius: _panelTheme.slidingPanelRadius,
              // color: gray,
            ),
            child: Column(
              children: [
                Gap(15.r),
                Row(
                  children: [
                    Text(
                      "Enter Room Code to Join",
                      style: textTheme.headlineLarge?.copyWith(
                        color: caputMortuum,
                        fontSize: 15.r,
                      ),
                    ),
                    const Spacer(),
                    Icon(Icons.info_outline, size: 21.r, color: frenchGray)
                  ],
                ),
                //Spacer(),
                Gap(30.r),
                Container(
                  alignment: Alignment.center,
                  height: 120.h,
                  child: Pinput(
                    length: 6,
                    //forceErrorState: true,
                    // Text will be displayed under the Pinput
                    errorText: 'Invalid Room code',
                    validator: (value) {
                      debugPrint(value);
                      return null;
                    },
                    errorTextStyle: textTheme.bodyMedium?.copyWith(
                      color: cornellRed,
                    ),
                    //autofocus: dashboardNotifier.tab == 1,
                    cursor: VerticalDivider(
                      indent: 18.r,
                      endIndent: 18.r,
                      color: majorelleBlue,
                      width: 7.5.r,
                    ),
                    //controller: controller,
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
                    onCompleted: (value) {},
                  ),
                )
              ],
            ),
          ),
          // const Spacer(),
          FilledButton(
            onPressed: () {},
            child: const Text("Validate Code"),
          )
        ],
      ),
    );
  }
}
