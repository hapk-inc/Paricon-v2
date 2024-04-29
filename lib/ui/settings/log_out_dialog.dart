import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';

import '../../logic/auth/bloc.dart';
import '../../theme/sliding_panel.dart';
import '../../values/colors.dart';

final SlidingPanelTheme _pTheme = SlidingPanelTheme();

class LogOutDialog extends ConsumerWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: _pTheme.dialogRadius),
      elevation: 0,
      surfaceTintColor: ghostWhite,
      title: const Text("Really!?"),
      titleTextStyle: textTheme.titleMedium,
      contentTextStyle: textTheme.bodyMedium,
      content: Text(
        [
          "Are you certain you wish to log out at this time?",
          "Do you want to proceed with logging out?",
          "Are you sure you want to end your session now?"
        ][mockInteger(0, 2)],
      ),
      actions: [
        TextButton(
          onPressed: () => ref.read(signOutProvider),
          child: const Text("LOG OUT"),
        )
      ],
    );
  }
}
