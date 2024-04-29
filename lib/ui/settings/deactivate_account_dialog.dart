import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/auth/bloc.dart';
import '../../theme/sliding_panel.dart';
import '../../values/colors.dart';

final SlidingPanelTheme _pTheme = SlidingPanelTheme();

class DeactivateAccountDialog extends ConsumerWidget {
  const DeactivateAccountDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: _pTheme.dialogRadius,
      ),
      elevation: 0,
      surfaceTintColor: ghostWhite,
      title: const Text("Deactivating your Account"),
      titleTextStyle: textTheme.titleMedium,
      contentTextStyle: textTheme.bodyMedium,
      content: const Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "If you want to change your username,"
                  "you can do that here. ",
            ),
            TextSpan(
              text: "Account Deletion is final. ",
              style: TextStyle(color: cornellRed),
            ),
            TextSpan(text: "There will be no way to restore your account.")
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => ref.read(deleteAccountProvider),
          child: const Text("DEACTIVATE NOW"),
        )
      ],
    );
  }
}
