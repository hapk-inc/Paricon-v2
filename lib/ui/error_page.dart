import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../my_widgets/my_list_tile.dart';

@RoutePage()
class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300.w,
              child: Lottie.asset('assets/error_404.json'),
            ),
            const Space20(),
            Container(
              width: 240.w,
              height: 45.h,
              alignment: Alignment.center,
              child: const Text(
                "Sorry for the inconvenience",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
