import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/ui/tournament/g_icons.dart';
import 'package:responsive_grid/responsive_grid.dart';

class TournamentGridRevised extends StatelessWidget {
  const TournamentGridRevised({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, p2) {
        // print("Remaining Height");
        // print(-(p2.maxHeight / 11) + (p1.maxHeight * 0.7));
        return ResponsiveGridList(
          desiredItemWidth: p2.maxWidth / 9.1,
          minSpacing: 4.5.w,
          shrinkWrap: true,
          //squareCells: true,
          scroll: false,
          // minItemWidth: 30,
          children: List.generate(
            72,
            (index) => AspectRatio(
              aspectRatio: 1,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                transform: Matrix4.rotationZ(
                  (Random.secure().nextBool()
                          //(!tournamentNotifier.icons[index].checkFound()
                          ? (Random.secure().nextBool() ? -pi : pi)
                          : -pi) /
                      (Random.secure().nextBool() ? 60 : 45),
                  /*(tournamentNotifier.icons[index].checkFound()
                          ? 60
                          : 45),*/
                ),
                child: Card(
                  elevation: 8,
                  margin: EdgeInsets.all(360.w * 0.001),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(360.w * 0.01),
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      color: [
                        //const Color(0xff2A6041),
                        //const Color(0xff66101F),
                        //const Color(0xff433A3F),
                        //const Color(0xff4B2142),
                        //const Color(0xff20063B),
                        //const Color(0xff104547),

                        //
                        //Color(0xffBAA898),
                        //Color(0xff13C4A3),
                        //Color(0xffFFE45E),
                        //Color(0xffEFC3E6),

                        //
                        const Color(0xff214e89),
                        const Color(0xffefa802),
                        const Color(0xffd170e5),
                        const Color(0xffebf7a5),
                      ][mockInteger(0, 3)],
                      borderRadius: BorderRadius.circular(360.w * 0.01),
                    ),
                    padding: EdgeInsets.all(p2.maxWidth * 0.015),
                    child: FittedBox(child: Icon(gIcons[index])),
                  ),
                  // child: Text(index.toString()),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
