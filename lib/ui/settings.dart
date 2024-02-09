import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/auth_provider.dart';
import '../logic/panel_provider.dart';
import '../logic/s_size.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../my_widget/change_name.dart';
import '../settings/earn_first_avatar.dart';
import '../settings/footer.dart';
import '../settings/settings_app_bar.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize screenSize = ref.read(sizeProvider);
    final bool isPhone = screenSize == ScreenSize.phone;
    final SlidingPanelTheme pTheme = SlidingPanelTheme();
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final PanelController controller = ref.watch(settingPanelProvider);
    return Scaffold(
      appBar: settingAppBar(context),
      body: SlidingUpPanel(
        backdropTapClosesPanel: true,
        backdropEnabled: true,
        isDraggable: false,
        controller: controller,
        borderRadius: pTheme.slidingPanelRadius,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: !isPhone
              ? Container()
              : Column(
                  children: [
                    Container(
                      height: 600.h,
                      padding: pTheme.slidingPanelPadding,
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: myUser?.avatarArr.isEmpty ?? true
                                ? const EarnFirstAvatar()
                                : Container(),
                          ),
                          //Gap(30.r),
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (_, index) => Container(
                                height: 60.h,
                                alignment: Alignment.centerLeft,
                                color: magnolia,
                                child: ListTile(
                                  titleTextStyle: TextStyle(
                                    fontSize: 15.r,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    color: federalBlue,
                                  ),
                                  leadingAndTrailingTextStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: federalBlue,
                                    fontSize: 13.5.r,
                                  ),
                                  onTap: index != 0
                                      ? null
                                      : () {
                                          if (!controller.isPanelOpen) {
                                            controller.open();
                                          }
                                        },
                                  iconColor: richBlack,
                                  horizontalTitleGap: 24.r,
                                  leading: _settingInfoArr[index].titleIcon,
                                  trailing: _settingInfoArr[index].trailing,
                                  title: Text(_settingInfoArr[index].title),
                                ),
                              ),
                              separatorBuilder: (_, __) => Gap(7.5.r),
                              itemCount: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SettingFooter()
                  ],
                ),
        ),
        panel: const Center(child: ChangeName()),
        color: magnolia,
        minHeight: 0,
        maxHeight: 192.h,
        onPanelClosed: () {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}

class SettingInfo {
  final Icon titleIcon;
  final String title;
  final Widget? trailing;
  final void Function() action;

  SettingInfo({
    required this.titleIcon,
    required this.title,
    this.trailing,
    required this.action,
  });
}

List<SettingInfo> _settingInfoArr = [
  SettingInfo(
    titleIcon: const Icon(Icons.edit),
    title: "Edit Profile",
    action: () {},
  ),
  SettingInfo(
    titleIcon: const Icon(Icons.email_outlined),
    title: "Email",
    trailing: Consumer(
      builder: (__, ref, _) {
        final User? user = ref.watch(authUserProvider).value;
        return Text(
          user?.email ?? "${mockName()}${mockInteger(111, 9999)}@gmail.com",
          style: const TextStyle(color: federalBlue),
        );
      },
    ),
    action: () {},
  ),
  SettingInfo(
    titleIcon: const Icon(Icons.graphic_eq),
    title: "Statistics",
    action: () {},
  ),
];

class AvatarList extends ConsumerWidget {
  const AvatarList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;

    if (myUser == null) return Container();
    final int r = mockInteger(1, 5);
    return SizedBox(
      height: 156.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9.r),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.from(
            myUser.avatarArr.map(
              (e) => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 96.w,
                margin: EdgeInsets.symmetric(horizontal: 4.5.w),
                decoration: BoxDecoration(
                  color: myUser.avatar == e
                      ? majorelleBlue
                      : gridColor[(r % 3)].withOpacity(0.3),
                  borderRadius: BorderRadius.circular(7.5.r),
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      bottom: -7.5.r,
                      left: 0.r,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        alignment: Alignment.bottomCenter,
                        constraints: BoxConstraints.tight(Size.square(108.r)),
                        child: RandomAvatar(e, trBackground: true),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
