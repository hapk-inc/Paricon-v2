import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/s_size.dart';
import '../theme/my_color.dart';

class NoInternet extends ConsumerWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.watch(sizeProvider);
    final tTheme = Theme.of(context).textTheme;

    return ListTile(
      title: FadeInRight(
        delay: const Duration(seconds: 1),
        child: Text(
          "No Internet now!",
          style: tTheme.bodyMedium!.copyWith(
            fontFamily: 'Poppins',
            color: federalBlue,
            height: 0,
            letterSpacing: 0,
          ),
        ),
      ),
      subtitle: FadeIn(
        delay: const Duration(milliseconds: 1500),
        child: RichText(
          text: TextSpan(
            text: "Once you're connected to the internet, simply ",
            children: const [
              TextSpan(
                text: "please wait",
                style: TextStyle(
                  color: darkPastelGreen,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(text: " for a while"),
            ],
            style: tTheme.bodySmall,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
