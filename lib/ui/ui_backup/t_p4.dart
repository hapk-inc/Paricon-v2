import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';

import '../../my_widgets/tournament_grid.dart';

class TournamentP extends ConsumerStatefulWidget {
  const TournamentP({super.key});

  @override
  ConsumerState createState() => _TournamentPState();
}

class _TournamentPState extends ConsumerState<TournamentP> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.h, left: 6.w, right: 6.w),
      child: Column(
        children: [
          SizedBox(
            height: 90.h,
            child: LayoutBuilder(
              builder: (context, p1) => Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: FractionallySizedBox(
                      heightFactor: 1,
                      widthFactor: 1,
                      child: Stack(
                        children: [
                          Positioned(
                            top: p1.maxHeight * 0.2,
                            left: 0,
                            width: p1.maxWidth * 0.3,
                            height: p1.maxHeight * 0.5,
                            child: FittedBox(
                              alignment: Alignment.centerLeft,
                              fit: BoxFit.fitWidth,
                              child: AutoSizeText.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "0${mockInteger(1, 5)}:",
                                      style: TextStyle(
                                        fontSize: p1.maxWidth * 0.02,
                                        color: const Color(0xff30292F),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "${mockInteger(10, 59)}",
                                      style: TextStyle(
                                        fontSize: p1.maxWidth * 0.02,
                                        color: const Color(0xff3F4045),
                                      ),
                                    ),
                                  ],
                                ),
                                style: const TextStyle(
                                  fontFamily: 'BrunoAceSC',
                                  //fontWeight: FontWeight.w700,
                                  color: Color(0xff1f271b),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: p1.maxWidth * 0.325,
                            width: p1.maxWidth * 0.2,
                            top: p1.maxHeight * 0.1,
                            height: p1.maxHeight * 0.275,
                            child: Container(
                              color: Colors.amber,
                            ),
                          ),
                          Positioned(
                            left: p1.maxWidth * 0.325,
                            width: p1.maxWidth * 0.3,
                            bottom: p1.maxHeight * 0.05,
                            height: p1.maxHeight * 0.275,
                            child: Container(
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      color: Colors.indigo,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 7.5.h),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TournamentGrid(),
            ),
          ),
          //SizedBox(height: 4.5.h),
          //SizedBox(height: 72.h),
          /* Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.w),
              border: Border.all(
                color: const Color(0xffE0777D),
                width: 1.w,
              ),
            ),
            height: 72.h,
            child: LayoutBuilder(
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
                            child:
                                RandomAvatar(mockString(), trBackground: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 0,
                      title: Container(
                        height: p1.maxHeight * 0.5,
                        margin: EdgeInsets.only(bottom: p1.maxHeight * 0.02),
                        //color: Colors.red,
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          child: AutoSizeText(
                            "0${mockInteger(1, 5)}:${mockInteger(10, 55)}",
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xff3F4045), fontSize: 72,
                              fontWeight: FontWeight.bold,
                              //decorationThickness: 40,
                            ),
                          ),
                        ),
                      ),
                      subtitle: Container(
                        height: p1.maxHeight * 0.25,
                        //color: Colors.amber,
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          child: AutoSizeText(
                            "Try to beat above scored by ${myRandomName()}",
                            style: const TextStyle(
                              color: Color(0xff30292F),
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
            ),
          ),*/
          Container(
            height: 3.h,
            //color: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }
}
