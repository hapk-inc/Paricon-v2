import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../router/my_route.dart';
import '../../../values/colors.dart';

class DailyMatchBtn extends StatelessWidget {
  const DailyMatchBtn({super.key});

  @override
  Widget build(BuildContext context) => StaggeredGridTile.fit(
        crossAxisCellCount: 15,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ElevatedButton(
            style: const ButtonStyle(
                /*shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),*/
                backgroundColor: MaterialStatePropertyAll(jasper)),
            onPressed: () => context.router.push(const PlayTournamentRoute()),
            child: const Text("Play Now"),
          ),
        ),
      );
}
