import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/dot_notifier.dart';

class LoginButton extends ConsumerWidget {
  final double txtSize;
  final num hMargin;
  const LoginButton({super.key, this.txtSize = 13.5, this.hMargin = 6});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dot = ref.watch(dotNotifierProvider);
    return ElevatedButton(
      onPressed: () {
        ref.read(dotNotifierProvider.notifier).state = 1;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        margin: EdgeInsets.symmetric(
          vertical: 9.h,
          horizontal: (hMargin).w,
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          style: TextStyle(
            fontSize: (txtSize).sp,
            fontFamily: 'Montserrat',
            color: const Color(0xfffbf9ff),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: dot == 0
                ? const Text("Start Now")
                : const Text("Create Profile"),
          ),
        ),
      ),
    );
  }
}
