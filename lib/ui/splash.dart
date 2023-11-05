import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../logic/s_size.dart';
import '../my_widget/my_logo.dart';
import '../theme/my_color.dart';

@RoutePage()
class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      backgroundColor: majorelleBlue,
      body: SplashState(),
    );
  }
}

class SplashState extends ConsumerWidget {
  const SplashState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    final isL = sSize == ScreenSize.pc ||
        sSize == ScreenSize.tv ||
        sSize == ScreenSize.iPad;

    return Stack(
      children: [
        Center(
          child: FadeIn(
            delay: const Duration(seconds: 2),
            duration: const Duration(seconds: 1),
            child: const MyLogo(),
          ),
        ),
        if (!isL)
          Container(
            alignment: Alignment.bottomCenter,
            child: Lottie.asset(
              'lottie/waving_hand.json',
              animate: true,
              repeat: false,
            ),
          )
      ],
    );
  }
}
