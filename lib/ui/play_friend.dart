import 'dart:math';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';

import 'package:random_avatar/random_avatar.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/auth_provider.dart';
import '../logic/board_provider.dart';
import '../logic/dashboard_panel_provider.dart';
import '../logic/game_setup_provider.dart';
import '../logic/panel_provider.dart';
import '../logic/play_friend_listener.dart';
import '../logic/room_id.dart';
import '../logic/room_level_notifier.dart';
import '../logic/room_provider.dart';
import '../logic/s_size.dart';
import '../logic/user_provider.dart';
import '../model/board.dart';
import '../model/local_icon.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';
import 'play_friend_scoreboard.dart';

@RoutePage()
class PlayFriendPage extends ConsumerWidget {
  const PlayFriendPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SlidingPanelTheme pTheme = SlidingPanelTheme();
    final ScreenSize sSize = ref.read(sizeProvider);

    return Scaffold(
      backgroundColor: majorelleBlue,
      appBar: null,
      /* appBar: kIsWeb
          ? null
          : Platform.isAndroid
              ? AppBar(
                  backgroundColor: majorelleBlue,
                  iconTheme: const IconThemeData(color: ghostWhite),
                )
              : null,*/
      body: sSize != ScreenSize.phone
          ? Container()
          : SafeArea(
              child: SlidingUpPanel(
                isDraggable: false,
                controller: ref.watch(playFriendPanelProvider),
                backdropColor: richBlack,
                backdropEnabled: true,
                backdropOpacity: 0.9,
                borderRadius: pTheme.slidingPanelRadius,
                minHeight: 0,
                maxHeight: pTheme.slidingPanelHeight,
                panel: Container(),
                body: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: ref.watch(boardProvider).when(
                        data: (board) => board == null
                            ? Container()
                            : const __PlayFriendBoard(),
                        error: (e, s) {
                          debugPrintStack(stackTrace: s);
                          return Container();
                        },
                        loading: () => Container(),
                      ),
                ),
              ),
            ),
    );
  }
}

class __PlayFriendBoard extends ConsumerWidget {
  const __PlayFriendBoard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playFriendNotifier = ref.watch(playFriendNotifierProvider);
    final Board? board = playFriendNotifier.board;
    final String? currentID = ref.watch(currentIDProvider).value;
    final dNotifier = ref.watch(dashboardPanelNotifierProvider);
    final xIcons = playFriendNotifier.icons;
    final xPlayers = playFriendNotifier.players;

    ref.listen(
      playFriendNotifierProvider.select((p) => p.balancePercentage),
      (previous, next) {
        if (next == 1.0) {
          Future.delayed(const Duration(milliseconds: 750), () {
            final Board b = Board(
                currentID: currentID ?? "",
                players: xPlayers,
                icons: xIcons,
                type: board!.type);
            dNotifier.dWidget = PlayFriendScoreboard(b);
            ref.read(updateStatsProvider(b).future).catchError(
              (e, s) {
                debugPrint(e.toString());
                debugPrintStack(stackTrace: s);
              },
            );
            context.router.pop();
          });
        }
      },
    );

    return board == null
        ? Container()
        : LayoutBuilder(
            builder: (_, c) {
              return Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: StaggeredGrid.count(
                    crossAxisCount: 20,
                    children: [
                      Gap(45.r),
                      StaggeredGridTile.fit(
                        crossAxisCellCount: 20,
                        child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 15.r),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.5.r),
                          ),
                          elevation: 3.r,
                          child: SizedBox(
                            height: 360.w * 1.5,
                            child: Column(
                              children: [
                                const Flexible(
                                    flex: 2, child: PlayFriendTimer()),
                                //Gap(45.r),
                                Expanded(
                                  flex: 11,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: _PlayFriendGrid(board.icons),
                                  ),
                                ),
                                //Spacer()
                                const Flexible(child: PlayFriendFooter())
                              ],
                            ),
                          ),
                        ),
                      ),
                      Gap(30.r),
                      StaggeredGridTile.fit(
                        crossAxisCellCount: 20,
                        child: PlayFriendList(board.players.keys.toList()),
                      )
                    ],
                  ),
                ),
              );
            },
          );
  }
}

class PlayFriendFooter extends ConsumerWidget {
  const PlayFriendFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(authUserProvider).value;
    final String? currentID = ref.watch(currentIDProvider).value;
    final playFriendNotifier = ref.read(playFriendNotifierProvider);
    return currentID == null ||
            playFriendNotifier.players.isEmpty ||
            user == null
        ? Container()
        : AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            key: ValueKey(currentID),
            child: Container(
              padding: EdgeInsets.only(left: 15.w),
              alignment: Alignment.centerLeft,
              child: Text(
                user.uid == currentID
                    ? "Your turn"
                    : "${playFriendNotifier.players[currentID]?.name}'s turn",
                style: TextStyle(
                  fontFamily: 'WendyOne',
                  color: playFriendNotifier.colorMap[
                      playFriendNotifier.players[currentID]!.color]['icon'],
                  fontWeight: FontWeight.w300,
                  fontSize: 18.r,
                ),
              ),
            ),
          );
  }
}

class PlayFriendTimer extends ConsumerWidget {
  const PlayFriendTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playFriendNotifier = ref.watch(playFriendNotifierProvider);
    final Duration gDuration = playFriendNotifier.stopwatch.elapsed;
    return Container(
      alignment: Alignment.centerLeft,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.r),
        dense: true,
        title: Container(
          height: 72.h,
          alignment: Alignment.centerLeft,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            title: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        size: 30.r,
                        color: amaranthPurple,
                      ),
                      SizedBox.square(dimension: 7.5.r),
                      AnimatedFlipCounter(
                        value: gDuration.inMinutes,
                        suffix: " : ",
                        wholeDigits: 2,
                        textStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w900,
                          fontSize: 18.r,
                          color: amaranthPurple,
                          letterSpacing: 0.12.r,
                        ),
                      ),
                      SizedBox.square(dimension: 1.5.r),
                      AnimatedFlipCounter(
                        value: gDuration.inSeconds % 60,
                        wholeDigits: 2,
                        textStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w900,
                          fontSize: 18.r,
                          color: amaranthPurple,
                          letterSpacing: 0.12.r,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            trailing: InkWell(
              onTap: () {
                context.router.pop();
                ref.read(idNotifier.notifier).empty();
              },
              child: Icon(Icons.close, size: 24.r),
            ),
          ),
        ),
        subtitle: ClipRRect(
          borderRadius: BorderRadius.circular(3.r),
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            tween: Tween<double>(
              begin: 0,
              end: playFriendNotifier.balancePercentage,
            ),
            builder: (_, value, __) => LinearProgressIndicator(
              value: value,
              color: majorelleBlue,
              backgroundColor: periwinkle,
              minHeight: 4.5.r,
            ),
          ),
        ),
      ),
    );
  }
}

class PlayFriendList extends StatelessWidget {
  final List<dynamic> players;
  const PlayFriendList(this.players, {super.key});

  @override
  Widget build(BuildContext context) => Container(
        color: ghostWhite,
        height: 72.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.from(
            players.map(
              (e) => PlayFriendListTile(e),
            ),
          ),
        ),
      );
}

class PlayFriendListTile extends ConsumerWidget {
  final String playerId;
  const PlayFriendListTile(this.playerId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Board? board = ref.watch(boardProvider).value;
    final playFriendNotifier = ref.watch(playFriendNotifierProvider);

    ref.listen(
      playFriendPlayerProvider(playerId).select((value) => value.value),
      (previous, next) {
        debugPrint("New Player");
        if (next != null) {
          playFriendNotifier.setPlayer(playerId, next);
        }
      },
    );

    return board == null
        ? Container()
        : ref.watch(playFriendPlayerProvider(playerId)).when(
            data: (player) => AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: (360.w / board.players.length),
                  margin: EdgeInsets.symmetric(horizontal: 1.5.r),
                  decoration: BoxDecoration(
                    color: playFriendNotifier.colorMap[player.color]['tile'],
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        top: -4.5.h,
                        child: Container(
                          alignment: Alignment.center,
                          child: ListTile(
                            dense: true,
                            title: Container(
                              height: 30.h,
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                player.name,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0,
                                  color: richBlack,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.r,
                                ),
                                minFontSize: 9,
                                maxFontSize: 12,
                                maxLines: 1,
                                wrapWords: false,
                              ),
                            ),
                            subtitle: Container(
                              height: 36.h,
                              alignment: Alignment.centerLeft,
                              child: AnimatedFlipCounter(
                                value: player.pts,
                                wholeDigits: 2,
                                textStyle: TextStyle(
                                  fontSize: 24.r,
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 0.9.r,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        bottom: -105.r,
                        duration: const Duration(milliseconds: 500),
                        left: 30.r,
                        top: 7.5.r,
                        right: -30.r,
                        child: player.avatar.isEmpty
                            ? Container()
                            : Opacity(
                                opacity: 0.45,
                                child: RandomAvatar(
                                  player.avatar,
                                  trBackground: true,
                                ),
                              ),
                      )
                    ],
                  ),
                ),
            error: (_, s) => Container(),
            loading: () => Container());
  }
}

class _PlayFriendGrid extends ConsumerWidget {
  final Map<String, LocalIcon> icons;
  const _PlayFriendGrid(this.icons);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final room = ref.watch(roomProvider).value;
    final setup =
        GameSetup(level: room == null ? RoomLevel.medium : room.level);
    List<Widget> tiles = List.generate(
      icons.length,
      (index) {
        final String id = List.from(icons.keys)[index];
        //final LocalIcon icon = List.from(icons.values)[index];
        return ref.watch(iconProvider(id)).when(
              data: (x) => _PlayFriendGridTile(id, x),
              error: (_, s) {
                debugPrintStack(stackTrace: s);
                return Container();
              },
              loading: () => Container(),
            );
      },
    );

    return Container(
      //color: chocolateCosmos,
      alignment: Alignment.center,
      constraints: BoxConstraints.tight(Size.square(setup.containerSize)),
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      //padding: EdgeInsets.all(15.r),
      child: ResponsiveGridList(
        listViewBuilderOptions: ListViewBuilderOptions(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        ),
        minItemWidth: 1.r,
        minItemsPerRow: 2,
        horizontalGridSpacing: setup.gapSpacing(icons.length),
        verticalGridSpacing: setup.gapSpacing(icons.length),
        horizontalGridMargin: 0,
        verticalGridMargin: 0,
        maxItemsPerRow: setup.gridRow(icons.length),
        children: tiles,
      ),
    );
  }
}

class _PlayFriendGridTile extends ConsumerWidget {
  final String id;
  final LocalIcon localIcon;
  const _PlayFriendGridTile(this.id, this.localIcon);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playFriendNotifier = ref.watch(playFriendNotifierProvider);

    if (playFriendNotifier.board == null) return Container();
    final Map<String, LocalIcon> icons = playFriendNotifier.board!.icons;
    if (icons.isEmpty) return Container();
    final User? user = ref.watch(authUserProvider).value;
    final String? currentID = ref.watch(currentIDProvider).value;

    ref.listen(
      iconProvider(id).select((data) => data.value),
      (previous, next) {
        if (next!.isFound) {
          ref.read(playFriendNotifierProvider).setIcon(id, next);
        }
      },
    );

    final setUp = GameSetup();

    final iconSize = setUp.iconSize(icons.length);

    return AspectRatio(
      aspectRatio: 1,
      child: user == null || currentID == null
          ? Container()
          : AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              transform: Matrix4.rotationZ(
                (!localIcon.checkFound
                        ? (mockInteger(0, 1) == 0 ? -pi : pi)
                        : -pi) /
                    (localIcon.checkFound ? 60 : 45),
              ),
              child: Card(
                color: !localIcon.isFound
                    //? (mockInteger(0, 1) == 0 ? federalBlue : violetBlue)
                    ? majorelleBlue
                    : playFriendNotifier.colorMap[localIcon.color]['tile'],
                margin: EdgeInsets.zero,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.5.r),
                ),
                child: InkWell(
                  //onTap: tListener.inWait || localIcon.checkFound
                  onTap: playFriendNotifier.inWait ||
                          localIcon.checkFound ||
                          user.uid != currentID
                      ? null
                      : () => playFriendNotifier.iconClick(id),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: localIcon.isFound
                        ? Icon(
                            IconData(
                              localIcon.iconCode,
                              fontFamily: 'MaterialIcons',
                            ),
                            size: iconSize,
                            color: federalBlue,
                          )
                        : localIcon.isCheck
                            ? Icon(
                                IconData(
                                  localIcon.iconCode,
                                  fontFamily: 'MaterialIcons',
                                ),
                                size: iconSize,
                                color: ghostWhite,
                              )
                            : Container(),
                  ),
                ),
              ),
            ),
    );
  }
}
