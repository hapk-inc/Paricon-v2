import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:lottie/lottie.dart';

import '../logic/firebase_init.dart';
import '../my_widgets/my_list_tile.dart';

@RoutePage()
class AppUpdatePage extends ConsumerWidget {
  const AppUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final appUpdate = ref.watch(inAppUpdateProvider).value;
    return Scaffold(
      backgroundColor: const Color(0xff724cf9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300.w,
              child: Lottie.asset('assets/app_update.json'),
            ),
            const Space20(),
            ElevatedButton(
              onPressed: () => InAppUpdate.performImmediateUpdate().catchError(
                (e) => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: AutoSizeText(
                      "An App Update is required",
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                    ),
                  ),
                ),
              ),
              child: Container(
                width: 240.w,
                height: 45.h,
                alignment: Alignment.center,
                child: const Text(
                  "Update Available",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
