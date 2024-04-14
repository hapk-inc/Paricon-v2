import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../model/player.dart';
import '../../theme/sliding_panel.dart';
import '../../values/colors.dart';

final SlidingPanelTheme _pTheme = SlidingPanelTheme();

class RecentPlayerDetailDialog extends ConsumerWidget {
  final Player player;
  const RecentPlayerDetailDialog(this.player, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: _pTheme.fullRadius,
      ),
      elevation: 0,
      surfaceTintColor: ghostWhite,
      title: Text(player.name),
      titleTextStyle: textTheme.titleMedium,
      contentTextStyle: textTheme.bodyMedium,
      content: Text("Created ${DateFormat.yMMMMd().format(player.createdAt!)}"),
      actions: const [
        /* TextButton(
          onPressed: () => ref.read(signOutProvider),
          child: const Text("LOG OUT"),
        )*/
      ],
    );
  }
}
