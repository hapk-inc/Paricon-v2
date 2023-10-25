import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../theme/my_color.dart';
import 'd_elevated_button_style.dart';

class PlayOnlineButton extends ConsumerWidget {
  const PlayOnlineButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.all(3.6.r),
      child: ElevatedButton(
        //onPressed: () => context.router.push(const TournamentRoute()),
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Coming Soon",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15.r,
              ),
            ),
          ),
        ),
        style: dashboardElevatedButtonStyle(darkPurple),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 4,
              child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 1,
                child: Container(
                  padding: EdgeInsets.all(10.5.r),
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Play with\nFriends\n",
                          style: TextStyle(
                            fontSize: 30.r,
                            height: 1.8,
                            fontFamily: 'DelaGothic',
                          ),
                        ),
                      ],
                      style: const TextStyle(color: persianOrange),
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
                child: Lottie.asset(
                  'lottie/friends-playing.json',
                  repeat: false,
                ),
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
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Coming Soon",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15.r,
              ),
            ),
          ),
        ),
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
                          text: "Play Sudden Match\n",
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
