import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import 'my_names.dart';

class TodayListView extends StatelessWidget {
  const TodayListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.all(8.0),
      child: ListView.builder(
        primary: true,
        itemCount: 4,
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) => FadeInRight(
          delay: Duration(milliseconds: mockInteger(100, 300)),
          child: const TodayListViewTile(),
        ),
      ),
    );
  }
}

class TodayListViewTile extends StatelessWidget {
  const TodayListViewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: [
          Colors.deepPurpleAccent,
          Colors.amberAccent.shade700,
          Colors.green.shade700
        ][0],
        /*border: Border(
          bottom: BorderSide(
            width: .2,
            color: Colors.deepPurple.shade50,
          ),
        ),*/
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: CircleAvatar(
                child: RandomAvatar(mockString()),
              ),
            ),
          ),
          SizedBox(width: 9.w),
          Flexible(
            flex: 5,
            child: FractionallySizedBox(
              heightFactor: 0.7,
              child: Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      //color: Colors.blue,
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        child: AutoSizeText(
                          myRandomName(),
                          style: TextStyle(
                            color: Colors.deepPurple.shade50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      //color: Colors.red,
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        child: AutoSizeText(
                          "India",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.deepPurple.shade100,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: FractionallySizedBox(
              heightFactor: 0.6,
              widthFactor: 1,
              child: Column(
                children: [
                  Flexible(
                    flex: 4,
                    child: Container(
                      //color: Colors.purple,
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        alignment: Alignment.centerRight,
                        child: AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: mockInteger(0, 2)
                                    .toString()
                                    .padLeft(2, '0'),
                                style: TextStyle(
                                  color: Colors.deepPurple.shade100,
                                ),
                              ),
                              TextSpan(
                                text: ": ${mockInteger(10, 45)}",
                                style:
                                    TextStyle(color: Colors.deepPurple.shade50),
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
                    child: Container(
                      //color: Colors.pink,
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        child: AutoSizeText(
                          "New Record",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.green.shade200,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
