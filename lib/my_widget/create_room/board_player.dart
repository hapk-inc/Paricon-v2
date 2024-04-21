import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../enums/enums.dart';
import '../../values/colors.dart';

class BoardPlayerPanel extends ConsumerWidget {
  const BoardPlayerPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ListView.separated(
      itemBuilder: (_, index) {
        MapEntry<PlayerCount, String> map = countMap.entries.elementAt(index);
        return AspectRatio(
          aspectRatio: 4.2,
          child: Container(
            color: aquamarine,
            alignment: Alignment.center,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
              title: Text(
                toBeginningOfSentenceCase(map.key.name) ?? "",
                style: textTheme.displayLarge?.copyWith(
                  fontSize: 18.r,
                  height: 1.8,
                ),
              ),
              //titleTextStyle: textTheme.titleLarge,
              subtitle: Text(
                map.value,
                // style: GoogleFonts.questrial(textStyle: textTheme.bodyMedium),
                style: textTheme.bodyMedium,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => Gap(15.r),
      itemCount: countMap.length,
    );
  }
}
