import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../theme/my_color.dart';

import '../logic/firebase_init.dart';
import '../logic/s_size.dart';
import '../my_widget/my_logo.dart';

@RoutePage()
class SupportPage extends ConsumerWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tTheme = Theme.of(context).textTheme;
    final bool isAndroidWeb = ref.read(isAndroidWebProvider);
    final ScreenSize sSize = ref.read(sizeProvider);
    return Scaffold(
      backgroundColor: majorelleBlue,
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 7.5.w),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(150.r),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 240.w,
                  maxWidth: 270.w,
                ),
                child: const MyLogo(),
              ),
              Gap(30.r),
              if (sSize != ScreenSize.pc)
                Text(
                  "A Simple Memory Puzzle Multiplayer Game",
                  style: tTheme.bodyLarge?.copyWith(color: magnolia1),
                ),
              Gap(150.r),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5.r),
                    ),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                    minWidth: 240.w,
                    minHeight: 75.h,
                    maxWidth: 270.w,
                  ),
                  child: AutoSizeText(
                    "VIEW IN PLAY / APP STORE",
                    maxLines: 1,
                    style: TextStyle(fontSize: 24.r, fontFamily: 'WendyOne'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
