import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/auth_provider.dart';
import '../logic/firebase_init.dart';
import '../logic/user_activity_provider.dart';
import '../theme/my_color.dart';

class DFooter extends ConsumerWidget {
  const DFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () {
            ref.read(setActiveProvider(false));
            ref.read(signOutProvider);
          },
          icon: Icon(Icons.logout, size: 21.r, color: frenchGray),
          label: Text(
            "LOG OUT",
            style: TextStyle(
              fontSize: 15.r,
              color: frenchGray,
              fontFamily: 'Montserrat',
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ref.watch(packageInfoProvider).maybeWhen(
              orElse: () => Container(),
              data: (app) => Text(
                "Version ${app.version} (${app.buildNumber})",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: frenchGray,
                      fontWeight: FontWeight.w300,
                      fontSize: 12.r,
                    ),
              ),
            ),
      ],
    );
  }
}
