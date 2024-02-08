import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/user_provider.dart';
import 'package:paricon/theme/my_theme.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/my_names.dart';
import '../model/my_user.dart';
import '../model/pass_avatar.dart';
import '../theme/my_color.dart';

class PassAvatarListTile extends ConsumerWidget {
  final PassAvatar passAvatar;
  const PassAvatarListTile(this.passAvatar, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();

    MyUser? fromUser = ref
        .watch(xUserProvider(passAvatar.from))
        .maybeWhen(orElse: () => null, data: (data) => data);

    MyUser? toUser = ref
        .watch(xUserProvider(passAvatar.to))
        .maybeWhen(orElse: () => null, data: (data) => data);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      margin: EdgeInsets.symmetric(vertical: 1.5.r),
      decoration: BoxDecoration(
        color: mockInteger(0, 9) == 9
            ? gridColor[mockInteger(0, 2)].withOpacity(1)
            : null,
        borderRadius: BorderRadius.circular(3.r),
      ),
      alignment: Alignment.center,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 4.5.r),
        leadingAndTrailingTextStyle: TextStyle(
          fontFamily: 'Montserrat',
          color: gray,
          fontSize: 12.r,
        ),
        dense: true,
        //isThreeLine: true,
        subtitleTextStyle: TextStyle(fontSize: 9.r),
        //subtitle: Text("ss"),
        horizontalTitleGap: 1.5.r,
        leading: Container(
          constraints: BoxConstraints.tight(Size(60.w, 30.h)),
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Icon(
                Icons.timer_outlined,
                size: 15.r,
                color: drabDarkBrown,
              ),
              Gap(4.5.r),
              AutoSizeText(
                // "${mockInteger(1, 12).toString().padLeft(2, '0')}: ${mockInteger(1, 59).toString().padLeft(2, '0')} PM",
                now.day == passAvatar.createdAt.day
                    ? DateFormat.Hm().format(passAvatar.createdAt)
                    : DateFormat.MMMd().format(passAvatar.createdAt),
                stepGranularity: 1.5,
                overflow: TextOverflow.ellipsis,
                minFontSize: 6,
                maxFontSize: 9,
              ),
            ],
          ),
        ),
        titleTextStyle: TextStyle(
          fontSize: 10.5.r,
          fontFamily: 'Montserrat',
          color: federalBlue,
          fontWeight: FontWeight.normal,
        ),
        title: Container(
          margin: EdgeInsets.only(bottom: 12.r),
          child: Row(
            children: [
              if (fromUser != null) ...[
                if (fromUser.avatar != null) ...[
                  CircleAvatar(
                    radius: 12.r,
                    child: RandomAvatar(fromUser.avatarCode ?? mockString()),
                  ),
                  Gap(9.r),
                ],
                ConstrainedBox(
                  //width: 60.w,
                  constraints: BoxConstraints(maxWidth: 90.w),
                  child: AutoSizeText(
                    firstCaps(fromUser.name),
                    minFontSize: 9,
                    maxFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13.2.r),
                  ),
                ),
              ],
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18.r),
                child: const Icon(Icons.arrow_right_alt, color: gray),
              ),
              if (toUser != null) ...[
                if (toUser.avatar != null) ...[
                  CircleAvatar(radius: 12.r, child: RandomAvatar(mockString())),
                  Gap(9.r),
                ],
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 90.w),
                  child: AutoSizeText(
                    toUser.name,
                    style: TextStyle(fontSize: 13.2.r),
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 9,
                    maxFontSize: 12,
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
