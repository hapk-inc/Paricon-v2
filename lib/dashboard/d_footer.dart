import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/app_check.dart';
import '../theme/my_color.dart';

class DFooter extends ConsumerWidget {
  const DFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ref.watch(packageInfoProvider).maybeWhen(
            orElse: () => Container(),
            data: (app) => Text(
              "Version ${app.version} (${app.buildNumber})",
              style: TextStyle(
                color: frenchGray,
                fontWeight: FontWeight.w300,
                fontSize: 15.r,
              ),
            ),
          ),
    );
  }
}
