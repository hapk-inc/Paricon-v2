import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/my_color.dart';

class NoInternet extends ConsumerWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tTheme = Theme.of(context).textTheme;

    return ListTile(
      titleTextStyle: tTheme.bodyMedium!.copyWith(
        fontFamily: 'Poppins',
        height: 0,
      ),
      title: const Text("No Internet now!"),
      subtitle: FadeIn(
        delay: const Duration(milliseconds: 450),
        child: RichText(
          text: TextSpan(
            text: "Once you're connected to the internet, simply ",
            children: const [
              TextSpan(text: "please wait", style: TextStyle(color: emerald)),
              TextSpan(text: " for a while"),
            ],
            style: tTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
