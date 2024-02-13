import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../logic/room_id.dart';
import '../logic/room_provider.dart';
import '../model/board.dart';
import '../model/local_player.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

class PlayFriendScoreboard extends ConsumerWidget {
  final Board board;

  const PlayFriendScoreboard(this.board, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pTheme = SlidingPanelTheme();

    final List<LocalPlayer> players = board.players.values.toList();
    players.sort((a, b) => b.pts.compareTo(a.pts));

    final List<LocalPlayer> winners = List<LocalPlayer>.from(players)
        .where((x) => x.pts == players.first.pts)
        .toList();

    final List<LocalPlayer> others =
        // players.toSet().difference(winners.toSet()).toList();
        players.toSet().toList();

    debugPrint("Players $players");
    debugPrint("Winners $winners");

    //final MapEntry winner = board.icons.

    return Container(
      decoration: BoxDecoration(
        color: majorelleBlue,
        borderRadius: pTheme.slidingPanelRadius,
      ),
      padding: pTheme.slidingPanelPadding,
      child: Column(
        children: [
          //Gap(12.r),
          Container(
            height: 54.h,
            //color: cornellRed,
            padding: EdgeInsets.all(3.r),
            child: Stack(
              children: [
                Positioned(
                  top: 0.r,
                  right: 0.r,
                  child: IconButton(
                    onPressed: () =>
                        ref.read(leaveRoomProvider.future).whenComplete(
                              () => ref.read(idNotifier.notifier).empty(),
                            ),
                    icon: Icon(
                      Icons.close,
                      color: ghostWhite,
                      size: 21.r,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Scoreboard",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 15.r,
                              color: mistyRose,
                              fontFamily: 'Montserrat',
                            ),
                      ),
                      AutoSizeText(
                        firstCaps(board.type.name),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 12.r,
                              color: mistyRose,
                              fontFamily: 'Poppins',
                            ),
                      ),
                    ],
                  ),
                ),
                Gap(15.r),
                DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: [9.r, 4.5.r],
                  color: ghostWhite,
                  strokeWidth: 1,
                  child: SizedBox(
                    height: 60.h * (others.length),
                    child: ListView(
                      children: List.generate(
                        others.length,
                        (index) {
                          LocalPlayer i = others[index];
                          return Container(
                            height: 54.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: index == 1 || others.length == 1
                                  ? null
                                  : Border(
                                      bottom: BorderSide(
                                        color: ghostWhite,
                                        width: 0.15.r,
                                      ),
                                    ),
                            ),
                            child: ListTile(
                              leading: Container(
                                constraints:
                                    BoxConstraints.tight(Size(54.r, 30.r)),
                                decoration: BoxDecoration(
                                  color: violetBlue,
                                  borderRadius: BorderRadius.circular(7.5.r),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  ['1st', '2nd', ''][index],
                                  style: TextStyle(
                                    fontSize: 12.r,
                                    color: mistyRose,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                              title: SizedBox(
                                height: 36.h,
                                width: 120.w,
                                child: AutoSizeText(
                                  firstCaps(i.name),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 24.r,
                                    color: ghostWhite,
                                  ),
                                ),
                              ),
                              trailing: Container(
                                alignment: Alignment.center,
                                constraints:
                                    BoxConstraints.tight(Size(60.w, 36.r)),
                                child: Text(
                                  "${i.pts}",
                                  style: TextStyle(
                                    fontSize: 15.r,
                                    fontFamily: 'Montserrat',
                                    color: ghostWhite,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
