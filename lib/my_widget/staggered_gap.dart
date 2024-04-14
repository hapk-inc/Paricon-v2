import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class StaggeredGap extends ConsumerWidget {
  const StaggeredGap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final sizeNotifier = ref.watch(sizeProvider.notifier);
    //return Gap(sizeNotifier.isP ? 4.8.r : 3.r);
    return Gap(3.r);
  }
}
