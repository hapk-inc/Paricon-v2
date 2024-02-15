import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/auth_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../model/pass_avatar.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

class PassAvatarListTile extends ConsumerWidget {
  final PassAvatar passAvatar;
  const PassAvatarListTile(this.passAvatar, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();

    final User? user = ref.watch(authUserProvider).value;
    String uid = user?.uid ?? "";

    MyUser? fromUser = ref
        .watch(xUserProvider(passAvatar.from))
        .maybeWhen(orElse: () => null, data: (data) => data);

    MyUser? toUser = ref
        .watch(xUserProvider(passAvatar.to))
        .maybeWhen(orElse: () => null, data: (data) => data);

    bool isFrom = uid == passAvatar.from;
    bool isTo = uid == passAvatar.to;

    bool isFromToMe = isFrom || isTo;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 45.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      margin: EdgeInsets.symmetric(vertical: 1.5.r),
      decoration: BoxDecoration(
        //color: Colors.yellow,
        color: isFromToMe ? gridColor[mockInteger(0, 2)].withOpacity(1) : null,
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
        horizontalTitleGap: 15.r,
        leading: Container(
          constraints: BoxConstraints.tight(Size(45.w, 30.h)),
          //color: cornellRed,
          alignment: Alignment.center,
          child: Row(
            children: [
              Icon(Icons.timer_outlined, size: 15.r, color: frenchGray),
              Gap(4.5.r),
              AutoSizeText(
                now.day == passAvatar.createdAt.day
                    ? DateFormat.Hm().format(passAvatar.createdAt)
                    : DateFormat.MMMd().format(passAvatar.createdAt),
                style: TextStyle(color: isFromToMe ? federalBlue : frenchGray),
                stepGranularity: 1.5,
                overflow: TextOverflow.ellipsis,
                minFontSize: 6,
                maxFontSize: 9,
              ),
            ],
          ),
        ),
        titleTextStyle:
            const TextStyle(fontFamily: 'Montserrat', color: coolGray),
        title: Row(
          children: [
            if (fromUser != null) ...[
              if (fromUser.avatar?.isNotEmpty ?? false) ...[
                CircleAvatar(
                  radius: 12.r,
                  child: RandomAvatar(fromUser.avatar ?? mockString()),
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
                  style: TextStyle(
                    fontSize: 12.r,
                    color: isFrom ? federalBlue : null,
                  ),
                ),
              ),
            ],
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18.r),
              child: const Icon(Icons.arrow_right_alt, color: gray),
            ),
            if (toUser != null) ...[
              if (toUser.avatar?.isNotEmpty ?? false) ...[
                CircleAvatar(
                  radius: 12.r,
                  child: RandomAvatar(toUser.avatar ?? mockString()),
                ),
                Gap(9.r),
              ],
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 90.w),
                  child: AutoSizeText(
                    toUser.name,
                    style: TextStyle(
                      fontSize: 12.r,
                      color: isTo ? federalBlue : null,
                    ),
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 9,
                    maxFontSize: 12,
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
