import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/s_size.dart';
import '../../theme/my_color.dart';

class DashboardTitleX extends ConsumerWidget {
  final String t;
  const DashboardTitleX(this.t, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    final bool isTab = sSize == ScreenSize.tab;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      child: Text(
        t,
        style: TextStyle(fontSize: 14.r, color: battleshipGray),
      ),
    );
  }
}
