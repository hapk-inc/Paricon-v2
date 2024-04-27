import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../enums/enums.dart';
import '../../logic/room/create_room.dart';
import '../../values/colors.dart';

class PlayerPanel extends ConsumerWidget {
  const PlayerPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PlayerCount? count = ref.watch(createRoomNotifierProvider).count;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "How many players?",
              style: textTheme.titleSmall?.copyWith(color: darkPurple),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.close, size: 21.r, color: frenchGray),
            )
          ],
        ),
        const Gap(7.5),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) {
              MapEntry<PlayerCount, String> map =
                  countMap.entries.elementAt(index);
              final bool isMatch = count == map.key;
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
                        style: textTheme.displayLarge?.copyWith(height: 2.1),
                      ),
                      subtitle: Text(
                        map.value,
                        style: textTheme.bodyMedium?.copyWith(
                          color: cinerous,
                          fontFamily: 'Poppins',
                          fontSize: 12.r,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: Radio<PlayerCount>(
                        value: map.key,
                        groupValue: count,
                        onChanged: (PlayerCount? value) => ref
                            .read(createRoomNotifierProvider.notifier)
                            .count = value!,
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => const Gap(15),
            itemCount: PlayerCount.values.length,
          ),
        )
      ],
    );
  }
}
