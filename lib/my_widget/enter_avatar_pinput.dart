import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../logic/user_provider.dart';
import '../theme/my_color.dart';

class EnterAvatarCodePinPut extends StatefulWidget {
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
            //setState(() => showError = pin == '555555');
            ref.read(validateAvatarCodeProvider(pin).future).then(
              (dynamic value) {
                if (value is String) {}
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
}
