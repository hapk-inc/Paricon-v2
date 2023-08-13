import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../my_widgets/my_names.dart';

class RecentPlayers extends StatelessWidget {
  const RecentPlayers({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 3.w, top: 3.h),
      children: List.generate(
        10,
        (index) => const _RecentPlayerTile(),
      ),
    );
  }
}

class _RecentPlayerTile extends StatelessWidget {
  const _RecentPlayerTile();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.925,
      child: LayoutBuilder(
        builder: (_, p1) => Column(
          children: [
            Flexible(
              flex: 4,
              child: Stack(
                children: [
                  Positioned(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.7,
                    bottom: p1.maxWidth * 0.05,
                    child: const CircleAvatar(
                      backgroundColor: Color(0xff724cf9),
                    ),
                  ),
                  Positioned(
                    bottom: p1.maxWidth * 0.075,
                    height: p1.maxHeight * 0.8,
                    width: p1.maxWidth,
                    child: RandomAvatar(mockString(), trBackground: true),
                  )
                ],
              ),
            ),
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 0.85,
                widthFactor: 1,
                child: FittedBox(
                  child: AutoSizeText(
                    myRandomName(),
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xff1f2232),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
