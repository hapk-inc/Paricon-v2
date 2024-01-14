import 'package:animate_do/animate_do.dart';
import 'package:animated_emoji/animated_emoji.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/my_color.dart';

class DName extends StatelessWidget {
  final String name;
  const DName(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    final tTheme = Theme.of(context).textTheme.titleLarge!;

    return StaggeredGridTile.fit(
      crossAxisCellCount: 20,
      child: SlideInLeft(
        child: FadeIn(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Wrap(
              spacing: 9.r,
              children: [
                AnimatedDefaultTextStyle(
                  style: tTheme.copyWith(
                    color: violetBlue,
                    fontSize: 36.r,
                    fontFamily: 'WendyOne',
                    letterSpacing: 0,
                    fontWeight: FontWeight.w700,
                    //  fontWeight: FontWeight.w700,
                  ),
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: name),
                        ],
                      ),
                      key: ValueKey(name),
                      maxLines: 1,
                      minFontSize: 21,
                      maxFontSize: 36,
                      stepGranularity: 3,
                    ),
                  ),
                ),
                AnimatedEmoji(
                  AnimatedEmojis.smileWithBigEyes,
                  size: 45.r,
                  repeat: true,
                  animate: true,
                  onLoaded: (duration) {},
                  errorWidget: Icon(
                    FontAwesomeIcons.faceSmile,
                    size: 30.r,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
