import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Staggered9 extends StatelessWidget {
  const Staggered9({super.key});

  @override
  Widget build(BuildContext context) => StaggeredGridTile.fit(
        crossAxisCellCount: 15,
        child: SizedBox(
          height: (Theme.of(context).appBarTheme.toolbarHeight ?? 135) * 1.5,
        ),
      );
}
