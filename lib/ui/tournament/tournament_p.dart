import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/my_widgets/tournament_grid.dart';
import 'package:paricon/my_widgets/trophy_rank.dart';

class TournamentP extends ConsumerStatefulWidget {
  const TournamentP({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _TournamentPState();
}

class _TournamentPState extends ConsumerState<TournamentP> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xff9c0d38),
          height: 120.h,
          child: const _THeader(),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TournamentGrid(),
          ),
        ),
        Container(
          height: 60.h,
          color: Colors.green,
        ),
        Container(
          height: 40.h,
          color: Colors.pinkAccent,
        ),
      ],
    );
  }
}

class _THeader extends StatelessWidget {
  const _THeader();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, p1) => Stack(
          children: [
            Positioned(
              right: p1.maxWidth * 0.025,
              top: p1.maxHeight * 0.05,
              height: p1.maxHeight * 0.7,
              width: p1.maxWidth * 0.15,
              child: const TrophyRank(),
            ),
            Positioned(
              left: p1.maxWidth * 0.025,
              top: p1.maxHeight * 0.075,
              height: p1.maxHeight * 0.6,
              width: p1.maxWidth * 0.3,
              child: Container(
                alignment: Alignment.centerLeft,
                //color: Colors.red,
                padding: EdgeInsets.all(8.w),
                child: AutoSizeText(
                  mockInteger(1, 1000).toString().padLeft(2, '0'),
                  style: const TextStyle(fontFamily: 'LilitaOne'),
                  minFontSize: 36,
                  maxFontSize: 72,
                ),
              ),
            ),
            Positioned(
              left: p1.maxWidth * 0.3,
              top: p1.maxHeight * 0.2,
              width: p1.maxWidth * 0.4,
              height: p1.maxHeight * 0.4,
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      //color: Colors.green,
                      child: AutoSizeText(
                        "+3",
                        style: TextStyle(
                            color: Colors.green.shade700,
                            fontFamily: 'LilitaOne'),
                        minFontSize: 6,
                        maxFontSize: 12,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      //color: Colors.green,
                      child: AutoSizeText(
                        "3 in a row",
                        style: TextStyle(
                            color: Colors.amber.shade700,
                            fontFamily: 'LilitaOne'),
                        minFontSize: 6,
                        maxFontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: p1.maxWidth * 0.05,
              top: p1.maxHeight * 0.7,
              width: p1.maxWidth * 0.9,
              height: p1.maxHeight * 0.1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.w),
                child: const LinearProgressIndicator(value: 0.5),
              ),
            )
          ],
        ),
      );
}
