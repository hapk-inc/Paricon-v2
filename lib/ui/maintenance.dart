import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../values/colors.dart';

@RoutePage()
class MaintenancePage extends ConsumerWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ref.watch(sizeProvider);
    final tTheme = Theme.of(context).textTheme;
    return Scaffold(
      /* appBar: AppBar(
        title: FadeIn(child: const MyLogo()),
        backgroundColor: majorelleBlue,
        toolbarHeight: 120.h,
      ),*/
      //backgroundColor: ghostWhite1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(150.r),
              /*Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: const MyLogo(),
              ),*/
              //Gap(30.r),
              AspectRatio(
                aspectRatio: 1.35,
                child: Lottie.asset('lottie/developer_typing.json'),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                title: FadeInRight(
                  delay: const Duration(milliseconds: 600),
                  child: AutoSizeText(
                    "App improvements are in progress",
                    style: tTheme.titleLarge?.copyWith(color: cornellRed),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                dense: true,
                subtitleTextStyle: tTheme.bodySmall,
                subtitle: FadeInRight(
                  delay: const Duration(milliseconds: 1200),
                  child: Text(
                    "Appreciate your patience while we perform maintenance",
                    maxLines: 2, style: tTheme.bodyMedium,
                    //style: TextStyle(fontSize: 12.r, color: jasper),
                  ),
                ),
              ),
              // Gap(60.r),
            ],
          ),
        ),
      ),
    );
  }
}
