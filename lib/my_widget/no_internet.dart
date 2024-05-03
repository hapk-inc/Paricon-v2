import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../theme/sliding_panel.dart';
import '../values/colors.dart';

//import '../theme/my_color.dart';
//import '../theme/my_theme.dart';

final _pTheme = SlidingPanelTheme();

class NoInternet extends ConsumerWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        //color: magnolia1,
        borderRadius: _pTheme.fullRadius30,
      ),
      child: Column(
        children: [
          FadeIn(
            child: Lottie.asset(
              'lottie/no_net.json',
              width: 225.r,
              height: 225.r,
            ),
          ),
          Expanded(
            child: FadeIn(
              delay: const Duration(milliseconds: 750),
              child: AutoSizeText(
                "No internet connection found. Check your connection or try again",
                textAlign: TextAlign.center,
                style: tTheme.bodyMedium?.copyWith(
                  color: sepia,
                  fontSize: 18.r,
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
