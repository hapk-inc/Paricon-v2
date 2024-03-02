import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../logic/firebase_init.dart';

import '../logic/s_size.dart';
import '../my_widget/my_logo.dart';
import '../theme/my_color.dart';

@RoutePage()
class NoNetPage extends ConsumerWidget {
  const NoNetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.watch(sizeProvider);
    final isPhone = sSize == ScreenSize.phone;
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(child: const MyLogo()),
        backgroundColor: majorelleBlue,
        toolbarHeight: 120.h,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: FadeIn(
              delay: const Duration(seconds: 3),
              child: AspectRatio(
                aspectRatio: 1,
                child: Lottie.asset('lottie/no_net.json'),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: FadeInRight(
                delay: const Duration(seconds: 1),
                child: Text(
                  "No Internet now!",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: gray,
                    fontWeight: FontWeight.w700,
                    fontSize: isPhone ? 36.r : 27.r,
                  ),
                ),
              ),
              subtitle: FadeIn(
                delay: const Duration(milliseconds: 1500),
                child: RichText(
                  text: TextSpan(
                    text: "Once you're connected to the internet, simply\n",
                    children: [
                      TextSpan(
                        text: "click here",
                        //recognizer: TapGestureRecognizer()
                        //  ..onTap = () => ref.refresh(checkNetProvider),
                        style: const TextStyle(
                          color: darkPastelGreen,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(text: " to initiate the app."),
                    ],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      height: 2.1,
                      fontSize: 15.r,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
