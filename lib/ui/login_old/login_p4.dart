import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../login/engage_and_unlock.dart';

class LoginP extends ConsumerStatefulWidget {
  const LoginP({super.key});

  @override
  ConsumerState createState() => _LoginPState();
}

class _LoginPState extends ConsumerState<LoginP> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 240.h,
            margin: EdgeInsets.only(bottom: 15.h),
            color: const Color(0xff724cf9),
            child: LayoutBuilder(
              builder: (_, p1) => Stack(
                children: [
                  Positioned(
                    right: p1.maxWidth * 0.03,
                    top: p1.maxHeight * 0.03,
                    bottom: p1.maxHeight * 0.03,
                    width: p1.maxWidth * 0.45,
                    child: Container(
                      //color: Colors.pink,
                      child: Lottie.asset(
                        'assets/profile_mobile.json',
                        repeat: true,
                      ),
                    ),
                  ),
                  Positioned(
                    left: p1.maxWidth * 0.03,
                    width: p1.maxWidth * 0.51,
                    top: p1.maxHeight * 0.15,
                    bottom: p1.maxHeight * 0.06,
                    child:
                        const EngageAndUnlock(tFontSize: 21, subFontSize: 11.4),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 300.h,
            margin: EdgeInsets.only(bottom: 30.h),
            //color: const Color(0xff724cf9),
            child: Form(
              child: Column(
                children: [
                  Container(
                    height: 60.h,
                    margin: EdgeInsets.only(
                      bottom: 9.h,
                      left: 15.w,
                      right: 30.w,
                      top: 12.h,
                    ),
                    child: TextFormField(
                      enabled: true,
                      expands: true,
                      maxLines: null,
                      style: TextStyle(
                        fontSize: 15.r,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff071E22),
                      ),
                      decoration: InputDecoration(
                        suffix: InkWell(
                          onTap: () {},
                          child: Text(
                            "LOGIN NOW",
                            style: TextStyle(
                              fontSize: 13.5.r,
                              fontFamily: 'Poppins',
                              color: const Color(0xffA1C349),
                            ),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xff171738),
                            width: 0.6.r,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xffBEBCC0),
                            width: 0.6.r,
                          ),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff89023E)),
                        ),
                        labelText: 'Email / Phone No.',
                        labelStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.r,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xff807E81),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 27.h),
                  Container(
                    padding: EdgeInsets.only(left: 15.w),
                    margin: EdgeInsets.symmetric(vertical: 15.h),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign in with",
                      style: TextStyle(
                        fontSize: 14.r,
                        fontFamily: 'Montserrat',
                        //fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300.w,
                    child: Wrap(
                      spacing: 9.w,
                      runSpacing: 15.h,
                      // crossAxisAlignment: WrapCrossAlignment.start,
                      // alignment: WrapAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            fixedSize:
                                MaterialStatePropertyAll(Size.fromRadius(30.r)),
                            shape:
                                const MaterialStatePropertyAll(CircleBorder()),
                            padding:
                                const MaterialStatePropertyAll(EdgeInsets.zero),
                            backgroundColor: const MaterialStatePropertyAll(
                              Color(0xffDDDBE0),
                            ),
                          ),
                          child: Container(
                            constraints:
                                BoxConstraints.tight(Size.square(33.r)),
                            child: Image.asset('assets/glogo.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15.w),
                    margin: EdgeInsets.only(top: 30.h, bottom: 15.h),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Not Played before?",
                      style: TextStyle(
                        fontSize: 14.r,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 600.h,
            child: Column(
              children: [
                Container(
                  height: 60.h,
                  margin: EdgeInsets.only(
                    bottom: 9.h,
                    left: 15.w,
                    right: 30.w,
                    top: 12.h,
                  ),
                  child: TextFormField(
                    enabled: true,
                    expands: true,
                    maxLines: null,
                    style: TextStyle(
                      fontSize: 15.r,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff071E22),
                    ),
                    decoration: InputDecoration(
                      suffix: InkWell(
                        onTap: () {},
                        child: Text(
                          "CONFIRM",
                          style: TextStyle(
                            fontSize: 13.5.r,
                            fontFamily: 'Poppins',
                            color: const Color(0xffA1C349),
                          ),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xff171738),
                          width: 0.6.r,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xffBEBCC0),
                          width: 0.6.r,
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff89023E)),
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.r,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xff807E81),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60.h,
                  margin: EdgeInsets.only(
                    bottom: 9.h,
                    left: 15.w,
                    right: 30.w,
                    top: 12.h,
                  ),
                  child: TextFormField(
                    enabled: true,
                    expands: true,
                    maxLines: null,
                    style: TextStyle(
                      fontSize: 15.r,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff071E22),
                    ),
                    decoration: InputDecoration(
                      suffix: InkWell(
                        onTap: () {},
                        child: Text(
                          "CONFIRM",
                          style: TextStyle(
                            fontSize: 13.5.r,
                            fontFamily: 'Poppins',
                            color: const Color(0xffA1C349),
                          ),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xff171738),
                          width: 0.6.r,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xffBEBCC0),
                          width: 0.6.r,
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff89023E)),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.r,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xff807E81),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60.h,
                  margin: EdgeInsets.only(
                    bottom: 9.h,
                    left: 15.w,
                    right: 30.w,
                    top: 12.h,
                  ),
                  child: TextFormField(
                    enabled: true,
                    expands: true,
                    maxLines: null,
                    style: TextStyle(
                      fontSize: 15.r,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff071E22),
                    ),
                    decoration: InputDecoration(
                      suffix: InkWell(
                        onTap: () {},
                        child: Text(
                          "CONFIRM",
                          style: TextStyle(
                            fontSize: 13.5.r,
                            fontFamily: 'Poppins',
                            color: const Color(0xffA1C349),
                          ),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xff171738),
                          width: 0.6.r,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xffBEBCC0),
                          width: 0.6.r,
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff89023E)),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.r,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xff807E81),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
