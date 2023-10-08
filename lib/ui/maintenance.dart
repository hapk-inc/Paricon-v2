import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../logic/s_size.dart';
import '../my_widget/my_logo.dart';
import '../theme/my_color.dart';

@RoutePage()
class MaintenancePage extends ConsumerWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.watch(sizeProvider);
    final isPhone = sSize == ScreenSize.phone;
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(child: const MyLogo()),
        backgroundColor: majorelleBlue,
        toolbarHeight: 120.h,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: FadeIn(
              delay: const Duration(seconds: 3),
              child: Lottie.asset('lottie/developer_typing.json'),
            ),
          ),
          Expanded(
            child: ListTile(
              title: FadeInRight(
                delay: const Duration(seconds: 1),
                child: Text(
                  "App improvements are in progress",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: jasper,
                      fontWeight: FontWeight.w700,
                      fontSize: isPhone ? 36.r : 27.r),
                ),
              ),
              subtitle: FadeIn(
                delay: const Duration(milliseconds: 1500),
                child: Text(
                  "Appreciate your patience while we perform maintenance",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Cabin',
                    height: 3,
                    fontSize: 15.r,
                    color: cafeNoir,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
