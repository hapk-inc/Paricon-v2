import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../router/my_route.dart';
import '../../theme/my_color.dart';
import 'd_elevated_button_style.dart';

class PlayOnlineButton extends StatelessWidget {
  const PlayOnlineButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.6.r),
      child: ElevatedButton(
        onPressed: () => context.router.push(const TournamentRoute()),
        style: dashboardElevatedButtonStyle(russianViolet),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 1,
                child: Container(
                  padding: EdgeInsets.all(10.5.r),
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Play with Friends\n",
                          style: TextStyle(
                            fontSize: 21.r,
                            height: 1.8,
                            color: azure,
                            fontFamily: 'DelaGothic',
                          ),
                        ),
                        TextSpan(
                          text: "Compete and Connect",
                          style: TextStyle(
                            fontSize: 12.r,
                            height: 2.4,
                            color: azure,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 1,
                child: Lottie.asset('lottie/friends-playing.json'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayWithStranger extends StatelessWidget {
  const PlayWithStranger({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.r),
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(xWhite),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.5.r),
            ),
          ),
          side: MaterialStatePropertyAll(
            BorderSide(
              color: spaceCadet,
              width: 0.45.r,
            ),
          ),
        ),
        //style: dashboardElevatedButtonStyle(barnRed),
        onPressed: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 1,
                child: Lottie.asset(
                  'lottie/online-players.json',
                  repeat: false,
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.45.r),
                  child: AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Play with Strangers\n",
                          style: TextStyle(
                            fontSize: 21.r,
                            height: 1.8,
                            color: caribbeanCurrent,
                            fontFamily: 'DelaGothic',
                          ),
                        ),
                        TextSpan(
                          text: "Compete in the Stranger Zone",
                          style: TextStyle(
                              fontSize: 12.r,
                              height: 2.1,
                              fontWeight: FontWeight.w300,
                              color: caribbeanCurrent,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
