import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TrophyRank extends StatelessWidget {
  const TrophyRank({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      //color: Colors.blue,
      child: LayoutBuilder(
        builder: (p0, p1) => Stack(
          children: [
            Center(
              child: Lottie.asset('assets/shining_trophy.json'),
            ),
            /*  Positioned(
              left: p1.maxWidth * 0.375,
              top: p1.maxHeight * 0.2,
              child: Center(
                child: Text(
                  "14",
                  style: TextStyle(
                      fontSize: p1.maxWidth * 0.25,
                      color: Color(0xff1f2232),
                      fontFamily: 'LilitaOne'),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
