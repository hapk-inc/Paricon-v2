import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../my_widgets/my_list_tile.dart';

@RoutePage()
class AppUpdatePage extends StatelessWidget {
  const AppUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
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
