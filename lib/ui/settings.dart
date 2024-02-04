import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../logic/auth_provider.dart';
import '../logic/firebase_init.dart';
import '../logic/s_size.dart';
import '../logic/user_activity_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize screenSize = ref.read(sizeProvider);
    final bool isPhone = screenSize == ScreenSize.phone;
    final SlidingPanelTheme slidingPanelTheme = SlidingPanelTheme();
    final MyUser? myUser = ref.watch(myUserProvider).value;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: richBlack, size: 24.r),
        toolbarHeight: 90.h,
        title: AnimatedSwitcher(
          key: ValueKey(myUser?.name ?? ""),
          duration: const Duration(milliseconds: 500),
          child: AutoSizeText.rich(
            TextSpan(children: [
              TextSpan(text: "${myUser?.name ?? ""} "),
              TextSpan(
                text: "#${myUser?.id.toString() ?? ""}",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 12.r,
                ),
              ),
            ]),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: !isPhone
            ? Container()
            : Column(
                children: [
                  SizedBox(
                    height: 600.h,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (myUser?.avatarArr.isEmpty ?? true)
                            Container(
                              height: 150.h,
                              width: double.maxFinite,
                              color: magnolia,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Earn your first avatar",
                                    style: TextStyle(
                                      //fontFamily: 'Poppins',
                                      color: drabDarkBrown,
                                      fontSize: 21.r,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Gap(15.r),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(federalBlue),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "APPLY NOW",
                                      style: TextStyle(color: magnolia),
                                    ),
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            ref.read(setActiveProvider(false));
                            ref.read(signOutProvider);
                          },
                          icon:
                              Icon(Icons.logout, size: 21.r, color: frenchGray),
                          label: Text(
                            "LOG OUT",
                            style: TextStyle(
                              fontSize: 15.r,
                              color: frenchGray,
                              fontFamily: 'Montserrat',
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        ref.watch(packageInfoProvider).maybeWhen(
                              orElse: () => Container(),
                              data: (app) => Text(
                                "Version ${app.version} (${app.buildNumber})",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: gray,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.r,
                                    ),
                              ),
                            ),
                      ],
                    ),
                  ))
                ],
              ),
      ),
    );
  }
}

/*@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize screenSize = ref.read(sizeProvider);
    final bool isPhone = screenSize == ScreenSize.phone;
    final SlidingPanelTheme slidingPanelTheme = SlidingPanelTheme();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: majorelleBlue,
        titleSpacing: 0,
        iconTheme: IconThemeData(color: ghostWhite, size: 24.r),
        centerTitle: false,
        toolbarHeight: 75.h,
        titleTextStyle: TextStyle(
          fontFamily: 'WendyOne',
          fontSize: 24.r,
          letterSpacing: 0.3.r,
        ),
        title: const AutoSizeText(
          "Settings",
          style: TextStyle(color: ghostWhite),
        ),
      ),
      backgroundColor: ghostWhite,
      body: SlidingUpPanel(
        controller: ref.watch(settingPanelProvider),
        minHeight: 0.h,
        maxHeight: 300.h,
        borderRadius: slidingPanelTheme.slidingPanelRadius,
        backdropEnabled: true,
        panel: Container(),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: !isPhone ? Container() : const SettingsState(),
        ),
      ),
    );
  }
}

class SettingsState extends ConsumerWidget {
  const SettingsState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tTheme = Theme.of(context).textTheme;
    final pTheme = SlidingPanelTheme();
    final MyUser? myUser = ref.watch(myUserProvider).value;
    return SafeArea(
      minimum: pTheme.slidingPanelPadding,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: myUser == null
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(15.r),
                  AspectRatio(
                    aspectRatio: 2.1,
                    child: SlideInLeft(
                      child: FadeIn(
                        child: Card(
                          color: magnolia,
                          // color: cornellRed,
                          child: Padding(
                            padding: pTheme.slidingPanelPadding,
                            child: GridTile(
                              header: Center(
                                child: AutoSizeText(
                                  "Earn your first avatar",
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: richBlack,
                                    fontSize: 21.r,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Lottie.asset(
                                  'lottie/b_male_01.json',
                                  width: 210.r,
                                  onLoaded: (composition) {
                                    debugPrint("93--");
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(15.r),
                  SizedBox(
                    // color: cornellRed,
                    height: 60.h,
                    child: ListTile(
                      iconColor: jasper,
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 7.5.r,
                      dense: true,
                      onTap: () {
                        ref.read(setActiveProvider(false));
                        ref.read(signOutProvider);
                      },
                      leading: Icon(Icons.logout, size: 21.r),
                      title: Container(
                        height: 45.h,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Log Out",
                          style: tTheme.bodySmall!.copyWith(
                            fontSize: 21.r,
                            fontWeight: FontWeight.w700,
                            color: jasper,
                          ),
                        ),
                      ),
                      trailing:
                          Icon(Icons.chevron_right, color: jasper, size: 30.r),
                    ),
                  ),
                  ref.watch(packageInfoProvider).maybeWhen(
                        orElse: () => Container(),
                        data: (app) => Text(
                          "Version ${app.version} (${app.buildNumber})",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: gray,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.r,
                                  ),
                        ),
                      ),
                ],
              ),
      ),
    );
  }
}*/
