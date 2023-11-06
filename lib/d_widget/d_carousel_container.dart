import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/my_color.dart';

class CarouselContainer extends StatelessWidget {
  final Widget mChild;
  const CarouselContainer({required this.mChild, super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(right: 7.5.w),
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: lightOrange,
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        child: mChild,
      );
}
