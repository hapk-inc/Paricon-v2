import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';

import '../logic/auth/notifier.dart';
import '../my_widget/pi_logo.dart';
import '../values/colors.dart';

Logger _logger = Logger();

@RoutePage()
class SplashPage extends StatelessWidget {
  final Color otherColor;
  const SplashPage({this.otherColor = majorelleBlue, super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: majorelleBlue,
        body: _SplashState(),
      );
}

class _SplashState extends ConsumerStatefulWidget {
  const _SplashState();

  @override
  ConsumerState createState() => __SplashStateState();
}

class __SplashStateState extends ConsumerState<_SplashState> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();

    audioPlayer = AudioPlayer()
      ..setPlayerMode(PlayerMode.lowLatency)
      ..audioCache.prefix = 'audio/'
      ..setReleaseMode(ReleaseMode.release);
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (!kDebugMode) {
          if (context.mounted) {
            audioPlayer.play(AssetSource('sacharja.mp3'));
          }
        }
      },
    );
    return Stack(
      children: [
        Center(
          child: FadeIn(
            delay: const Duration(seconds: 2),
            duration: const Duration(seconds: 1),
            child: const MyLogo(),
          ),
        ),
        //if (isPT)
        Container(
          alignment: Alignment.bottomCenter,
          child: Lottie.asset(
            'lottie/waving_hand.json',
            animate: true,
            repeat: false,
            onLoaded: (LottieComposition lottieComposition) {
              _logger.d("Lottie onLoaded");
              Future.delayed(
                lottieComposition.duration,
                () {
                  ref.read(authNotifierProvider).validateAuth();
                },
              );
            },
          ),
        )
      ],
    );
  }
}
