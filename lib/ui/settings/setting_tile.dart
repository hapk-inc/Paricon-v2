import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/colors.dart';

class SettingTile extends ConsumerWidget {
  final GestureTapCallback? onTap;
  final String name;
  final IconData icon;

  const SettingTile(
      {required this.name, this.onTap, required this.icon, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AspectRatio(
      aspectRatio: 5.4,
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: magnolia1, width: 3.r)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 7.5.w),
        alignment: Alignment.center,
        child: ListTile(
          onTap: onTap,
          horizontalTitleGap: 15.w,
          leading: Icon(icon, size: 27.r, color: gray),
          title: Text(
            name,
            style: textTheme.headlineLarge?.copyWith(
              color: gray,
              fontWeight: FontWeight.normal,
            ),
          ),
          trailing: const Icon(Icons.chevron_right, color: gray),
        ),
      ),
    );
  }
}
