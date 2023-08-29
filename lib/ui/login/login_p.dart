import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../logic/auth.dart';
import '../../logic/panel_controller.dart';
import '../../logic/s_size.dart';
import '../../theme/my_color.dart';
import 'already_existing.dart';
import 'engage_and_unlock.dart';

class LoginP extends ConsumerStatefulWidget {
  const LoginP({super.key});

  @override
  ConsumerState createState() => _LoginPState();
}

class _LoginPState extends ConsumerState<LoginP> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      borderRadius: BorderRadius.circular(15.r),
      controller: ref.watch(panelProvider),
      backdropEnabled: true,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      panel: const EnterDetails(),
      minHeight: 0,
      maxHeight: 720.h,
      body: Column(
        children: [
          Container(
            height: 240.h,
            color: gunMetal,
            alignment: Alignment.centerLeft,
            child: LayoutBuilder(
              builder: (_, p1) => Stack(
                children: [
                  Positioned(
                    right: -p1.maxWidth * 0.1,
                    top: p1.maxHeight * 0.1,
                    bottom: p1.maxHeight * 0.1,
                    width: p1.maxWidth * 0.45,
                    child: Lottie.asset(
                      'assets/profile_mobile.json',
                      repeat: true,
                    ),
                  ),
                  Positioned(
                    left: p1.maxWidth * 0.03,
                    width: p1.maxWidth * 0.6,
                    top: p1.maxHeight * 0.15,
                    bottom: p1.maxHeight * 0.06,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: EngageAndUnlock(tFontSize: 18, subFontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const LoginRegister(),
          //const NewRegister()
        ],
      ),
    );
  }
}

class EnterDetails extends StatelessWidget {
  const EnterDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: babyPowder,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          //CircleAvatar(radius: 45.r),
          SizedBox(
            height: 90.h,
            child: Stack(
              children: [
                ListTile(
                  minVerticalPadding: 0,
                  dense: true,
                  contentPadding:
                      EdgeInsets.only(top: 9.h, bottom: 9.h, right: 9.w),
                  title: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 21.r,
                        fontFamily: 'Poppins',
                        color: russianViolet),
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.only(top: 6.h),
                    child: Text(
                      "Enter your personal information",
                      style: TextStyle(
                        fontSize: 12.r,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w100,
                        color: battleshipGray,
                      ),
                    ),
                  ),

                  /*trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text("Register Now"),
                  ),*/
                ),
                Positioned(
                  top: 15.h,
                  //bottom: 0,
                  right: 9.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Register Now",
                      maxLines: 1,
                      style: TextStyle(fontSize: 14.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60.h,
            margin: EdgeInsets.only(
                bottom: 18.h, left: 15.w, top: 18.h, right: 9.w),
            child: TextFormField(
              enabled: true,
              expands: true,
              maxLines: null,
              style: TextStyle(
                fontSize: 15.r,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: gunMetal,
              ),
              decoration: InputDecoration(
                suffix: InkWell(
                  onTap: () {},
                  child: Text(
                    "CONFIRM",
                    style: TextStyle(
                      fontSize: 15.r,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: pistachio,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(color: spaceCadet, width: 0.6.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: frenchGray, width: 0.6.r),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: barnRed),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                labelText: 'Enter your email',
                labelStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15.r,
                  fontWeight: FontWeight.normal,
                  color: frenchGray,
                ),
              ),
            ),
          ),
          Container(
            height: 60.h,
            margin: EdgeInsets.only(
                bottom: 18.h, left: 15.w, top: 18.h, right: 9.w),
            child: TextFormField(
              enabled: true,
              expands: true,
              maxLines: null,
              style: TextStyle(
                fontSize: 15.r,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: gunMetal,
              ),
              decoration: InputDecoration(
                suffix: InkWell(
                  onTap: () {},
                  child: Text(
                    "CONFIRM",
                    style: TextStyle(
                      fontSize: 15.r,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: pistachio,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(color: spaceCadet, width: 0.6.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: frenchGray, width: 0.6.r),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: barnRed),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                labelText: 'Enter your email',
                labelStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15.r,
                  fontWeight: FontWeight.normal,
                  color: frenchGray,
                ),
              ),
            ),
          ),
          ListTile(
            minVerticalPadding: 0,
            dense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 15.h),
            title: Text(
              "Pin Code",
              style: TextStyle(
                  fontSize: 18.r, fontFamily: 'Poppins', color: russianViolet),
            ),
            subtitle: Container(
              margin: EdgeInsets.only(top: 6.h),
              child: Text(
                "This code will be asked when you login to different devices",
                style: TextStyle(
                  fontSize: 12.r,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w100,
                  color: battleshipGray,
                ),
              ),
            ),
          ),
          const EnterCode(),
        ],
      ),
    );
  }
}

class EnterCode extends ConsumerWidget {
  const EnterCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    final boxSize = sSize == ScreenSize.phone ? 45.w : 39.w;
    final bool isPhone = sSize == ScreenSize.phone;
    return Container(
      height: 75.h,
      margin: EdgeInsets.symmetric(vertical: isPhone ? 3.h : 15.h),
      alignment: Alignment.centerRight,
      //color: Colors.red,
      child: Pinput(
        length: 5,
        defaultPinTheme: PinTheme(
          width: boxSize,
          height: boxSize + 3.w,
          margin: EdgeInsets.only(right: 3.6.w),
          decoration: BoxDecoration(
            color: timberWolf,
            borderRadius: BorderRadius.circular(10.5.r),
            //border: Border.all(color: Colors.transparent),
          ),
          textStyle: TextStyle(
            fontSize: 21.r,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(30, 60, 87, 1),
          ),
        ),
      ),
    );
  }
}

class FilledRoundedPinPut extends StatefulWidget {
  const FilledRoundedPinPut({Key? key}) : super(key: key);

  @override
  _FilledRoundedPinPutState createState() => _FilledRoundedPinPutState();

  @override
  String toStringShort() => 'Rounded Filled';
}

class _FilledRoundedPinPutState extends State<FilledRoundedPinPut> {
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
    const length = 5;
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      /*  textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),*/
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return SizedBox(
      height: 68,
      child: Pinput(
        length: length,
        controller: controller,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        onCompleted: (pin) {
          setState(() => showError = pin != '5555');
        },
        focusedPinTheme: defaultPinTheme.copyWith(
          height: 68,
          width: 64,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: borderColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: errorColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

class NewRegister extends StatelessWidget {
  const NewRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, p2) => Container(
        height: 720.h,
        padding: EdgeInsets.only(left: p2.maxWidth * 0.03),
        child: Form(
          child: Column(
            children: [
              SizedBox(
                width: 360.w,
                height: 120.h,
                child: Stack(
                  children: [
                    CircleAvatar(radius: 48.r),
                    Positioned(
                      right: 0,
                      top: 15.h,
                      width: p2.maxWidth * 0.72,
                      child: Container(
                        height: 60.h,
                        margin: EdgeInsets.only(bottom: 15.h, right: 15.w),
                        child: TextFormField(
                          enabled: true,
                          expands: true,
                          maxLines: null,
                          style: TextStyle(
                            fontSize: 15.r,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: gunMetal,
                          ),
                          decoration: InputDecoration(
                            suffix: InkWell(
                              onTap: () {},
                              child: Text(
                                "CONFIRM",
                                style: TextStyle(
                                  fontSize: 15.r,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  color: pistachio,
                                ),
                              ),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15.w),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(
                                color: spaceCadet,
                                width: 0.6.r,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: frenchGray, width: 0.6.r),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: barnRed),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            labelText: 'Enter your Name',
                            labelStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15.r,
                              fontWeight: FontWeight.normal,
                              color: frenchGray,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 60.h,
                margin: EdgeInsets.only(bottom: 30.h, right: 15.w),
                child: TextFormField(
                  enabled: true,
                  expands: true,
                  maxLines: null,
                  style: TextStyle(
                    fontSize: 15.r,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color: gunMetal,
                  ),
                  decoration: InputDecoration(
                    suffix: InkWell(
                      onTap: () {},
                      child: Text(
                        "CONFIRM",
                        style: TextStyle(
                          fontSize: 15.r,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: pistachio,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: spaceCadet,
                        width: 0.6.r,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: frenchGray, width: 0.6.r),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: barnRed),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    labelText: 'Enter your Name',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15.r,
                      fontWeight: FontWeight.normal,
                      color: frenchGray,
                    ),
                  ),
                ),
              ),
              Container(
                height: 60.h,
                margin: EdgeInsets.only(bottom: 30.h, right: 15.w),
                child: TextFormField(
                  enabled: true,
                  expands: true,
                  maxLines: null,
                  style: TextStyle(
                    fontSize: 15.r,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color: gunMetal,
                  ),
                  decoration: InputDecoration(
                    suffix: InkWell(
                      onTap: () {},
                      child: Text(
                        "CONFIRM",
                        style: TextStyle(
                          fontSize: 15.r,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: pistachio,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: spaceCadet,
                        width: 0.6.r,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: frenchGray, width: 0.6.r),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: barnRed),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    labelText: 'Enter your Name',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15.r,
                      fontWeight: FontWeight.normal,
                      color: frenchGray,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginRegister extends ConsumerWidget {
  const LoginRegister({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    return LayoutBuilder(
      builder: (_, p1) => Container(
        padding: EdgeInsets.symmetric(
            horizontal: p1.maxWidth * 0.03, vertical: 15.h),
        child: Column(
          children: [
            Container(
              height: 60.h,
              margin: EdgeInsets.only(bottom: 15.h, right: 15.w),
              child: TextFormField(
                enabled: true,
                expands: true,
                maxLines: null,
                style: TextStyle(
                  fontSize: 15.r,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  color: gunMetal,
                ),
                decoration: InputDecoration(
                  suffix: InkWell(
                    onTap: () {},
                    child: Text(
                      "LOGIN NOW",
                      style: TextStyle(
                        fontSize: 15.r,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: pistachio,
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: spaceCadet,
                      width: 0.6.r,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: frenchGray, width: 0.6.r),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: barnRed),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  labelText: 'Enter your Email',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15.r,
                    fontWeight: FontWeight.normal,
                    color: frenchGray,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.h),
              child: Row(
                children: [
                  Text(
                    "or Login with",
                    style: TextStyle(
                      color: blackOlive,
                      fontSize: 14.r,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: p1.maxWidth * 0.03,
                      endIndent: p1.maxWidth * 0.09,
                      color: frenchGray,
                      thickness: 0.6.r,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 360.w,
              margin: EdgeInsets.symmetric(vertical: 15.h),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                //alignment: WrapAlignment.end,
                children: [
                  //Text("or Sign in with"),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffDDDBE0),
                        borderRadius: BorderRadius.circular(9.r)),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(12.r),
                    constraints: BoxConstraints.tight(Size.square(54.r)),
                    child: InkWell(
                      onTap: () => ref.read(gSignProvider.future).catchError(
                        (e, s) {
                          if (kDebugMode) {
                            print(e);
                          }
                          ref.read(anonymousProvider);
                        },
                      ),
                      child: Image.asset('assets/gLogo.png'),
                    ),
                  ),
                  if (sSize == ScreenSize.tab || sSize == ScreenSize.iPad)
                    const Expanded(
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: AlreadyExisting()),
                    )
                ],
              ),
            ),
            if (sSize == ScreenSize.phone)
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.h),
                alignment: Alignment.center,
                child: const AlreadyExisting(),
              )
          ],
        ),
      ),
    );
  }
}
