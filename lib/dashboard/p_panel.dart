import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/auth_provider.dart';
import '../logic/panel_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../model/p_user.dart';
import '../my_widget/login_option_button.dart';
import '../my_widget/show_t_score.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

class PPanel extends ConsumerWidget {
  final String id;
  const PPanel(this.id, {super.key, required this.pUser});

  final PUser pUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? firebaseUser = ref.watch(authUserProvider).value;
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final DateTime cDate = pUser.createdAt ?? DateTime.now();
    final String createdAt = DateFormat.yMMMMd('en_US').format(cDate);

    final pTheme = SlidingPanelTheme();

    final tTheme = Theme.of(context).textTheme.titleLarge;
    final sTheme = Theme.of(context).textTheme.bodyLarge;
    final PanelController panelController = ref.watch(dashboardPanelProvider);

    return Container(
      height: 360.h,
      decoration: BoxDecoration(borderRadius: pTheme.slidingPanelRadius),
      child: ClipRRect(
        borderRadius: pTheme.slidingPanelRadius,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: firebaseUser == null || myUser == null
              ? Container()
              : Column(
                  children: [
                    Flexible(
                      child: Container(
                        color: [
                          xantHous,
                          aquamarine,
                          uranianBlue
                        ][mockInteger(0, 2)],
                        child: Stack(
                          children: [
                            if (pUser.avatar != null)
                              Positioned(
                                bottom: -10.5.r,
                                height: 105.r,
                                width: 105.r,
                                child: SlideInUp(
                                  delay: const Duration(milliseconds: 500),
                                  child: RandomAvatar(
                                    pUser.avatar!,
                                    trBackground: true,
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        color: ghostWhite,
                        width: 360.w,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 15.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Container(
                                //color: mayaBlue,
                                height: 45.h,
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: pUser.name),
                                      TextSpan(
                                        text: "#${pUser.id}",
                                        style: TextStyle(
                                          fontSize: 12.r,
                                          color: gray,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ],
                                  ),
                                  style: tTheme!.copyWith(color: bloodRed),
                                ),
                              ),
                              subtitle: Container(
                                height: 27.h,
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText.rich(
                                  TextSpan(
                                    children: [
                                      /*if (firebaseUser.isAnonymous)
                                        const TextSpan(text: "Anonymous User")
                                      else if (firebaseUser.email != null)
                                        TextSpan(text: firebaseUser.email),*/

                                      /*const TextSpan(
                                        text: " | ",
                                        style: TextStyle(color: gray),
                                      ),*/
                                      TextSpan(
                                        text: createdAt,
                                        style: const TextStyle(
                                          color: gray,
                                        ),
                                      ),
                                    ],
                                    style: sTheme!
                                        .copyWith(color: chocolateCosmos),
                                  ),
                                ),
                              ),
                              trailing: LoginOptionButton(
                                lChild: Icon(
                                  !myUser.myFriends.contains(id)
                                      ? FontAwesomeIcons.userPlus
                                      : FontAwesomeIcons.userMinus,
                                  color: chocolateCosmos,
                                  size: 18.r,
                                ),
                                optionBtnPressed: () => ref
                                    .read(addFriendProvider(id).future)
                                    .whenComplete(
                                  () {
                                    debugPrint("Add Friend Done");
                                    if (panelController.isPanelOpen) {
                                      panelController.close();
                                    }
                                  },
                                ),
                              ),
                            ),
                            Gap(15.r),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: 60.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            child: AutoSizeText(
                                              mockInteger(1, 90).toString(),
                                              style: tTheme.copyWith(
                                                fontFamily: 'Montserrat',
                                                fontSize: 24.r,
                                              ),
                                            ),
                                          ),
                                          AutoSizeText(
                                            "Friends",
                                            style: sTheme.copyWith(color: gray),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (pUser.bestDuration != null)
                                      Container(
                                        width: 105.w,
                                        //color: Colors.blue,
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: AutoSizeText.rich(
                                                TextSpan(
                                                  children: [
                                                    showTScore(
                                                        pUser.bestDuration!,
                                                        minute: charcoal,
                                                        mm: cinerous,
                                                        tSize: 24,
                                                        sSize: 12)
                                                  ],
                                                ),
                                                maxLines: 1,
                                                style: tTheme.copyWith(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 24.r,
                                                ),
                                              ),
                                            ),
                                            AutoSizeText(
                                              "Best Duration",
                                              maxLines: 1,
                                              style:
                                                  sTheme.copyWith(color: gray),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
