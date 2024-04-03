import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';

import '../logic/room/id.dart';
import '../values/colors.dart';
import '../values/names.dart';
import 'my_theme.dart';

@RoutePage()
class GameRoomPage extends ConsumerWidget {
  const GameRoomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

final SlidingPanelTheme _panelTheme = SlidingPanelTheme();

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

            Padding(
              padding: _panelTheme.slidingPanelPadding,
              child: GridTileBar(
                title: Text(
                  "${NameGen.dummyName()} created this room",
                  style: textTheme.titleSmall,
                ),
                subtitle: Text("ss"),
              ),
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
          ],
        ),
      ),
    );
  }
}

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
