import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/next_animation_flag.dart';
import '../theme/my_color.dart';

class DTournament extends ConsumerWidget {
  const DTournament({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme tTheme = Theme.of(context).textTheme;
    final repeatAnimationNotifier = ref.watch(repeatAnimationNotifierProvider);
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      title: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: SizedBox.square(
                dimension: 45.r,
                child: AnimatedEmoji(
                  AnimatedEmojis.chequeredFlag,
                  errorWidget: Center(
                    child: Text("🏁", style: TextStyle(fontSize: 30.r)),
                  ),
                  repeat: repeatAnimationNotifier.repeatAnimation,
                  animate: true,
                ),
              ),
            ),
            WidgetSpan(child: SizedBox.square(dimension: 12.r)),
            const TextSpan(text: "Ready, Set, Game : Join the Tournament 🏆")
          ],
          style: tTheme.bodyMedium!.copyWith(color: cinerous),
        ),
        maxLines: 3,
      ),
      subtitleTextStyle: tTheme.bodySmall!.copyWith(color: cinerous),
      subtitle: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: Container(
          key: ValueKey(repeatAnimationNotifier.index),
          alignment: Alignment.centerLeft,
          child: Text(
            [
              "Pair blocks quicker.",
              "Speed up matching the blocks.",
              "Match the blocks more quickly."
            ][repeatAnimationNotifier.index % 3],
            maxLines: 1,
            style: tTheme.bodySmall?.copyWith(fontSize: 12.r, color: coyote),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
