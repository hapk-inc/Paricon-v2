import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/theme/my_color.dart';

import '../logic/s_size.dart';
import '../my_widget/build_app_bar.dart';

@RoutePage()
class TournamentPage extends ConsumerWidget {
  const TournamentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    return Scaffold(
      appBar: buildAppBar(sSize, context),
      backgroundColor: majorelleBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 20,
            children: [
              StaggeredGridTile.count(
                  crossAxisCellCount: 20,
                  mainAxisCellCount: 3,
                  child: SizedBox()),
              StaggeredGridTile.count(
                crossAxisCellCount: 20,
                mainAxisCellCount: 27,
                child: Card(
                  color: mintCream,
                  margin: EdgeInsets.symmetric(horizontal: 18.r),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.5.r),
                  ),
                  child: Column(
                    children: [
                      const Flexible(
                        flex: 3,
                        child: ShowTimerIndicator(),
                      ),
                      Expanded(
                        flex: 16,
                        child: Container(color: barnRed),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShowTimerIndicator extends ConsumerWidget {
  const ShowTimerIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    final isPhone = sSize == ScreenSize.phone;
    return LayoutBuilder(
      builder: (_, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                height: p1.maxHeight * 0.45,
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      // const TextSpan(text: " "),
                      WidgetSpan(child: SizedBox(width: 7.5.w)),
                      WidgetSpan(
                        child: Icon(Icons.timer, size: 24.r),
                      ),
                      WidgetSpan(child: SizedBox(width: 4.5.w)),
                      TextSpan(text: "${mockInteger(1, 10)}".padLeft(2, '0')),
                      const TextSpan(text: ":"),
                      TextSpan(text: "${mockInteger(1, 59)}".padLeft(2, '0')),
                    ],
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                      fontSize: isPhone ? 18.r : 18.r,
                      color: barnRed,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7.5.w),
            margin: EdgeInsets.symmetric(vertical: 7.5.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3.w),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey.shade300,
                value: mockInteger(1, 100) * 0.01,
                minHeight: 4.5.h,
              ),
            ),
          )
        ],
      ),
    );
  }
}
