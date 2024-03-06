import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/app_check.dart';
import '../theme/my_color.dart';

class DFooter extends ConsumerWidget {
  const DFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*TextButton.icon(
            onPressed: () {
              ref.read(setActiveProvider(false));
              ref.read(signOutProvider);
            },
            icon: Icon(Icons.logout, size: 21.r, color: gray),
            label: Text(
              "LOG OUT",
              style: TextStyle(
                fontSize: 15.r,
                color: gray,
                fontFamily: 'Montserrat',
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),*/
          ref.watch(packageInfoProvider).maybeWhen(
                orElse: () => Container(),
                data: (app) => Text(
                  "Version ${app.version} (${app.buildNumber})",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: coolGray,
                        fontWeight: FontWeight.w300,
                        fontSize: 12.r,
                      ),
                ),
              ),
        ],
      );
}
