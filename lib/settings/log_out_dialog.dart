import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';

import '../logic/auth_provider.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

final _pTheme = SlidingPanelTheme();

class LogOutDialog extends ConsumerWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: _pTheme.slidingPanelFullRadius,
        ),
        elevation: 0,
        surfaceTintColor: ghostWhite1,
        title: const Text("REALLY!?"),
        titleTextStyle: TextStyle(
          fontSize: 18.r,
          fontFamily: 'Montserrat',
          color: cardinal,
        ),
        content: Text(
          [
            "Are you certain you wish to log out at this time?",
            //"Confirm your decision to log out?",
            "Do you want to proceed with logging out?",
            //"Are you ready to sign out?",
            "Are you sure you want to end your session now?"
          ][mockInteger(0, 2)],
        ),
        contentTextStyle: TextStyle(
          fontFamily: 'Poppins',
          color: gray,
          fontWeight: FontWeight.normal,
          fontSize: 15.r,
          height: 2.1.r,
        ),
        //actionsPadding: EdgeInsets.zero,
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.of(context, rootNavigator: true).pop('dialog'),
            child: Text(
              "CANCEL NOW",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13.5.r,
              ),
            ),
          ),
          TextButton(
            onPressed: () => ref.read(signOutProvider),
            child: Text(
              "LOG OUT",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: frenchGray,
                fontSize: 13.5.r,
              ),
            ),
          )
        ],
      );
}
