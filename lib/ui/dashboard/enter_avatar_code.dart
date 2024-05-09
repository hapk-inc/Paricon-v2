import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:pinput/pinput.dart';

import '../../values/colors.dart';
import '../../values/names.dart';

final formKey = GlobalKey<FormState>();

class EnterAvatarCode extends ConsumerStatefulWidget {
  const EnterAvatarCode({super.key});

  @override
  ConsumerState createState() => _EnterAvatarCodeState();
}

PinTheme _defaultPinTheme = PinTheme(
  width: 54.r,
  height: 60.r,
  textStyle: TextStyle(
    fontSize: 21.r,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
  ),
  decoration: BoxDecoration(
    color: magnolia,
    borderRadius: BorderRadius.circular(7.5.r),
    border: Border.all(color: Colors.transparent),
  ),
);

class _EnterAvatarCodeState extends ConsumerState<EnterAvatarCode> {
  late FocusNode focusNode;
  late TextEditingController controller;

  @override
  void initState() {
    focusNode = FocusNode();
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return StaggeredGrid.count(
      crossAxisCount: 15,
      children: [
        StaggeredGridTile.fit(
          crossAxisCellCount: 15,
          child: Text(
            "Enter Avatar code",
            style: textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: sepia,
              fontSize: 21.r,
              height: 2.1,
              // fontFamily: 'Montserrat',
            ),
          ),
        ),
        const StaggeredGridTile.fit(
          crossAxisCellCount: 15,
          child: Text(
            "Type your friend's code or click here to paste",
            style: TextStyle(color: gray),
          ),
        ),
        const StaggeredGridTile.count(
          crossAxisCellCount: 15,
          mainAxisCellCount: 1.2,
          child: SizedBox(),
        ),
        StaggeredGridTile.fit(
          crossAxisCellCount: 15,
          child: Form(
            key: formKey,
            child: SizedBox(
              height: 96.h,
              child: Pinput(
                length: 6,
                focusNode: focusNode,
                controller: controller,
                pinAnimationType: PinAnimationType.fade,
                keyboardType: TextInputType.name,
                useNativeKeyboard: true,
                defaultPinTheme: _defaultPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                validator: (value) {
                  return "Error";
                },
                errorTextStyle: textTheme.bodyMedium?.copyWith(
                  color: cornellRed,
                ),
                focusedPinTheme: _defaultPinTheme.copyWith(
                  decoration: _defaultPinTheme.decoration?.copyWith(
                    color: magnolia1,
                  ),
                ),
                errorPinTheme: _defaultPinTheme.copyWith(
                  decoration: _defaultPinTheme.decoration?.copyWith(
                    color: magnolia1,
                    border: Border.all(color: cornellRed, width: 0.45.r),
                  ),
                ),
                showCursor: true,
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                      width: double.maxFinite,
                      height: 1.5.h,
                      decoration: BoxDecoration(
                        color: charcoal,
                        borderRadius: BorderRadius.circular(4.5.r),
                      ),
                    )
                  ],
                ),
                preFilledWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                      width: double.maxFinite,
                      height: 1.5.h,
                      decoration: BoxDecoration(
                        color: ghostWhite,
                        borderRadius: BorderRadius.circular(4.5.r),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const StaggeredGridTile.count(
          crossAxisCellCount: 15,
          mainAxisCellCount: 0.3,
          child: SizedBox(),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 15,
          mainAxisCellCount: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: List.generate(
                    5,
                    (index) => AspectRatio(
                      aspectRatio: 8.1,
                      child: ListTile(
                        leading: Text(
                          "12:34 am",
                          style: textTheme.bodySmall?.copyWith(
                            color: frenchGray,
                          ),
                        ),
                        horizontalTitleGap: 7.5.w,
                        title: AutoSizeText(
                          "${NameGen.dummyName()} shares a new avatar to ${NameGen.dummyName()}",
                          style: textTheme.bodyMedium?.copyWith(
                            color: frenchGray,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
