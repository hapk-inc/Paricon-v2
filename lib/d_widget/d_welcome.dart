import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';
import 'd_show_profile_detail.dart';
import 'd_title_subtitle.dart';

class DWelcome extends ConsumerWidget {
  const DWelcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.read(myUserProvider).value;
    return OpenContainer(
      closedElevation: 0,
      middleColor: majorelleBlue,
      tappable: false,
      closedBuilder: (_, void Function() action) => Container(
        decoration: BoxDecoration(
          color: majorelleBlue,
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        margin: EdgeInsets.all(9.r),
        padding: EdgeInsets.only(top: 30.r, left: 15.r, right: 15.r),
        constraints: const BoxConstraints.expand(),
        child: myUser == null ? null : DashboardTitleSubTitle(action),
      ),
      //closedColor: majorelleBlue,
      openColor: majorelleBlue,
      openBuilder: (_, void Function({Object? returnValue}) action) =>
          ShowProfileDetail(action),
    );
  }
}
