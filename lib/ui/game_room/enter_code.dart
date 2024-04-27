import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:paricon/logic/panel/bloc.dart';
import 'package:paricon/logic/room/bloc.dart';
import 'package:pinput/pinput.dart';

import '../../enums/enums.dart';
import '../../logic/app/game_match_bloc.dart';
import '../../router/my_route.dart';
import '../../values/colors.dart';

class EnterCode extends ConsumerStatefulWidget {
  const EnterCode({super.key});

  @override
  ConsumerState createState() => _EnterCodeState();
}

const length = 6;
const borderColor = darkPastelGreen;
const errorColor = caputMortuum;
Color fillColor = magnolia;

PinTheme _defaultPinTheme = PinTheme(
  width: 54.w,
  height: 60.w,
  textStyle: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24.r,
    color: violetBlue,
  ),
  decoration: BoxDecoration(
    color: fillColor,
    borderRadius: BorderRadius.circular(7.5.r),
    border: Border.all(color: Colors.transparent),
  ),
);

class _EnterCodeState extends ConsumerState<EnterCode> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(15.r),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Enter Room code", style: textTheme.titleMedium),
            IconButton(
              onPressed: () =>
                  ref.read(dashboardPanelControllerProvider).close(),
              icon: Icon(Icons.close, size: 21.r, color: frenchGray),
            )
          ],
        ),
        //Gap(4.5.r),
        const Text(
          "Enter 6-Digit code to join the room",
          style: TextStyle(color: frenchGray),
        ),
        Gap(30.r),
        Pinput(
          length: 6,
          controller: controller,
          keyboardType: TextInputType.number,
          focusNode: focusNode,
          defaultPinTheme: _defaultPinTheme,
          focusedPinTheme: _defaultPinTheme.copyWith(
            height: 72.h,
            decoration: _defaultPinTheme.decoration!.copyWith(
              border: Border.all(color: borderColor),
            ),
          ),
          errorPinTheme: _defaultPinTheme.copyWith(
            decoration: const BoxDecoration(color: errorColor),
          ),
          onCompleted: (value) {},
        ),
        Gap(45.r),
        ElevatedButton(
          onPressed: () =>
              ref.watch(validateCodeProvider(controller.text).future).then(
            (value) async {
              if (value is ValidateRoom) {
                debugPrint(value.name);
              }
              if (value is String) {
                debugPrint("108--$value");
                ref.read(idNotifier.notifier).state = value;
                ref.read(matchNotifierProvider.notifier).state =
                    GameMatch.playFriend;

                /* ref.read(joinRoomProvider);
                ref.read(matchNotifierProvider.notifier).state =
                    GameMatch.playFriend;*/
                context.router.push(const GameRoomRoute());
              }
            },
          ).catchError(
            (e, s) {
              debugPrint(e.toString());
            },
          ),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(darkPurple),
          ),
          child: const Text("Continue"),
        )
      ],
    );
  }
}
