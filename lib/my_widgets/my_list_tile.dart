import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyListTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final String subtitle;
  const MyListTile(
      {required this.leading,
      this.title = "Welcome",
      this.subtitle = "Hope you had a great day",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, p1) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  height: p1.maxHeight,
                  left: -p1.maxWidth * 0.05,
                  bottom: -p1.maxHeight * 0.075,
                  width: p1.maxWidth * 0.4,
                  child: CircleAvatar(
                    radius: p1.maxHeight,
                    backgroundColor: Colors.transparent,
                    child: leading,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 0,
              title: Container(
                height: 50.h,
                //color: Colors.red,
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  child: AutoSizeText(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white60, fontSize: 72,
                      //decorationThickness: 40,
                    ),
                  ),
                ),
              ),
              subtitle: Container(
                height: 20.h,
                //color: Colors.amber,
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  child: AutoSizeText(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
