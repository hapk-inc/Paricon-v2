import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../logic/app/ai_bloc.dart';
import '../../../logic/panel/bloc.dart';
import '../../../router/my_route.dart';
import '../../../values/colors.dart';
import '../../game_room/enter_code.dart';

class DPlayFriend extends ConsumerWidget {
  const DPlayFriend({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* final String? sub = ref.watch(subPlayFriendTextProvider).maybeWhen(
          data: (data) => data,
          orElse: () => null,
          //error: (error, stackTrace) => "Try multiplayer game",
        );*/
    final TextTheme textTheme = Theme.of(context).textTheme;
    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
        title: ListTile(
          tileColor: ghostWhite,
          title: AutoSizeText(
            "Play with Friends Online",
            style: textTheme.titleLarge?.copyWith(color: darkPurple),
            //maxLines: 2,
          ),
          subtitle: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "or Click here",
                      style: const TextStyle(color: cornellRed),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          ref.read(panelNotifierProvider.notifier).state =
                              const EnterCode();
                          ref.read(dashboardPanelControllerProvider).open();
                          // context.router.push(GameRoomRoute());
                        },
                    ),
                    const TextSpan(text: " to enter the room code"),
                  ],
                  style: textTheme.bodyMedium?.copyWith(color: gray),
                ),
                maxLines: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*subtitle: SizedBox(
          height: 105.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 54.h,
                padding: EdgeInsets.only(left: 15.w),
                decoration: BoxDecoration(
                  color: magnolia,
                  borderRadius: BorderRadius.circular(7.5.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7.5.r),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: AutoSizeText(
                          "Enter room code here. . .",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: hookerGreen),
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => context.router.push(const GameRoomRoute()),
                        child: Container(
                          height: double.maxFinite,
                          alignment: Alignment.center,
                          color: hookerGreen,
                          width: 120.w,
                          child: Text(
                            "CREATE ROOM",
                            style: textTheme.headlineMedium!.copyWith(
                              color: ghostWhite,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),*/
