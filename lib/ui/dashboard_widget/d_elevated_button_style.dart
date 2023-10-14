import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ButtonStyle dashboardElevatedButtonStyle(Color btnColor, {double? r}) =>
    ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(btnColor),
      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(r ?? 7.5.r),
        ),
      ),
    );
