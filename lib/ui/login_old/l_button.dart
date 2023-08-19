import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LButton extends StatelessWidget {
  final num txtSize;
  final num hMargin;
  const LButton({super.key, this.txtSize = 12, this.hMargin = 15});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      /* onPressed: () => ref.read(gSignProvider.future).catchError(
                      (e, s) {
                        if (kDebugMode) {
                          print(e);
                        }
                        ref.read(anonymousProvider);
                      },
                    ),*/
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Color(0xff3e4d4a)),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.h)),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 9.h,
          horizontal: (hMargin).w,
        ),
        child: AnimatedDefaultTextStyle(
          style: TextStyle(fontSize: (txtSize).sp),
          duration: const Duration(milliseconds: 500),
          child: const Text("Get started"),
        ),
      ),
    );
  }
}
