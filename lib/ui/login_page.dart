import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/s_size.dart';
import 'login/login_p.dart';
import 'login/login_t.dart';
import 'login/login_tv.dart';
import 'login/login_w.dart';
//import 'login/login_p.dart';
//import 'login/login_w.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.watch(sizeProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        //backgroundColor: const Color(0xffFBF9FF),
        toolbarHeight: sSize == ScreenSize.phone ? 90.h : 90.h,
        elevation: 1.2,
        centerTitle: false,

        //leadingWidth: 270.w,
        /*title: Container(
          width: 360.w,

          alignment: Alignment.centerLeft,
          // alignment: Alignment(-1.2, 0),
          child: const MyLogo(),
        ),*/
        /*leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),*/
        /*actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],*/
      ),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: sSize == ScreenSize.phone
              ? const LoginP()
              : sSize == ScreenSize.tab
                  ? const LoginT()
                  : sSize == ScreenSize.iPad
                      ? const LoginW()
                      : sSize == ScreenSize.pc
                          ? const LoginW()
                          : const LoginTV(),
        ),
      ),
    );
  }
}
