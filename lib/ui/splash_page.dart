import 'package:animate_do/animate_do.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../my_widgets/my_logo.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      //backgroundColor: Colors.deepPurple.shade700,
      body: Stack(
        children: [
          Center(
            child: FadeIn(
              delay: const Duration(milliseconds: 500),
              duration: const Duration(seconds: 1),
              child: const MyLogo(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Lottie.asset('assets/waving_hand.json',
                animate: true, repeat: false),
          )
        ],
      ),
    );
  }
}
