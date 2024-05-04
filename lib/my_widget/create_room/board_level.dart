import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../enums/enums.dart';
import '../../logic/room/create_room.dart';
import '../../values/colors.dart';

class LevelPanel extends ConsumerWidget {
  const LevelPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BoardLevel? level = ref.watch(createRoomNotifierProvider).level;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Choose Level",
              style: textTheme.titleSmall?.copyWith(color: darkPurple),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.close, size: 18.r, color: frenchGray),
            )
          ],
        ),
        const Gap(7.5),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) {
              MapEntry<BoardLevel, String> map =
                  levelMap.entries.elementAt(index);
              final bool isMatch = level == map.key;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                decoration: BoxDecoration(
                  color: magnolia,
                  borderRadius: BorderRadius.circular(7.5.r),
                  border: isMatch
                      ? Border.all(color: darkPurple, width: 0.75)
                      : null,
                ),
                child: AspectRatio(
                  aspectRatio: 4.5,
                  child: Center(
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                      title: Text(
                        toBeginningOfSentenceCase(map.key.name) ?? "",
                        style: textTheme.displayLarge?.copyWith(
                          height: 2.1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        map.value,
                        style: textTheme.bodyMedium?.copyWith(
                          color: gray,
                          fontFamily: 'Montserrat',
                          fontSize: 12.r,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: Radio<BoardLevel>(
                        value: map.key,
                        groupValue: level,
                        onChanged: (BoardLevel? value) => ref
                            .read(createRoomNotifierProvider.notifier)
                            .level = value!,
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => const Gap(15),
            itemCount: BoardLevel.values.length,
          ),
        )
      ],
    );
  }
}
