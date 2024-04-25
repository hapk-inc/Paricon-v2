import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/colors.dart';

/*
class SettingsTile extends ConsumerWidget {
  final String title;
  final bool showBorder;
  final GestureTapCallback? tileTap;
  const SettingsTile(this.title,
      {this.showBorder = true, this.tileTap, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final sizeNotifier = ref.watch(sizeProvider.notifier);
    //final bool isP = sizeNotifier.isP;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AspectRatio(
      aspectRatio: 7.5,
      //aspectRatio: isP ? 7.2 : 7.5,
      child: Container(
        decoration: BoxDecoration(
          border: showBorder
              ? Border(bottom: BorderSide(color: frenchGray, width: 0.24.r))
              : null,
        ),
        alignment: Alignment.centerLeft,
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 15.w, right: 15.w),
          title: Text(title, style: const TextStyle(color: gray)),
          iconColor: gray,
          trailing: Icon(Icons.chevron_right, size: 21.r, color: charcoal),
          titleTextStyle: textTheme.bodyMedium,
          leadingAndTrailingTextStyle: textTheme.bodyMedium,
          onTap: tileTap,
        ),
      ),
    );
  }
}
*/

class SettingsTile extends ConsumerWidget {
  final GestureTapCallback? onTap;
  final String title;
  final Widget leading;

  const SettingsTile({
    required this.title,
    required this.onTap,
    required this.leading,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AspectRatio(
      aspectRatio: 6,
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: magnolia1, width: 3.r)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 7.5.w),
        alignment: Alignment.center,
        child: ListTile(
          onTap: onTap,
          horizontalTitleGap: 15.w,
          //minLeadingWidth: 15,
          leading: leading,
          title: Text(
            title,
            style: textTheme.bodyMedium,
          ),
          trailing: const Icon(Icons.chevron_right, color: frenchGray),
        ),
      ),
    );
  }
}
