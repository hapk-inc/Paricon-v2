import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/colors.dart';

class RoomHeader extends StatelessWidget {
  const RoomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        alignment: Alignment.centerLeft,
        child: Text(
          "Hosting the Game",
          style: textTheme.titleLarge?.copyWith(color: ghostWhite),
        ),
      ),
    );
  }
}
