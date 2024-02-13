import 'package:animated_emoji/animated_emoji.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';

import '../theme/my_color.dart';

class DTournament extends ConsumerWidget {
  const DTournament({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme tTheme = Theme.of(context).textTheme;
    return ListTile(
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
                ),
              ),
            ),
            WidgetSpan(child: SizedBox.square(dimension: 12.r)),
            const TextSpan(
              text: "Ready, Set, Game : Join the Tournament 🏆",
            )
          ],
          style: tTheme.bodyMedium!.copyWith(color: cinerous),
        ),
        maxLines: 3,
      ),
      subtitleTextStyle: tTheme.bodySmall!.copyWith(color: cinerous),
      subtitle: Text(mockString(), maxLines: 2),
    );
  }
}
