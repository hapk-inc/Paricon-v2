import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../theme/my_color.dart';
import '../theme/my_theme.dart';

class NoInternetPanel extends ConsumerWidget {
  const NoInternetPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pTheme = SlidingPanelTheme();
    return Padding(
      padding: pTheme.slidingPanelPadding,
      child: Stack(
        children: [
          Positioned(
            right: -9.r,
            top: 9.r,
            bottom: 9.r,
            child: Lottie.asset('lottie/no_net.json'),
          ),
          Positioned(
            width: 240.w,
            top: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "No Internet now!",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: hookerGreen),
                ),
                //  SizedBox(height: 9.h),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: const [
                        TextSpan(
                          text: "Once you're connected to the internet, simply",
                        ),
                        TextSpan(
                          text: " click here",
                          style: TextStyle(color: darkPastelGreen),
                        ),
                        TextSpan(
                            text: " to initiate the app, once internet is on.")
                      ],
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: gray, height: 2.4),
                    ),
                  ),
                ),
                // SizedBox(height: 24.r),
                //const Expanded(child: LoginButtonBar())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
