import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../my_widgets/my_names.dart';
import '../../theme/my_color.dart';

class RecentPlayer extends StatelessWidget {
  const RecentPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 3.w, top: 3.h),
      children: List.generate(
        10,
        (index) => const RecentPlayerTile(),
      ),
    );
  }
}

class RecentPlayerTile extends StatelessWidget {
  const RecentPlayerTile();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.93,
      child: LayoutBuilder(
        builder: (_, p1) => Column(
          children: [
            Flexible(
              flex: 4,
              child: Stack(
                children: [
                  Positioned(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.72,
                    bottom: p1.maxWidth * 0.05,
                    child: const CircleAvatar(backgroundColor: iris),
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
                heightFactor: 0.87,
                widthFactor: 1,
                child: FittedBox(
                  child: Text(
                    myRandomName(),
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins',
                      color: spaceCadet,
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
