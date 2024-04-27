import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../enums/enums.dart';
import '../../logic/room/create_room.dart';
import '../../values/colors.dart';

class TypePanel extends ConsumerWidget {
  const TypePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BoardType? type = ref.watch(createRoomNotifierProvider).type;
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
              icon: Icon(Icons.close, size: 21.r, color: frenchGray),
            )
          ],
        ),
        const Gap(7.5),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) {
              MapEntry<BoardType, String> map =
                  typeMap.entries.elementAt(index);
              final bool isMatch = type == map.key;
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
                      trailing: Radio<BoardType>(
                        value: map.key,
                        groupValue: type,
                        onChanged: (BoardType? value) => ref
                            .read(createRoomNotifierProvider.notifier)
                            .type = value!,
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => const Gap(15),
            itemCount: BoardType.values.length,
          ),
        )
      ],
    );
  }
}

/*
class TypePanel extends ConsumerWidget {
  const TypePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    final TextTheme textTheme = Theme.of(context).textTheme;

    final BoardType? type = ref.watch(createRoomNotifierProvider).type;

    return ListView.separated(
      itemBuilder: (_, index) {
        MapEntry<BoardType, String> map = typeMap.entries.elementAt(index);
        final bool isMatch = type == map.key;
        return AspectRatio(
          aspectRatio: 4.2,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration(
              color: isMatch ? aquamarine : null,
              borderRadius: BorderRadius.circular(4.5.r),
            ),
            alignment: Alignment.center,
            child: ListTile(
              onTap: () =>
                  ref.read(createRoomNotifierProvider.notifier).type = map.key,
              //onTap: () => ref.read(roomNotifierProvider).type = map.key,
              //onTap: () => ref.read(dashboardNotifierProvider).type = map.key,
              contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
              title: Text(
                toBeginningOfSentenceCase(map.key.name) ?? "",
                style: textTheme.displayLarge?.copyWith(height: 2.1),
              ),
              //titleTextStyle: textTheme.titleLarge,
              subtitle: AutoSizeText(
                map.value,
                style: textTheme.bodyMedium,
                maxLines: 1,
              ),
              trailing: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: isMatch
                    ? const Icon(Icons.done, color: darkPastelGreen)
                    : const SizedBox(),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(
        color: frenchGray,
        thickness: 0.75,
      ),
      itemCount: typeMap.length,
    );
  }
}
*/
