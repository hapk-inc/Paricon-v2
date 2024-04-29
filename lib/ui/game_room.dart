import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../enums/enums.dart';
import '../logic/app/game_match_bloc.dart';
import '../logic/board/provider.dart';
import '../logic/panel/bloc.dart';
import '../logic/room/bloc.dart';
import '../model/room.dart';
import '../my_widget/create_room.dart';
import '../router/my_route.dart';
import '../theme/sliding_panel.dart';
import '../values/colors.dart';
import 'game_room/room_widget.dart';

@RoutePage()
class GameRoomPage extends ConsumerStatefulWidget {
  //final bool isEnterCode;
  //const GameRoomPage({required this.isEnterCode, super.key});
  const GameRoomPage({super.key});

  @override
  ConsumerState createState() => _GameRoomPageState();
}

final SlidingPanelTheme _panelTheme = SlidingPanelTheme();

class _GameRoomPageState extends ConsumerState<GameRoomPage> {
  late PanelController panelController;
  late Room? room;

  @override
  void initState() {
    panelController = ref.read(roomPanelControllerProvider);
    ref.read(joinRoomProvider);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Room? room = ref.watch(roomProvider).value;
    return Scaffold(
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
      backgroundColor: majorelleBlue,
      body: SafeArea(
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
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: room == null ? Container() : RoomWidget(room),
          ),
        ),
      ),
    );
  }
}
