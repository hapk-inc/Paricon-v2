import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/board_provider.dart';
import '../logic/panel_provider.dart';
import '../logic/play_friend_listener.dart';
import '../logic/room_id.dart';
import '../logic/s_size.dart';
import '../model/board.dart';
import '../model/local_icon.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

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
              //top: false,
              //bottom: false,
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
    final playFriendNotifier = ref.read(playFriendNotifierProvider);
    final Board? board = playFriendNotifier.board;

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
                        //mainAxisCellCount: 31.5,
                        child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 15.r),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.5.r),
                          ),
                          elevation: 3.r,
                          child: SizedBox(
                            // height: c.maxWidth * 1.5,
                            height: (360.w * 1.5),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Flexible(
                                  flex: 2,
                                  child: PlayFriendTimer(),
                                ),
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
    return Container(
      //color: Colors.green.shade200,
      padding: EdgeInsets.only(left: 15.w),
      alignment: Alignment.centerLeft,
      child: Text(
        "It's your turn",
        style: TextStyle(
          fontFamily: 'Poppins',
          color: gray,
          fontWeight: FontWeight.w400,
          fontSize: 15.r,
        ),
      ),
    );
  }
}

class PlayFriendTimer extends ConsumerWidget {
  const PlayFriendTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
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
                          value: mockInteger(100, 500),
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
                          value: Duration(
                                seconds: mockInteger(100, 3000),
                              ).inSeconds %
                              60,
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
              tween: Tween<double>(begin: 0, end: mockInteger(1, 100) * 0.01
                  // end: tournamentListener.balancePercentage,
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

class PlayFriendList extends StatelessWidget {
  final List<dynamic> players;
  const PlayFriendList(this.players, {super.key});

  @override
  Widget build(BuildContext context) => Container(
        color: ghostWhite,
        height: 72.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.from(players.map((e) => PlayFriendListTile(e))),
        ),
      );
}

class PlayFriendListTile extends ConsumerWidget {
  final String playerId;
  const PlayFriendListTile(this.playerId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Board? board = ref.watch(boardProvider).value;
    return board == null
        ? Container()
        : ref.watch(playFriendPlayerProvider(playerId)).when(
            data: (d) => AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: (360.w / board.players.length),
                  margin: EdgeInsets.symmetric(horizontal: 1.5.r),
                  decoration: BoxDecoration(
                    color:
                        List.from([...gridColor, cyclamen], growable: true)[0],
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
                                d.name,
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
                                value: d.pts,
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
                        child: d.avatar.isEmpty
                            ? Container()
                            : Opacity(
                                opacity: 0.45,
                                child: RandomAvatar(
                                  d.avatar,
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
    List<Widget> tiles = List.generate(
      icons.length,
      (index) {
        final String id = List.from(icons.keys)[index];
        final LocalIcon icon = List.from(icons.values)[index];
        return ref.watch(iconProvider(id)).when(
              data: (x) => _PlayFriendGridTile(id, x),
              error: (_, s) {
                debugPrintStack(stackTrace: s);
                return Container();
              },
              loading: () => _PlayFriendGridTile(id, icon),
            );
      },
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      //padding: EdgeInsets.all(15.r),
      child: ResponsiveGridList(
        shrinkWrap: true,
        listViewBuilderOptions: ListViewBuilderOptions(
          physics: const NeverScrollableScrollPhysics(),
        ),
        minItemWidth: 1.w,
        minItemsPerRow: 7,
        horizontalGridSpacing: 7.2.r,
        verticalGridSpacing: 7.2.r,
        horizontalGridMargin: 0,
        verticalGridMargin: 0,
        maxItemsPerRow: 7,
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

    return AspectRatio(
      aspectRatio: 1,
      child: FadeIn(
        delay: Duration(milliseconds: mockInteger(20, 50) * 20),
        child: AnimatedContainer(
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
                ? (localIcon.iconNo.isEven ? majorelleBlue : majorelleBlue)
                : gridColor[mockInteger(0, 2)],
            margin: EdgeInsets.zero,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.5.r),
            ),
            child: InkWell(
              //onTap: tListener.inWait || localIcon.checkFound
              onTap: playFriendNotifier.inWait || localIcon.checkFound
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
                        size: 30.r,
                        color: federalBlue,
                      )
                    : localIcon.isCheck
                        ? Icon(
                            IconData(
                              localIcon.iconCode,
                              fontFamily: 'MaterialIcons',
                            ),
                            size: 30.r,
                            color: ghostWhite,
                          )
                        : Container(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
