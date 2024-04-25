import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:badges/badges.dart' as badge;

import '../../model/local_player.dart';
import '../../values/colors.dart';
import '../../values/names.dart';

class LocalPlayerTile extends ConsumerWidget {
  final String id;
  final LocalPlayer localPlayer;
  const LocalPlayerTile(this.id, this.localPlayer, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 96.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          badge.Badge(
            badgeStyle: const badge.BadgeStyle(badgeColor: jasper),
            badgeContent: CircleAvatar(
              radius: 12.r,
              backgroundColor: Colors.transparent,
              child: AnimatedFlipCounter(
                value: localPlayer.pts ?? 0,
                wholeDigits: 2,
                textStyle: GoogleFonts.russoOne(
                  textStyle: TextStyle(
                    fontSize: 15.r,
                    height: 0,
                    fontWeight: FontWeight.w700,
                    color: ghostWhite,
                  ),
                ),
              ),
            ),
            child: CircleAvatar(radius: 36.r),
          ),
          Gap(7.5.r),
          Text(
            localPlayer.name ?? NameGen.dummyName(),
            style: const TextStyle(color: ghostWhite),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
