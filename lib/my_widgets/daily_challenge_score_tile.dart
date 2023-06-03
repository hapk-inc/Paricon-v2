import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../model/my_user.dart';

class DailyChallengeScoreTile extends StatelessWidget {
  final int rank;
  final MyUser myUser;
  final Duration tDuration;
  const DailyChallengeScoreTile(
      {Key? key,
      required this.rank,
      required this.myUser,
      required this.tDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String xDuration =
        ((tDuration.inMinutes * 60) + (tDuration.inSeconds)).toString();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.sp),
      decoration: const BoxDecoration(
        // color: Colors.indigo.shade50,
        border: Border(
          bottom: BorderSide(
            width: 0.25,
            color: Color(0xffbc9ec1),
          ),
        ),
      ),
      //height: 900.h * 0.1,
      child: LayoutBuilder(
        builder: (p0, p1) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 2,
              child: FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.5,
                child: Container(
                  padding: EdgeInsets.all(6.sp),
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: AutoSizeText.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                              text: "#",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.deepPurple)),
                          TextSpan(text: "$rank"),
                        ],
                      ),
                      style: const TextStyle(
                        fontFamily: 'LilitaOne',
                        //fontWeight: FontWeight.w100,
                        color: Colors.black54,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 1,
                child: Container(
                  padding: EdgeInsets.all(2.sp),
                  child: CircleAvatar(
                    backgroundColor: Colors
                        .primaries[mockInteger(0, Colors.primaries.length - 1)]
                        .shade100,
                    child: RandomAvatar(
                      myUser.avatar,
                      trBackground: true,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 8.sp, top: 1.sp, bottom: 1.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        heightFactor: 0.5,
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            myUser.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // if (subtitle != null && !subtitle!.isNotEmpty)

                    Flexible(
                      flex: 1,
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        heightFactor: 0.8,
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            "ID: ${myUser.id}",
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 4,
                    child: FractionallySizedBox(
                      widthFactor: 0.75,
                      heightFactor: 0.55,
                      child: FittedBox(
                        alignment: Alignment.centerRight,
                        child: AutoSizeText(
                          xDuration,
                          style: const TextStyle(
                            fontFamily: 'BrunoAceSC',
                            color: Colors.deepPurple,
                          ),
                        ),
                        /* child: AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: duration.inMinutes
                                      .toString()
                                      .padLeft(2, '0'),
                                  style:
                                      TextStyle(color: durationColor?.shade300),
                                ),
                                TextSpan(
                                  text:
                                      ": ${"${duration.inSeconds % 60}".padLeft(2, '0')}",
                                  style: TextStyle(
                                    color: durationColor?.shade700,
                                    //fontSize: 2.sp,
                                  ),
                                ),
                              ],
                            ),
                            style: const TextStyle(fontFamily: 'Orbitron'),
                          ),*/
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: FractionallySizedBox(
                      widthFactor: 0.75,
                      heightFactor: 0.55,
                      child: FittedBox(
                        alignment: Alignment.centerRight,
                        child: AutoSizeText(
                          (tDuration.inMilliseconds).toString(),
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w100,
                              color: Colors.black,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class DailyChallengeScoreTile1 extends StatelessWidget {
  final String timeStamp;
  final String avatarString;
  final String name;
  final String? subtitle;
  final Duration duration;
  final String? rank;
  final MaterialColor? durationColor;
  const DailyChallengeScoreTile1(
      {Key? key,
      required this.timeStamp,
      required this.avatarString,
      required this.name,
      this.subtitle,
      required this.duration,
      this.durationColor = Colors.deepOrange,
      this.rank})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 2.sp),
        decoration: BoxDecoration(
          // color: Colors.indigo.shade50,
          border: Border(
            bottom: BorderSide(
                width: 0.25,
                color: Colors
                    .primaries[mockInteger(0, Colors.primaries.length - 1)]
                    .shade400),
          ),
        ),
        //height: 900.h * 0.1,
        child: LayoutBuilder(
          builder: (p0, p1) => Row(
            children: [
              Flexible(
                flex: 2,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: Container(
                    padding: EdgeInsets.all(6.sp),
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: AutoSizeText(
                        timeStamp,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          //fontWeight: FontWeight.w100,
                          color: Colors.black54,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: Container(
                    padding: EdgeInsets.all(2.sp),
                    child: CircleAvatar(
                      backgroundColor: Colors
                          .primaries[
                              mockInteger(0, Colors.primaries.length - 1)]
                          .shade100,
                      child: RandomAvatar(
                        avatarString,
                        trBackground: true,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 6,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 8.sp, top: 1.sp, bottom: 1.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 3,
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          heightFactor: subtitle != null ? 0.5 : 0.4,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.deepPurple),
                            ),
                          ),
                        ),
                      ),
                      // if (subtitle != null && !subtitle!.isNotEmpty)
                      if (subtitle != null)
                        Flexible(
                          flex: 1,
                          child: FractionallySizedBox(
                            widthFactor: 1,
                            heightFactor: 0.8,
                            child: FittedBox(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                subtitle ?? "",
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 4,
                      child: FractionallySizedBox(
                        widthFactor: 0.75,
                        heightFactor: 0.75,
                        child: FittedBox(
                          alignment: Alignment.centerRight,
                          child: AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: duration.inMinutes
                                      .toString()
                                      .padLeft(2, '0'),
                                  style:
                                      TextStyle(color: durationColor?.shade300),
                                ),
                                TextSpan(
                                  text:
                                      ": ${"${duration.inSeconds % 60}".padLeft(2, '0')}",
                                  style: TextStyle(
                                    color: durationColor?.shade700,
                                    //fontSize: 2.sp,
                                  ),
                                ),
                              ],
                            ),
                            style: const TextStyle(fontFamily: 'Orbitron'),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        heightFactor: 0.75,
                        child: FittedBox(
                          alignment: Alignment.centerRight,
                          child: AutoSizeText(
                            ["1st", '2nd', '3rd'].elementAt(mockInteger(0, 2)),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w100,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
*/
