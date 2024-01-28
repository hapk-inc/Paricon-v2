import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';

import '../logic/auth_provider.dart';
import '../logic/my_names.dart';
import '../logic/room_id.dart';
import '../logic/room_provider.dart';
import '../model/local_icon.dart';
import '../model/local_player.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

class PlayFriendScoreboard extends ConsumerWidget {
  final Map<String, LocalIcon> xIcons;
  final Map<String, LocalPlayer> xPlayers;

  const PlayFriendScoreboard(this.xIcons, this.xPlayers, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pTheme = SlidingPanelTheme();
    final User? user = ref.watch(authUserProvider).value;

    return Container(
      decoration: BoxDecoration(
        color: majorelleBlue,
        borderRadius: pTheme.slidingPanelRadius,
      ),
      padding: pTheme.slidingPanelPadding,
      child: Column(
        children: [
          Gap(12.r),
          Container(
            height: 150.h,
            padding: EdgeInsets.all(3.r),
            child: Stack(
              children: [
                Positioned(
                  left: 0.r,
                  right: 120.r,
                  child: AutoSizeText(
                    "Congratulations ${myRandomName()} !!",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ghostWhite,
                      fontFamily: 'WendyOne',
                      fontSize: 21.r,
                      fontWeight: FontWeight.normal,
                    ),
                    maxLines: 1,
                  ),
                ),
                Positioned(
                  top: 0.r,
                  right: 0.r,
                  child: IconButton(
                    onPressed: () =>
                        ref.read(leaveRoomProvider.future).whenComplete(
                              () => ref.read(idNotifier.notifier).empty(),
                            ),
                    icon: const Icon(Icons.close, color: ghostWhite),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Lottie.asset(
                    'lottie/trophy.json',
                    width: 90.r,
                    height: 90.r,
                    fit: BoxFit.fill,
                  ),
                )
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
                        ["Normal", "Closed", "OrderWise"][mockInteger(0, 2)],
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
                    height: 120.h,
                    child: ListView(
                      children: List.generate(
                        2,
                        (index) => Container(
                          height: 54.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: index == 1
                                ? null
                                : Border(
                                    bottom: BorderSide(
                                      color: ghostWhite,
                                      width: 0.45.r,
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
                                ["2nd", '3rd'][mockInteger(0, 1)],
                                style: TextStyle(
                                    fontSize: 12.r,
                                    color: mistyRose,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            title: SizedBox(
                              height: 36.h,
                              width: 120.w,
                              child: AutoSizeText(
                                myRandomName(),
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
                                "${mockInteger(10, 20)}",
                                style: TextStyle(
                                  fontSize: 15.r,
                                  fontFamily: 'Montserrat',
                                  color: ghostWhite,
                                ),
                              ),
                            ),
                          ),
                        ),
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
