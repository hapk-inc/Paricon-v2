import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class AppUpdatePage extends StatelessWidget {
  const AppUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: 360.r,
              child: Lottie.asset('lottie/app_update.json'),
            ),
            SizedBox.square(dimension: 30.r),
            ElevatedButton(
              onPressed: () => InAppUpdate.performImmediateUpdate().catchError(
                (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "An App Update is required",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 15.r),
                      ),
                    ),
                  );
                },
              ),
              child: Container(
                width: 240.w,
                height: 39.h,
                alignment: Alignment.center,
                child: Text(
                  "Update Available",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.r,
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
