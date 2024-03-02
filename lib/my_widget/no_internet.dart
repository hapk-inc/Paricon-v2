import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternet extends ConsumerWidget {
  const NoInternet({super.key});

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
    );
  }
}
