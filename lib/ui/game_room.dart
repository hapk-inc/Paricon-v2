import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mock_data/mock_data.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../values/colors.dart';
import '../logic/panel/bloc.dart';
import '../logic/room/bloc.dart';
import '../logic/room/create_room.dart';
import '../model/room.dart';
import '../my_widget/create_room.dart';
import '../theme/sliding_panel.dart';

@RoutePage()
class GameRoomPage extends ConsumerStatefulWidget {
  const GameRoomPage({super.key});

  @override
  ConsumerState createState() => _GameRoomPageState();
}

final SlidingPanelTheme _panelTheme = SlidingPanelTheme();

class _GameRoomPageState extends ConsumerState<GameRoomPage> {
  late PanelController panelController;
  //late RoomNotifier notifier;
  late Room? room;

  @override
  void initState() {
    panelController = ref.read(roomPanelControllerProvider);
    //ref.read(matchNotifierProvider.notifier).state = GameMatch.playFriend;
    // notifier = ref.refresh(roomNotifierProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
/*    room = ref.watch(roomProvider).value;
    final user = ref.watch(authUserProvider).value;
    final isMeCreator = room?.creator == user?.uid;

    ref.listen(
      roomProvider.select((value) => value.value),
      (previous, next) async {
        if (next?.started ?? false) {
          if (isMeCreator) {
            debugPrint("57--CreateBoard");
          }
          context.router.replace(const PlayFriendRoute());
        }
      },
    );*/

    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: majorelleBlue,
      appBar: AppBar(
        toolbarHeight: 60.h,
        backgroundColor: majorelleBlue,
        leading: InkWell(
          onTap: () => context.router.maybePop(),
          child: const Icon(Icons.arrow_back, color: ghostWhite),
        ),
        // iconTheme: IconThemeData(color: ghostWhite,),
        elevation: 0,
      ),
      body: ProviderScope(
        child: SafeArea(
          bottom: false,
          child: SlidingUpPanel(
            controller: panelController,
            panel: AnimatedContainer(
              duration: const Duration(milliseconds: 450),
              child: ref.watch(panelNotifierProvider),
            ),
            borderRadius: _panelTheme.panelRadius,
            backdropEnabled: true,
            color: _panelTheme.slidingPanelColor,
            maxHeight: 360.r,
            defaultPanelState: PanelState.CLOSED,
            padding: _panelTheme.padding,
            isDraggable: false,
            minHeight: 0,
            onPanelClosed: () {
              final Room i = ref.read(createRoomNotifierProvider);
              if (room != i) {
                ref.read(
                    updateRoomProvider(i.copyWith(players: room?.players)));
              }
            },
            body: Stack(
              children: [
                Positioned(
                  bottom: Theme.of(context).appBarTheme.toolbarHeight,
                  left: 15.w,
                  right: 15.w,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(darkPurple),
                    ),
                    onPressed: () {},
                    child: const Text("Let's Start"),
                  ),
                ),
                Align(
                  heightFactor: 1.5,
                  alignment: Alignment.center,
                  child: Container(
                    height: 480.h,
                    width: 330.w,
                    decoration: BoxDecoration(
                      color: ghostWhite,
                      borderRadius: BorderRadius.circular(7.5.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: StaggeredGrid.count(
                      crossAxisCount: 15,
                      children: [
                        const StaggeredGridTile.count(
                          crossAxisCellCount: 15,
                          mainAxisCellCount: 0.3,
                          child: SizedBox(),
                        ),
                        const CreateRoom(Room()),
                        const StaggeredGridTile.count(
                          crossAxisCellCount: 15,
                          mainAxisCellCount: 1.5,
                          child: SizedBox(),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 15,
                          mainAxisCellCount: 2.4,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 18.w),
                            // color: frenchGray,
                            alignment: Alignment.center,
                            child: ListTile(
                              leading: const Icon(
                                Icons.groups_2,
                                size: 30,
                                color: charcoal,
                              ),
                              horizontalTitleGap: 15.w,
                              title: Text(mockString(36)),
                              titleTextStyle: textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        const StaggeredGridTile.count(
                          crossAxisCellCount: 15,
                          mainAxisCellCount: 1.5,
                          child: SizedBox(),
                        ),
                        const StaggeredGridTile.fit(
                          crossAxisCellCount: 15,
                          child: Divider(
                            indent: 7.5,
                            endIndent: 7.5,
                            color: frenchGray,
                            thickness: 0.75,
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 15,
                          mainAxisCellCount: 1.5,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Meeting code",
                              style: textTheme.headlineMedium
                                  ?.copyWith(color: gray),
                            ),
                          ),
                        ),
                        const StaggeredGridTile.count(
                          crossAxisCellCount: 15,
                          mainAxisCellCount: 0.3,
                          child: SizedBox(),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 15,
                          mainAxisCellCount: 2.4,
                          child: Container(
                            color: magnolia,
                            alignment: Alignment.center,
                            child: AnimatedFlipCounter(
                              value: mockInteger(100000, 999999),
                              textStyle: const TextStyle(
                                letterSpacing: 15,
                                fontFamily: 'RussoOne',
                                fontSize: 30,
                                color: darkPurple,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            /*body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RoomHeader(),
                Expanded(
                  flex: 7,
                  child: room == null
                      ? Container()
                      : FadeInUp(
                          child: SlideInUp(
                            child: Container(
                              decoration: BoxDecoration(
                                color: ghostWhite,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15.r),
                                ),
                              ),
                              child: RoomBody(room!),
                            ),
                          ),
                        ),
                )
              ],
            ),*/
          ),
        ),
      ),
    );
  }
}
