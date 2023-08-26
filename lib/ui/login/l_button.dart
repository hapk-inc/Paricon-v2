import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/dot_notifier.dart';

class LoginButton extends ConsumerWidget {
  final double txtSize;
  final double hMargin;
  final double borderRadius;
  const LoginButton(
      {super.key,
      this.txtSize = 13.5,
      this.hMargin = 6,
      this.borderRadius = 3});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dot = ref.watch(dotNotifierProvider);
    return ElevatedButton(
      onPressed: () {
        ref.read(dotNotifierProvider.notifier).state = 1;
      },
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular((borderRadius).w),
          ),
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        margin: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: hMargin.w,
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          style: TextStyle(
            fontSize: dot == 1 ? (txtSize - 1.5).h : txtSize.h,
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

class LoginButton1 extends ConsumerWidget {
  final double txtSize;
  final num hMargin;
  final double borderRadius;
  const LoginButton1(
      {super.key,
      this.txtSize = 13.5,
      this.hMargin = 6,
      this.borderRadius = 3});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dot = ref.watch(dotNotifierProvider);
    return ElevatedButton(
      onPressed: () {
        ref.read(dotNotifierProvider.notifier).state = 1;
      },
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular((borderRadius).w),
          ),
        ),
      ),
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
