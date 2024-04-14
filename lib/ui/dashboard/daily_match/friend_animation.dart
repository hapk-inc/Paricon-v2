import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';

class FriendAnimation extends StatelessWidget {
  const FriendAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: AspectRatio(
        aspectRatio: 1.05,
        child: Lottie.asset(
          'lottie/friends-playing.json',
        ),
      ),
    );
  }
}
