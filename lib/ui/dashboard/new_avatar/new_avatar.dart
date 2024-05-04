import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/values/colors.dart';
import 'package:random_avatar/random_avatar.dart';

class NewAvatar extends ConsumerWidget {
  const NewAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      //alignment: Alignment.topCenter,
      child: StaggeredGrid.count(
        crossAxisCount: 15,
        children: [
          StaggeredGridTile.fit(
            crossAxisCellCount: 15,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              alignment: Alignment.centerLeft,
              child: Text("My Avatar", style: textTheme.titleSmall),
            ),
          ),
          Gap(7.5.r),
          StaggeredGridTile.fit(
            crossAxisCellCount: 15,
            child: AspectRatio(
              aspectRatio: 3.45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 15.w),
                children: List.generate(
                  5,
                  (index) => Container(
                    width: 120.w,
                    padding: EdgeInsets.all(12.r),
                    child: Card(
                      elevation: 1.2,
                      color: iconColor[index % 4],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                      child: Stack(
                        clipBehavior: Clip.antiAlias,
                        children: [
                          Positioned(
                            bottom: -12.r,
                            height: 90.h,
                            left: 0,
                            right: 0,
                            child: RandomAvatar(
                              mockString(),
                              trBackground: true,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
