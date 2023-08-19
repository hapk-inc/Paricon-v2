import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import 'login/login_p.dart';
//import 'login/login_w.dart';

/*@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.watch(sizeProvider);
    final LoginTheme _theme = LoginTheme(
      title: const Color(0xffaa5042),
      subTitle: const Color(0xff753742),
      already: const Color(0xff009ddc),
      useExisting: const Color(0xffff1053),
      //roundHighlight: const Color(0xff753742),
      roundHighlight: const Color(0xff3e4d4a),
      //roundBg: const Color(0xffaa5042),
      roundBg: const Color(0xffDBDFE6),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      */ /* appBar: AppBar(
        //backgroundColor: const Color(0xffFBF9FF),
        //toolbarHeight: sSize == ScreenSize.phone ? 90.h : 90.h,
        toolbarHeight: 900.h * 0.1,
        elevation: 1.2,
        //centerTitle: false,
        leadingWidth: 0,

        title: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: sSize == ScreenSize.phone ? 270.w : 240.w,
          child: const MyLogo(),
        ),

        //leadingWidth: 270.w,
        */ /* */ /*title: Container(
          width: 360.w,

          alignment: Alignment.centerLeft,
          // alignment: Alignment(-1.2, 0),
          child: const MyLogo(),
        ),*/ /* */ /*
        */ /* */ /*leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),*/ /* */ /*
        */ /* */ /*actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],*/ /* */ /*
      ),*/ /*
      appBar: dashboardAppBar(sSize),
      body: SafeArea(
        child: Container(),
        */ /* child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: sSize == ScreenSize.phone
              ? LoginP(theme: _theme)
              : sSize == ScreenSize.tab
                  ? LoginT(theme: _theme)
                  : sSize == ScreenSize.iPad
                      ? LoginIpad(theme: _theme)
                      : sSize == ScreenSize.pc
                          ? LoginW(theme: _theme)
                          : const LoginTV(),
        ),*/ /*
      ),
    );
  }
}*/
