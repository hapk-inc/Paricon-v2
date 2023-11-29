import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
            child: AnimatedDefaultTextStyle(
              style: tTheme.copyWith(
                color: majorelleBlue,
                fontSize: 24.r,
                fontFamily: 'WendyOne',
              ),
              duration: const Duration(milliseconds: 500),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: name,
                        style: TextStyle(fontSize: 30.r, letterSpacing: 0),
                      ),
                      TextSpan(text: " 👋", style: TextStyle(fontSize: 45.r))
                    ],
                  ),
                  key: ValueKey(name),
                  maxLines: 1,
                  minFontSize: 21,
                  maxFontSize: 45,
                  stepGranularity: 3,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
