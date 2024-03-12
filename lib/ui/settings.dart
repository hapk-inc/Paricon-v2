import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/app_check.dart';
import '../logic/auth_provider.dart';
import '../logic/my_names.dart';
import '../logic/panel_provider.dart';
import '../logic/setting_notifier.dart';
import '../logic/tournament_database.dart';
import '../model/best_d.dart';
import '../router/my_route.dart';
import '../settings/deactivate_account.dart';
import '../settings/log_out_dialog.dart';
import '../theme/my_color.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_theme.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pTheme = SlidingPanelTheme();
    // final TextTheme tTheme = Theme.of(context).textTheme;
    final MyUser? myUser = ref.watch(myUserProvider).value;
    //final BestD? bestD = ref.watch(myBestDProvider).value;

    final User? user = ref.watch(authUserProvider).value;

    //final String userName = myUser?.name ?? mockAvatarName();
    //final String? userAvatar = myUser?.avatar;
    final String mockEmail = "${mockAvatarName()}@gmail.com".toLowerCase();
    //final String email =
    //    (user?.isAnonymous ?? true) ? mockEmail : (user?.email ?? mockEmail);

    final PanelController settingPanel = ref.read(settingPanelProvider);

    /*ref.listen(
      netConnectedNotifierProvider.select((value) => value),
      (_, next) {
        debugPrint("netConnectedNotifierProvider in Settings $next");
        if (next.isNegative) {
          if (settingPanel.isPanelClosed) {
            settingPanel.open();
          }
        } else {
          if (settingPanel.isPanelOpen) {
            settingPanel.close();
          }
        }
        //}
      },
    );*/
    ref.listen(
      settingPanelNotifierProvider.select((value) => value),
      (previous, next) {
        if (next is Container) {
          if (settingPanel.isPanelOpen) {
            settingPanel.close();
          }
        } else {
          if (settingPanel.isPanelClosed) {
            settingPanel.open();
          }
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 45.w,
        titleSpacing: 1.5.w,
        toolbarHeight: 90.h,
        centerTitle: false,
        title: const Text("Settings"),
      ),
      body: SlidingUpPanel(
        minHeight: 0,
        maxHeight: 375.h,
        borderRadius: pTheme.slidingPanelRadius,
        padding: pTheme.slidingPanelPadding,
        color: ghostWhite1,
        controller: ref.watch(settingPanelProvider),
        panel: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: ref.watch(settingPanelNotifierProvider),
        ),
        onPanelClosed: () {
          ref.read(settingPanelNotifierProvider.notifier).state = Container();
        },
        isDraggable: false,
        backdropEnabled: true,
        backdropTapClosesPanel: ref.watch(netConnectedNotifierProvider) != -1,
        body: SafeArea(
          child: SingleChildScrollView(
            child: StaggeredGrid.count(
              crossAxisCount: 21,
              children: [
                const StaggeredGridTile.count(
                  crossAxisCellCount: 21,
                  mainAxisCellCount: 1.5,
                  child: SizedBox(),
                ),
                StaggeredGridTile.fit(
                  crossAxisCellCount: 21,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: ElevatedButton(
                      onPressed: () =>
                          context.router.push(const EditProfileRoute()),
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(majorelleBlue),
                      ),
                      child: Container(
                        height: 45.h,
                        alignment: Alignment.center,
                        child: Text(
                          "EDIT YOUR PROFILE",
                          style: TextStyle(
                            color: ghostWhite1,
                            fontSize: 13.2.r,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ...cardOption(context, ref),
                ...logOutOption(context, ref),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> logOutOption(BuildContext context, WidgetRef ref) {
  return [
    _staggeredSpacer,
    const _SettingSub("ACCOUNT SETTINGS"),
    StaggeredGridTile.count(
      crossAxisCellCount: 21,
      mainAxisCellCount: 6,
      child: Container(
        decoration: BoxDecoration(
          color: magnolia1,
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        padding: EdgeInsets.only(left: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AspectRatio(
              aspectRatio: 7.2,
              child: ListTile(
                dense: true,
                tileColor: cornellRed,
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => const LogOutDialog(),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                leading:
                    const Icon(Icons.logout_outlined, color: drabDarkBrown),
                trailing: const Icon(Icons.chevron_right, color: drabDarkBrown),
                title: Text(
                  "LOG OUT",
                  style: TextStyle(fontSize: _tFontSize),
                ),
                titleTextStyle: _titleStyle.copyWith(color: drabDarkBrown),
              ),
            ),
            const Divider(height: 0, color: frenchGray, thickness: 0.75),
            AspectRatio(
              aspectRatio: 7.2,
              child: ListTile(
                dense: true,
                onTap: () {
                  ref.read(settingPanelNotifierProvider.notifier).state =
                      const DeactivateAccount();
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                leading: const Icon(Icons.person_remove, color: cornellRed),
                trailing: const Icon(Icons.chevron_right, color: cornellRed),
                titleTextStyle: _titleStyle.copyWith(color: cornellRed),
                title: Text(
                  "DEACTIVATE ACCOUNT",
                  style: TextStyle(fontSize: _tFontSize),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ];
}

class _SettingSub extends StatelessWidget {
  final String sub;
  const _SettingSub(this.sub);

  @override
  Widget build(BuildContext context) => StaggeredGridTile.fit(
        crossAxisCellCount: 21,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Text(
            sub,
            style: TextStyle(
              color: frenchGray,
              fontSize: 12.r,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      );
}

List<Widget> cardOption(BuildContext context, WidgetRef ref) {
  final MyUser? myUser = ref.watch(myUserProvider).value;
  return [
    _staggeredSpacer,
    const _SettingSub("CARD SETTINGS"),
    StaggeredGridTile.count(
      crossAxisCellCount: 21,
      mainAxisCellCount: 6,
      child: Container(
        decoration: BoxDecoration(
          color: magnolia1,
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        padding: EdgeInsets.only(left: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AspectRatio(
              aspectRatio: 7.2,
              child: ListTile(
                dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                leading: const Icon(Icons.copy_all_outlined, color: gray),
                trailing: const Icon(Icons.chevron_right, color: gray),
                titleTextStyle: _titleStyle,
                title: Text(
                  "USE AVATAR CODE",
                  style: TextStyle(fontSize: _tFontSize),
                ),
              ),
            ),
            const Divider(height: 0, color: frenchGray),
            AspectRatio(
              aspectRatio: 7.2,
              child: ListTile(
                dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                leading: const Icon(Icons.paste_outlined, color: darkGreen),
                trailing: const Icon(Icons.chevron_right, color: darkGreen),
                titleTextStyle: _titleStyle.copyWith(color: darkGreen),
                title: Text(
                  "ENTER FRIEND'S AVATAR CODE",
                  style: TextStyle(fontSize: _tFontSize),
                ),
              ),
            ),
          ],
        ),
      ),
    )
  ];
}

Widget get _staggeredSpacer => const StaggeredGridTile.count(
      crossAxisCellCount: 21,
      mainAxisCellCount: 0.9,
      child: SizedBox(),
    );

TextStyle get _titleStyle =>
    const TextStyle(color: gray, fontFamily: 'Montserrat');

double get _tFontSize => 12.r;

/* AspectRatio(
                  aspectRatio: 5.4,
                  child: ListTile(
                    horizontalTitleGap: 0,
                    minLeadingWidth: 30.w,
                    contentPadding: EdgeInsets.only(left: 7.5.w),

                    // dense: true,
                    leading: Container(
                      width: 30.w,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 4.5.h),
                      child: Icon(Icons.circle, size: 9.r, color: gray),
                    ),
                    title: Text(
                      "Account Deletion is final. There will be no way to restore your account",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        color: gray,
                        letterSpacing: 0,
                        fontSize: 15.r,
                        height: 2.1.r,
                      ),
                    ),
                  ),
                )*/
