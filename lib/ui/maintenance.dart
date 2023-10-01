import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../logic/s_size.dart';

@RoutePage()
class MaintenancePage extends ConsumerWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.watch(sizeProvider);
    final isPhone = sSize == ScreenSize.phone;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              flex: 3, child: Lottie.asset('lottie/developer_typing.json')),
          Expanded(
            child: ListTile(
              title: Text(
                "App improvements are in progress",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w700,
                    fontSize: isPhone ? 24.r : 27.r),
              ),
              subtitle: Text(
                "Appreciate your patience while we perform maintenance",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  height: 3,
                  fontSize: 12.r,
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
