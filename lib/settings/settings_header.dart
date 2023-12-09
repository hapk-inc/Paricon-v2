import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/panel_provider.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/auth_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

class SettingHeader extends ConsumerWidget {
  const SettingHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser myUser = ref.watch(myUserProvider).value!;
    final User? user = ref.watch(authUserProvider).value;

    final TextStyle tTheme = Theme.of(context).textTheme.titleLarge!;
    final TextStyle sTheme = Theme.of(context).textTheme.bodyLarge!;

    final PanelController controller = ref.watch(settingPanelProvider);

    return Card(
      margin: EdgeInsets.zero,
      elevation: 3.r,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 150.h,
        decoration: BoxDecoration(
          color: magnolia,
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        padding: EdgeInsets.all(7.5.r),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 45.r,
                    child: myUser.avatar == null
                        ? Text(
                            myUser.name.substring(0, 2).toUpperCase(),
                            style: tTheme.copyWith(
                              fontFamily: 'WendyOne',
                              letterSpacing: 0,
                            ),
                          )
                        : RandomAvatar(myUser.avatar ?? mockString(2)),
                  ),
                  Gap(15.r),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 2,
                          child: AutoSizeText(
                            myUser.name,
                            style: tTheme.copyWith(
                              fontFamily: 'WendyOne',
                              color: charcoal,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              AutoSizeText(
                                user?.email ?? "Anonymous User",
                                style: sTheme.copyWith(color: tropicalIndigo),
                                minFontSize: 10.5,
                                stepGranularity: 1.5,
                                maxFontSize: 15,
                                maxLines: 1,
                              ),
                              VerticalDivider(
                                thickness: .9.r,
                                color: majorelleBlue,
                                indent: 1.5.r,
                                endIndent: 1.5.r,
                              ),
                              AutoSizeText(
                                DateFormat.yMMMMd('en_US')
                                    .format(user!.metadata.creationTime!),
                                style: sTheme.copyWith(
                                  color: tropicalIndigo,
                                  fontSize: 9.r,
                                ),
                                minFontSize: 10.5,
                                stepGranularity: 1.5,
                                maxFontSize: 15,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: tropicalIndigo,
              thickness: 0.45.r,
              height: 24.h,
              indent: 7.5.w,
              endIndent: 7.5.w,
            ),
            Flexible(
              child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.only(left: 15.r),
                  ),
                  minimumSize: MaterialStatePropertyAll(
                    Size.fromWidth(120.w),
                  ),
                ),
                onPressed: () {
                  debugPrint("133-");
                  if (controller.isPanelClosed) {
                    controller.open();
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.userPen,
                      size: 21.r,
                      color: federalBlue,
                    ),
                    Gap(15.r),
                    Text(
                      "Edit profile",
                      style: TextStyle(
                        fontFamily: 'Cabin',
                        fontSize: 15.r,
                        color: federalBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
