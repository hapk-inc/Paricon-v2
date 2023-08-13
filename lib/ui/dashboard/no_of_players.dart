import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';

class NoOfPlayers extends StatelessWidget {
  const NoOfPlayers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.sp),
      //color: Colors.green,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: FittedBox(
              child: AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${mockInteger(10, 100)}",
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: const Color(0xff942911),
                      ),
                    ),
                    TextSpan(
                      text: " ${mockInteger(10, 50)}%",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xff9D8420),
                      ),
                    ),
                  ],
                ),
                style: const TextStyle(
                  fontFamily: 'LilitaOne',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          SizedBox(height: 3.h),
          Flexible(
            child: FittedBox(
              child: Text(
                "Overall Players",
                style: TextStyle(
                  fontSize: 9.sp,
                  color: const Color(0xff1A1B25),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
