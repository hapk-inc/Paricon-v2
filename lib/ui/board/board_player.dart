import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';

import '../../values/colors.dart';
import '../../values/names.dart';

class BoardPlayerTile extends ConsumerWidget {
  final int index;
  const BoardPlayerTile(this.index, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme tTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(right: 3.w),
      color: iconColor[index],
      alignment: Alignment.center,
      constraints: BoxConstraints(maxWidth: 120.w, minWidth: 105.w),
      child: Stack(
        children: [
          Center(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 7.5.w),
              dense: true,
              title: AutoSizeText(
                NameGen.dummyName(),
                style: tTheme.headlineMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: AnimatedFlipCounter(
                value: mockInteger(1, 10),
                wholeDigits: 2,
                textStyle: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 18.r, letterSpacing: 0.3.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
