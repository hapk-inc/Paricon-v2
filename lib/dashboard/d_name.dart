import 'package:animate_do/animate_do.dart';
import 'package:animated_emoji/animated_emoji.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class DName extends StatelessWidget {
  final String name;
  const DName(this.name, {super.key});

  @override
  Widget build(BuildContext context) => StaggeredGridTile.fit(
        crossAxisCellCount: 20,
        child: SlideInLeft(
          child: FadeIn(
            child: Container(
              height: 30.h,
              alignment: Alignment.bottomLeft,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                scrollDirection: Axis.horizontal,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: AutoSizeText(
                      name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Gap(12.r),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: AnimatedEmoji(
                      AnimatedEmojis.smileWithBigEyes,
                      size: 30.r,
                      repeat: true,
                      animate: true,
                      onLoaded: (duration) {},
                      errorWidget: Icon(FontAwesomeIcons.faceSmile, size: 30.r),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
