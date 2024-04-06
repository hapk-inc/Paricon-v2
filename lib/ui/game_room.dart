import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:paricon/router/my_route.dart';

import '../enums/enums.dart';
import '../logic/app/size_provider.dart';
import '../my_widget/staggered_gap.dart';
import '../values/colors.dart';
import 'my_theme.dart';

@RoutePage()
class GameRoomPage extends ConsumerWidget {
  const GameRoomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final ScreenSize screenSize = ref.watch(sizeProvider);
    final bool isP = SizeNotifier(screenSize).isP;

    final double appH = Theme.of(context).appBarTheme.toolbarHeight ?? 120.h;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: appH * 0.75,
        backgroundColor: ghostWhite,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "ENTER ROOM CODE",
              style: textTheme.headlineMedium?.copyWith(color: majorelleBlue),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: StaggeredGrid.count(
            crossAxisCount: 15,
            children: [
              StaggeredGridTile.fit(
                crossAxisCellCount: 15,
                child: ListTile(
                  title: ListTile(
                    tileColor: ghostWhite,
                    title: AutoSizeText(
                      "Host Game",
                      style: textTheme.titleLarge?.copyWith(color: violetBlue),
                      maxLines: 1,
                    ),
                  ),
                  subtitle: Text(
                    "Enter the room code (or) start your own game",
                    //"and invite friends",
                    style:
                        textTheme.bodyMedium?.copyWith(color: tropicalIndigo),
                    //maxLines: 2,
                  ),
                ),
              ),
              Gap(15.h),
              StaggeredGridTile.count(
                crossAxisCellCount: 15,
                mainAxisCellCount: 8.4,
                child: Card(
                  color: magnolia1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: magnolia1,
                      borderRadius: BorderRadius.circular(3.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) => AspectRatio(
                          aspectRatio: 7.5,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: index != 3
                                  ? Border(
                                      bottom: BorderSide(
                                          color: frenchGray, width: 0.3.r),
                                    )
                                  : null,
                            ),
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15.w),
                              title: Text(
                                [
                                  "Players",
                                  "Board Level",
                                  "Board Type",
                                  "Public",
                                ][index],
                              ),
                              titleTextStyle:
                                  textTheme.bodyMedium?.copyWith(color: gray),
                              leadingAndTrailingTextStyle: textTheme
                                  .headlineSmall
                                  ?.copyWith(color: charcoal),
                              trailing: Container(
                                decoration: BoxDecoration(
                                  color: lavender,
                                  borderRadius: BorderRadius.circular(4.5.r),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.5.r,
                                  vertical: 4.8.r,
                                ),
                                child: Text(
                                  ["vs", "Beginner", "Normal", "ON"][index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Gap(24.h),
              StaggeredGridTile.fit(
                crossAxisCellCount: 15,
                child: ElevatedButton(
                  onPressed: () =>
                      context.router.replace(const PlayFriendRoute()),
                  child: const Text("Create Game"),
                ),
              ),
              StaggeredGridTile.fit(
                crossAxisCellCount: 15,
                child: Divider(height: 30.h, thickness: 0.15.r, color: gray),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 15,
                mainAxisCellCount: 15,
                child: Container(
                  color: magnolia,
                  padding: EdgeInsets.all(7.5.r),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 7.5,
                        child: ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15.w),
                          titleTextStyle:
                              textTheme.bodyLarge?.copyWith(color: gray),
                          title: Text(
                            "Players",
                            style: TextStyle(fontSize: 15.r),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )

              /* StaggeredGridTile.fit(
                  crossAxisCellCount: 15, child: TextFormField())*/
            ],
          ),
        ),
      ),
    );
  }
}

final SlidingPanelTheme _panelTheme = SlidingPanelTheme();
/*

class GameRoom extends ConsumerStatefulWidget {
  const GameRoom({super.key});

  @override
  ConsumerState createState() => _GameRoomState();
}

class _GameRoomState extends ConsumerState<GameRoom> {
  @override
  void initState() {
    super.initState();
    final String? id = ref.read(idNotifier);
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: _panelTheme.slidingPanelRadius,
      ),
      //padding: _panelTheme.slidingPanelPadding,
      child: ClipRRect(
        borderRadius: _panelTheme.slidingPanelRadius,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Text("${mockInteger(100000, 999999)}"),
            Gap(15.r),
            GridTileBar(
              title: AutoSizeText(
                "${NameGen.dummyName()} created this room",
                style: textTheme.titleSmall,
              ),
              subtitle: const Text("ss"),
            ),
            SizedBox(
              height: 105,
              child: LayoutBuilder(
                builder: (_, constraints) => ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 15.r),
                  children: List.generate(
                    3,
                    (index) => Container(
                      width: 120.w,
                      alignment: Alignment.centerLeft,
                      padding: _panelTheme.slidingPanelPadding,
                      margin: EdgeInsets.only(right: 15.w),
                      decoration: BoxDecoration(
                          color: magnolia,
                          borderRadius: BorderRadius.circular(7.5.r)),
                      child: ListTile(
                        //isThreeLine: true,
                        title: Container(
                          alignment: Alignment.centerLeft,
                          height: constraints.maxHeight * 0.18,
                          child: Text(
                            NameGen.dummyName(),
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.titleSmall?.copyWith(
                              color: charcoal,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        subtitle: ListTile(
                          title: Container(
                            alignment: Alignment.centerLeft,
                            height: constraints.maxHeight * 0.15,
                            child: AutoSizeText(
                              mockString(4),
                              style: textTheme.bodySmall?.copyWith(
                                  color: tropicalIndigo, height: 1.8),
                              //maxLines: 2,
                            ),
                          ),
                          subtitle: Text(
                            mockString(4),
                            style: textTheme.bodyMedium
                                ?.copyWith(color: tropicalIndigo),
                            //maxLines: 2,
                          ),
                        ),
                      ),
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
*/

/*  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: _panelTheme.slidingPanelRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: _panelTheme.slidingPanelPadding,
            title: ListTile(
              title: AutoSizeText(
                "#${mockInteger(100000, 999999)}",
                style: textTheme.headlineLarge?.copyWith(
                  color: charcoal,
                  fontSize: 24.r,
                  height: 1.5,
                ),
                maxLines: 1,
              ),
            ),
            subtitle: Text(
              mockString(24),
              style: textTheme.bodyMedium?.copyWith(color: tropicalIndigo),
            ),
          ),
          Divider(thickness: 0.45.r, color: frenchGray, height: 0.3.r),
          ListTile(
            title: Padding(
              padding: _panelTheme.slidingPanelPadding,
              child: const Text("Players"),
            ),
            subtitle: SizedBox(
              height: 96,
              child: LayoutBuilder(
                builder: (_, constraints) => ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 15.r),
                  children: List.generate(
                    3,
                    (index) => Container(
                      width: 120.w,
                      alignment: Alignment.centerLeft,
                      padding: _panelTheme.slidingPanelPadding,
                      margin: EdgeInsets.only(right: 15.w),
                      decoration: BoxDecoration(
                          color: magnolia,
                          borderRadius: BorderRadius.circular(7.5.r)),
                      child: ListTile(
                        //isThreeLine: true,
                        title: Container(
                          alignment: Alignment.centerLeft,
                          height: constraints.maxHeight * 0.18,
                          child: AutoSizeText(
                            NameGen.dummyName(),
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.titleSmall?.copyWith(
                              color: charcoal,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        subtitle: ListTile(
                          title: Container(
                            alignment: Alignment.centerLeft,
                            height: constraints.maxHeight * 0.15,
                            child: AutoSizeText(
                              mockString(4),
                              style: textTheme.bodySmall?.copyWith(
                                  color: tropicalIndigo, height: 1.8),
                              //maxLines: 2,
                            ),
                          ),
                          subtitle: Text(
                            mockString(4),
                            style: textTheme.bodyMedium
                                ?.copyWith(color: tropicalIndigo),
                            //maxLines: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          FilledButton(
              onPressed: () {
                context.router.push(const PlayFriendRoute());
              },
              child: const Text("Start Game"))
        ],
      ),
      // color: violetBlue,
    );
  }*/
