import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../enums/enums.dart';
import '../../logic/app/size_provider.dart';
import '../../values/colors.dart';

class SettingsTile extends ConsumerWidget {
  final String title;
  final bool showBorder;
  final GestureTapCallback? tileTap;
  const SettingsTile(this.title,
      {this.showBorder = true, this.tileTap, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize screenSize = ref.watch(sizeProvider);
    final bool isP = SizeNotifier(screenSize).isP;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AspectRatio(
      aspectRatio: isP ? 6 : 8,
      child: Container(
        decoration: BoxDecoration(
          border: showBorder
              ? Border(bottom: BorderSide(color: frenchGray, width: 0.24.r))
              : null,
        ),
        alignment: Alignment.centerLeft,
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 18.w, right: 15.w),
          leading: Text(title, style: const TextStyle(color: charcoal)),
          iconColor: gray,
          trailing: Icon(Icons.chevron_right, size: 21.r, color: charcoal),
          titleTextStyle: textTheme.headlineLarge,
          leadingAndTrailingTextStyle: textTheme.headlineLarge,
          onTap: tileTap,
        ),
      ),
    );
  }
}
