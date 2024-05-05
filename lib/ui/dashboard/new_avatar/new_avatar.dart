import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/values/colors.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../../logic/panel/bloc.dart';
import '../../../logic/user/bloc.dart';
import '../../../model/player.dart';
import '../../game_room/enter_code.dart';
import '../enter_avatar_code.dart';

class NewAvatar extends ConsumerWidget {
  const NewAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Player? player = ref.read(meProvider);
    final String code = player?.avatarCode ?? ref.read(newAvatarCodeProvider);
    return SingleChildScrollView(
      //alignment: Alignment.topCenter,
      child: StaggeredGrid.count(
        crossAxisCount: 15,
        children: [
          StaggeredGridTile.fit(
            crossAxisCellCount: 15,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              alignment: Alignment.centerLeft,
              child: Text("My Avatar", style: textTheme.titleSmall),
            ),
          ),
          Gap(7.5.r),
          StaggeredGridTile.fit(
            crossAxisCellCount: 15,
            child: AspectRatio(
              aspectRatio: 3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 15.w),
                children: List.generate(
                  5,
                  (index) {
                    final String str = mockString(1);
                    //final color = RandomA
                    return Container(
                      width: 105.w,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 4.5.w),
                      child: Card(
                        elevation: 1.2,
                        color: cardColor1[index % 4],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.8.r),
                        ),
                        child: Stack(
                          clipBehavior: Clip.antiAlias,
                          children: [
                            Positioned.fill(
                              bottom: -24.r,
                              left: 3.6.r,
                              right: 3.6.r,
                              child: RandomAvatar(str, trBackground: true),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Gap(7.5.r),
          StaggeredGridTile.fit(
            crossAxisCellCount: 15,
            child: AspectRatio(
              aspectRatio: 3.6,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                title: Container(
                  height: 45.h,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Referral Code",
                    style: textTheme.bodyMedium?.copyWith(height: 2.4),
                  ),
                ),
                subtitle: DottedBorder(
                  borderType: BorderType.RRect,
                  padding: EdgeInsets.zero,
                  dashPattern: [9.r, 4.5.r],
                  color: sepia,
                  strokeWidth: 0.45.r,
                  radius: Radius.circular(7.5.r),
                  child: Container(
                    height: 60.h,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (player != null)
                          Text(
                            code,
                            style: textTheme.displayLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: sepia,
                            ),
                          ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "TAP TO COPY",
                            style: textTheme.displayLarge?.copyWith(
                              fontSize: 13.5.r,
                              fontWeight: FontWeight.w600,
                              color: frenchGray,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Gap(15.r),
          StaggeredGridTile.fit(
            crossAxisCellCount: 15,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "or Click here",
                      style: const TextStyle(color: cornellRed),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          ref.read(panelNotifierProvider.notifier).state =
                              const EnterAvatarCode();
                          ref.read(dashboardPanelControllerProvider).open();
                          // context.router.push(GameRoomRoute());
                        },
                    ),
                    const TextSpan(text: " to enter the avatar code"),
                  ],
                  style: textTheme.bodyMedium?.copyWith(color: gray),
                ),
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
