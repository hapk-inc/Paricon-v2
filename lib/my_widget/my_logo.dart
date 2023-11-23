import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) => Image.asset(
        'images/pi2.png',
        fit: BoxFit.fitWidth,
        width: 360.w,
      );
}
