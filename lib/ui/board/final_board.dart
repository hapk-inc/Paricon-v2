import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../logic/board/notifier.dart';
import '../../model/board.dart';
import '../../model/local_player.dart';
import '../../theme/sliding_panel.dart';
import '../../values/colors.dart';

final SlidingPanelTheme _pTheme = SlidingPanelTheme();

class FinalBoard extends ConsumerWidget {
  final Board board;
  const FinalBoard(this.board, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.2,
          child: Container(
            decoration: BoxDecoration(
              color: majorelleBlue,
              borderRadius: _pTheme.fullRadius30,
            ),
            padding: _pTheme.padding,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Results",
                      style: textTheme.titleMedium?.copyWith(color: ghostWhite),
                    ),
                    /*Text(
                      toBeginningOfSentenceCase(notifier.board?.type.name) ??
                          "Normal",
                      style: const TextStyle(color: ghostWhite),
                    )*/
                    IconButton(
                      onPressed: () => context.router.maybePop(),
                      icon: Icon(Icons.close, color: frenchGray, size: 21.r),
                    )
                  ],
                ),
                Gap(15.r),
                /*  AspectRatio(
                  aspectRatio: 3.6,
                  child: Lottie.asset(
                    'lottie/trophy.json',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Gap(15.r),*/
                DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: [15.r, 3.r],
                  color: ghostWhite,
                  radius: Radius.circular(7.5.r),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 15.h,
                  ),
                  strokeWidth: 0.9.r,
                  child: SizedBox(
                    width: 300.w,
                    child: Column(
                      children: List.generate(
                        board.players.length,
                        (index) {
                          final String id =
                              List.from(board.players.keys)[index];
                          final LocalPlayer player =
                              List.from(board.players.values)[index];
                          return AspectRatio(
                            aspectRatio: 7.5,
                            child: Center(
                              child: ListTile(
                                title: Text(
                                  player.name,
                                  style: textTheme.bodyMedium
                                      ?.copyWith(color: ghostWhite),
                                ),
                                trailing: SizedBox(
                                  width: 60.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (board.winners.contains(id)) ...[
                                        SizedBox.square(
                                          dimension: 24.r,
                                          child: Lottie.asset(
                                              'lottie/trophy.json'),
                                        ),
                                        Gap(7.5.r),
                                      ],
                                      Text(
                                        player.pts.toString().padLeft(2, '0'),
                                        style: textTheme.headlineLarge
                                            ?.copyWith(color: ghostWhite),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
