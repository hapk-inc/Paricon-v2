import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paricon/logic/auth.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DashboardW extends ConsumerWidget {
  const DashboardW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Container(
          width: 60,
          color: Colors.deepPurple.shade100,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.rightFromBracket,
                  size: 32,
                  color: Colors.deepPurple,
                ),
                onPressed: () => ref.read(signOutProvider),
              )
            ],
          ),
        ),
        const Expanded(child: __DashboardW()),
      ],
    );
  }
}

class __DashboardW extends StatelessWidget {
  const __DashboardW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(3.w),
      /*child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 20,
          mainAxisSpacing: 6.h,
          crossAxisSpacing: 3.w,
          children: [
            const StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 2,
              child: ColoredBox(color: Colors.pink),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 12,
              child: ColoredBox(color: Colors.pink),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 3,
              child: ColoredBox(color: Colors.pink),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 3,
              child: ColoredBox(color: Colors.pink),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 3,
              child: ColoredBox(color: Colors.pink),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 10,
              mainAxisCellCount: 3,
              child: ColoredBox(color: Colors.pink),
            ),
          ],
        ),
      ),*/
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            xs: 6,
            //md: 12,
            //xl: 20,
            //lg: 80,
            //Horizontal sm: 3,
            child: Container(
              height: 200,
              alignment: Alignment(0, 0),
              color: Colors.purple,
              child: Text("lg : 12"),
            ),
          ),
          ResponsiveGridCol(
            xs: 6,
            //sm: 2,

            //lg: 22,
            //md: 3,
            child: Container(
              height: 100,
              alignment: const Alignment(0, 0),
              color: Colors.green,
              child: const Text("xs : 6 \r\nmd : 3"),
            ),
          ),
          ResponsiveGridCol(
            xs: 6,
            //md: 3,
            child: Container(
              height: 100,
              alignment: Alignment(0, 0),
              color: Colors.orange,
              child: Text("xs : 6 \r\nmd : 3"),
            ),
          ),
          ResponsiveGridCol(
            xs: 6,
            md: 3,
            child: Container(
              height: 100,
              alignment: Alignment(0, 0),
              color: Colors.red,
              child: Text("xs : 6 \r\nmd : 3"),
            ),
          ),
          ResponsiveGridCol(
            xs: 6,
            md: 3,
            child: Container(
              height: 100,
              alignment: Alignment(0, 0),
              color: Colors.blue,
              child: Text("xs : 6 \r\nmd : 3"),
            ),
          ),
        ],
      ),
    );
  }
}
