import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../logic/s_size.dart';
import '../my_widget/my_logo.dart';
import '../theme/my_color.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  final Color? otherColor;
  const SplashPage({this.otherColor, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: otherColor ?? majorelleBlue,
        body: const _SplashState(),
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
    final sSize = ref.read(sizeProvider);
    final isL = sSize == ScreenSize.pc ||
        sSize == ScreenSize.tv ||
        sSize == ScreenSize.iPad;
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
