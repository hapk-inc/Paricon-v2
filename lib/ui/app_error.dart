import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:paricon/values/colors.dart';

@RoutePage()
class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  bool animationOver = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 15.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'lottie/error_404.json',
                  repeat: false,
                  onLoaded: (LottieComposition composition) {
                    Future.delayed(
                      composition.duration,
                      () {
                        setState(() => animationOver = true);
                      },
                    );
                  },
                ),
                if (animationOver)
                  FadeIn(
                    child: AutoSizeText(
                      "Sorry for the inconvenience",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: frenchGray),
                      maxLines: 1,
                    ),
                  )
              ],
            ),
          ),
        ),
      );
}
