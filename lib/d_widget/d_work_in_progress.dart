import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/my_color.dart';

class DashboardWorkInProgress extends StatelessWidget {
  const DashboardWorkInProgress({super.key, required this.inWork});

  final String inWork;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeIn(
            delay: const Duration(seconds: 1),
            child: AutoSizeText(
              inWork,
              wrapWords: false,
              style: TextStyle(
                fontSize: 90.r,
                fontFamily: 'DelaGothic',
                fontWeight: FontWeight.w900,
                color: jasper,
                height: 1.5,
              ),
            ),
          ),
          SizedBox(height: 9.r),
          FadeIn(
            delay: const Duration(seconds: 3),
            child: Text(
              "Appreciate your patience",
              style: TextStyle(
                fontFamily: 'Cabin',
                fontSize: 18.r,
                fontWeight: FontWeight.w300,
                color: jasper,
                height: 2.1,
                letterSpacing: .3.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
