import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../enums/enums.dart';
import '../logic/app/size_provider.dart';

class StaggeredGap extends ConsumerWidget {
  const StaggeredGap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize screenSize = ref.watch(sizeProvider);
    final bool isP = SizeNotifier(screenSize).isP;
    return Gap(isP ? 4.8.r : 3.r);
  }
}
