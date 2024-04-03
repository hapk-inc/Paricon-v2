import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';

import '../../logic/auth/bloc.dart';
import '../../values/colors.dart';
import '../my_theme.dart';

final SlidingPanelTheme _pTheme = SlidingPanelTheme();

class DeactivateAccountDialog extends ConsumerWidget {
  const DeactivateAccountDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: _pTheme.slidingPanelFullRadius,
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
