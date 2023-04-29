import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ElapsedTimeTextBasic extends ConsumerWidget {
  const ElapsedTimeTextBasic({Key? key, required this.elapsed})
      : super(key: key);
  final Duration elapsed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hundreds = (elapsed.inMilliseconds / 10) % 100;
    final seconds = elapsed.inSeconds % 60;
    final minutes = elapsed.inMinutes % 60;
    final hundredsStr = hundreds.toStringAsFixed(0).padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');

    return AutoSizeText(
      //'$minutesStr:$secondsStr.$hundredsStr',
      '$minutesStr:$secondsStr',
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: 'Orbitron',
        color: Colors.deepPurple.shade50,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
