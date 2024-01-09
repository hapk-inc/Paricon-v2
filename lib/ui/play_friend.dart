import 'dart:io';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
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
import '../logic/my_names.dart';
import '../logic/panel_provider.dart';
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
      appBar: kIsWeb
          ? null
          : Platform.isAndroid
              ? AppBar(
                  backgroundColor: majorelleBlue,
                  iconTheme: const IconThemeData(color: ghostWhite),
                )
              : null,
      body: sSize != ScreenSize.phone
          ? Container()
          : SafeArea(
              top: false,
              bottom: false,
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
                            : __PlayFriendBoard(board),
                        error: (_, s) {
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

class __PlayFriendBoard extends StatelessWidget {
  final Board board;
  const __PlayFriendBoard(this.board);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 31.5,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 15.r),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              elevation: 3.r,
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      constraints: const BoxConstraints.expand(),
                      alignment: Alignment.centerLeft,
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.r),
                        title: SizedBox(
                          height: 60.h,
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        size: 24.r,
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
                                                    seconds:
                                                        mockInteger(100, 3000))
                                                .inSeconds %
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
                              },
                              child: Icon(Icons.close, size: 21.r),
                            ),
                          ),
                        ),
                        subtitle: ClipRRect(
                          borderRadius: BorderRadius.circular(3.r),
                          child: TweenAnimationBuilder<double>(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                            tween: Tween<double>(
                                begin: 0, end: mockInteger(1, 100) * 0.01
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
                    ),
                  ),
                  Expanded(
                    flex: 11,
                    child: _PlayFriendGrid(board.icons),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.green.shade200,
                    ),
                  )
                ],
              ),
            ),
          ),
          Gap(30.r),
          const StaggeredGridTile.fit(
            crossAxisCellCount: 20,
            child: PlayFriendList(),
          )
        ],
      ),
    );
  }
}

class PlayFriendList extends StatelessWidget {
  const PlayFriendList({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 72.h,
      color: ghostWhite,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...List.generate(
            3,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 120.w,
              margin: EdgeInsets.symmetric(horizontal: 1.5.r),
              decoration: BoxDecoration(
                color: List.from([...lightColors, cyclamen],
                    growable: true)[index],
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
                          height: 27.h,
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            myRandomName(),
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
                        subtitle: AutoSizeText(
                          mockInteger(1, 20).toString(),
                          style: TextStyle(
                            fontSize: 24.r,
                            fontFamily: 'Montserrat',
                            letterSpacing: 0.9.r,
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
                    child: Opacity(
                      opacity: 0.45,
                      child: RandomAvatar(
                        mockString(),
                        trBackground: true,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PlayFriendGrid extends ConsumerWidget {
  final List icons;
  const _PlayFriendGrid(this.icons);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> tiles = List.from(
      icons.map(
        (e) => ref.watch(iconProvider(e)).when(
              data: (x) => _PlayFriendGridTile(e, x),
              error: (_, s) => Container(),
              loading: () => Container(),
            ),
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      child: ResponsiveGridList(
        listViewBuilderOptions: ListViewBuilderOptions(
          physics: const NeverScrollableScrollPhysics(),
        ),
        minItemWidth: 1.w,
        minItemsPerRow: 7,
        horizontalGridSpacing: 7.5.w,
        verticalGridSpacing: 9.h,
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
    //final tListener = ref.watch(tournamentListenerNotifierProvider);
    //final xIcon = tListener.icons[localIcon.iconNo];
    //final showIcon = xIcon.checkFound;

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
                ? (mockInteger(0, 1) == 0 ? majorelleBlue : violetBlue)
                : [
                    ...[aquamarine, uranianBlue],
                    ...[aquamarine, uranianBlue],
                    ...[xantHous],
                    //...[rosePompadour, xantHous],
                  ][mockInteger(0, 4)],
            //: [teaGreen, peach, lavenderPink][mockInteger(0, 2)],
            //: [lapisLazuli, pear, bitterSweet, orangePeel][mockInteger(0, 3)],
            margin: EdgeInsets.zero,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.5.r),
            ),
            child: InkWell(
              //onTap: tListener.inWait || localIcon.checkFound
              onTap: (mockInteger(0, 1) == 0) || localIcon.checkFound
                  ? null
                  : () {
                      //debugPrint(xIcon.iconCode.toString());
                      //debugPrint(xIcon.iconNo.toString());
                      //debugPrint(xIcon.toString());
                      //tListener.iconClick(xIcon);
                    },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: localIcon.isFound
                    ? Icon(
                        IconData(
                          localIcon.iconCode,
                          fontFamily: 'MaterialIcons',
                        ),
                        size: 27.r,
                        color: ghostWhite,
                      )
                    : localIcon.isCheck
                        ? Icon(
                            IconData(
                              localIcon.iconCode,
                              fontFamily: 'MaterialIcons',
                            ),
                            size: 27.r,
                            color: coyote,
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
