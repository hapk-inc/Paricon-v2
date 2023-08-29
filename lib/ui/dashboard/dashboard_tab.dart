import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardT extends StatelessWidget {
  const DashboardT({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 60.w, color: Colors.red),
        Expanded(child: Container(color: Colors.blue)),
      ],
    );
  }
}
