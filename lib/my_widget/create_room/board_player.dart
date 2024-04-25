import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../enums/enums.dart';
import '../../logic/room/create_room.dart';
import '../../values/colors.dart';

class BoardPlayerPanel extends ConsumerWidget {
  const BoardPlayerPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    //final PlayerCount? count = ref.watch(roomNotifierProvider).room.count;

    final count = ref.watch(createRoomNotifierProvider).count;

    return ListView.separated(
      itemBuilder: (_, index) {
        MapEntry<PlayerCount, String> map = countMap.entries.elementAt(index);
        final bool isMatch = count == map.key;
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
              // onTap: () =>
              //     ref.read(dashboardNotifierProvider).playerCount = map.key,
              //onTap: () => ref.read(roomNotifierProvider).count = map.key,
              onTap: () =>
                  ref.read(createRoomNotifierProvider.notifier).count = map.key,
              contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
              title: Text(
                toBeginningOfSentenceCase(map.key.name) ?? "",
                style: textTheme.displayLarge?.copyWith(height: 2.1),
              ),
              subtitle: Text(map.value, style: textTheme.bodyMedium),
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
      itemCount: countMap.length,
    );
  }
}
