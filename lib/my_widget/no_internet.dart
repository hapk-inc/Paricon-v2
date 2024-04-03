import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

//import '../theme/my_color.dart';
//import '../theme/my_theme.dart';

//final _pTheme = SlidingPanelTheme();

class NoInternet extends ConsumerWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Positioned(
          left: 0,
          child: Lottie.asset('lottie/no_net.json'),
        ),
        Center(
          child: AspectRatio(
            aspectRatio: 2.4,
            child: GridTileBar(
              title: FadeIn(
                child: Text("Oops !!",
                    style: tTheme.bodyMedium?.copyWith(fontSize: 36.r)),
              ),
              subtitle: FadeIn(
                delay: const Duration(milliseconds: 750),
                child: const Text(
                  "No internet connection found Check your connection or try again",
                  // style: settingSubText.copyWith(color: federalBlue),
                  maxLines: 2,
                ),
              ),
            ),
          ),
        )
        /* Expanded(
            child: Container(
                //color: argentinianBlue,
                ))*/
      ],
    );
  }
}

class NoInternet1 extends ConsumerWidget {
  const NoInternet1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tTheme = Theme.of(context).textTheme;

    return ListTile(
      titleTextStyle: tTheme.bodyMedium,
      title: const AutoSizeText(
        "Sorry, unable to connect to the internet.",
        maxLines: 2,
      ),
      subtitle: FadeIn(
        delay: const Duration(milliseconds: 450),
        child: AutoSizeText.rich(
          TextSpan(
            children: const [
              TextSpan(
                text: "Please check your network connection and try again.",
              )
            ],
            style: tTheme.bodySmall?.copyWith(fontSize: 12.r),
          ),
        ),
      ),
      trailing: AspectRatio(
          aspectRatio: 1,
          child:
              Lottie.asset('lottie/no_net.json', width: 150.r, height: 150.r)),
    );
  }
}
