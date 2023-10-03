import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: 360.r,
              child: Lottie.asset('lottie/error_404.json'),
            ),
            Text(
              "Sorry for the inconvenience",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18.r,
              ),
            )
          ],
        ),
      ),
    );
  }
}
