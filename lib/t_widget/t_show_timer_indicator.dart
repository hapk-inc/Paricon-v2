import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/my_color.dart';

import '../logic/tournament_listener.dart';

class ShowTimerIndicator extends ConsumerWidget {
  const ShowTimerIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tournamentListener = ref.watch(tournamentListenerNotifierProvider);
    final Duration gameDuration = tournamentListener.stopwatch.elapsed;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 15.r),
      title: SizedBox(
        height: 75.h,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  Icons.timer,
                  size: 30.r,
                  color: richBlack,
                ),
                SizedBox.square(dimension: 7.5.r),
                AnimatedFlipCounter(
                  value: gameDuration.inMinutes,
                  suffix: " : ",
                  wholeDigits: 2,
                  textStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    fontSize: 18.r,
                    color: amaranthPurple,
                    letterSpacing: 0.12.r,
                  ),
                ),
                SizedBox.square(dimension: 1.5.r),
                AnimatedFlipCounter(
                  value: gameDuration.inSeconds % 60,
                  wholeDigits: 2,
                  textStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    fontSize: 18.r,
                    color: amaranthPurple,
                    letterSpacing: 0.12.r,
                  ),
                ),
              ],
            ),
          ),
          trailing: InkWell(
            onTap: () {
              //context.router.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Press ",
                          style: const TextStyle(color: emerald),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => context.router.pop(),
                        ),
                        const TextSpan(text: "here to exit the game.")
                      ],
                      style: TextStyle(fontSize: 15.r, fontFamily: 'Poppins'),
                    ),
                  ),
                  /*  action: SnackBarAction(
                        label: 'EXIT GAME',
                        onPressed: () => context.router.pop(),
                      ),*/
                ),
              );
              //.closed
              /*.then((value) =>
                      ScaffoldMessenger.of(context).clearSnackBars());*/
            },
            child: Icon(Icons.close, size: 21.r),
          ),
        ),
      ),
      subtitle: ClipRRect(
        borderRadius: BorderRadius.circular(3.r),
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          tween: Tween<double>(
            begin: 0,
            end: tournamentListener.balancePercentage,
          ),
          builder: (_, value, __) => LinearProgressIndicator(
            value: value,
            color: majorelleBlue,
            backgroundColor: periwinkle,
            minHeight: 4.5.r,
          ),
        ),
      ),
    );
  }
}
