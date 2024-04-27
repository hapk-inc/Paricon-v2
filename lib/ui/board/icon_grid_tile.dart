import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:mock_data/mock_data.dart';

import '../../logic/app/game_match_bloc.dart';
import '../../logic/auth/bloc.dart';
import '../../logic/board/board_icons.dart';
import '../../logic/board/notifier.dart';
import '../../logic/board/provider.dart';
import '../../model/local_icon.dart';
import '../../values/colors.dart';

BorderRadius get _radius => BorderRadius.circular(3.6.r);
Logger _logger = Logger();

class IconGridTile extends ConsumerWidget {
  final String id;
  const IconGridTile(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BoardNotifier boardNotifier = ref.watch(boardNotifierProvider);
    final User? user = ref.read(authUserProvider).value;
    final bool isDailyMatch =
        ref.read(matchNotifierProvider.notifier).isDailyMatch;
    final LocalIcon? localIcon = boardNotifier.board?.icons[id];

    if (localIcon == null) return Container();

    final bool checkFound = localIcon.checkFound;

    final double randomPi = mockInteger(0, 1) == 0 ? pi : -pi;

    final Color random = iconColor[mockInteger(0, 2)];

    final Color initColor = isDailyMatch ? random : majorelleBlue;

    final Color color = (localIcon.isFound ?? false)
        ? (localIcon.color ?? initColor)
        : initColor;

    Color iColor;
    if (isDailyMatch) {
      iColor = localIcon.isFound ?? false ? ghostWhite : charcoal;
    } else {
      iColor = localIcon.isFound ?? false ? charcoal : ghostWhite;
    }

    final double rotation =
        (!checkFound ? randomPi : -pi) / (checkFound ? 60 : 45);

    return AspectRatio(
      aspectRatio: 1,
      child: AnimatedContainer(
        transform: Matrix4.rotationZ(rotation),
        duration: const Duration(milliseconds: 600),
        child: Card(
          color: color,
          elevation: 1.5.r,
          shape: RoundedRectangleBorder(borderRadius: _radius),
          child: ClipRRect(
            borderRadius: _radius,
            child: InkWell(
              onTap: !boardNotifier.wait &&
                      !checkFound &&
                      boardNotifier.board?.currentID == user?.uid
                  ? () async => boardNotifier.iconClick(id)
                  : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                color: color,
                padding: EdgeInsets.all(7.5.r),
                child: checkFound
                    ? FadeIn(
                        key: ValueKey("$id $checkFound"),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Icon(
                            boardIcon[localIcon.iconCode],
                            color: iColor,
                          ),
                        ),
                      )
                    : Container(key: ValueKey("$id $checkFound")),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
