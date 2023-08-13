import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardTitleX extends StatelessWidget {
  const DashboardTitleX({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Text(
        "Recent Players",
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w900,
            fontSize: 10.8.w),
      ),
    );
  }
}
