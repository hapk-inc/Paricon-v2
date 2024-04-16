import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:paricon/my_widget/staggered_9.dart';

import '../../my_widget/staggered_gap.dart';
import 'daily_match/daily_match_btn.dart';
import 'daily_match/tournament_text.dart';

class DailyMatch extends StatelessWidget {
  const DailyMatch({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: FadeIn(
          child: StaggeredGrid.count(
            crossAxisCount: 15,
            mainAxisSpacing: 15.r,
            children: const [
              StaggeredGap(),
              TournamentText(),
              StaggeredGap(),
              DailyMatchBtn(),
              // Staggered9(),
            ],
          ),
        ),
      );
}
