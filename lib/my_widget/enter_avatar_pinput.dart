/*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paricon/logic/room_provider.dart';
import 'package:pinput/pinput.dart';

import '../logic/dashboard_panel_provider.dart';
import '../logic/room_id.dart';
import '../logic/validate_room.dart';
import '../theme/my_color.dart';
import '../ui/host_room.dart';

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
                      //const HostRoom();
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
}
*/
