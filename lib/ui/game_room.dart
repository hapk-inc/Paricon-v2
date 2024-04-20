import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../values/colors.dart';
import '../logic/panel/bloc.dart';
import '../theme/sliding_panel.dart';
import 'game_room/room_body.dart';
import 'game_room/room_header.dart';

@RoutePage()
class GameRoomPage extends ConsumerStatefulWidget {
  const GameRoomPage({super.key});

  @override
  ConsumerState createState() => _GameRoomPageState();
}

final SlidingPanelTheme _panelTheme = SlidingPanelTheme();

class _GameRoomPageState extends ConsumerState<GameRoomPage> {
  late PanelController panelController;

  @override
  void initState() {
    panelController = ref.read(settingsPanelControllerProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: hookerGreen,
        appBar: AppBar(
          toolbarHeight: 60.h,
          backgroundColor: hookerGreen,
          elevation: 0,
        ),
        body: SafeArea(
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
            onPanelClosed: () {},
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RoomHeader(),
                Expanded(
                  flex: 7,
                  child: FadeInUp(
                    child: SlideInUp(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ghostWhite,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15.r),
                          ),
                        ),
                        child: const RoomBody(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
