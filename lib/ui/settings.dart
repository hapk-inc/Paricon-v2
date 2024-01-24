import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/auth_provider.dart';
import '../logic/panel_provider.dart';
import '../logic/s_size.dart';
import '../logic/t_score.dart';
import '../logic/tournament_database.dart';
import '../logic/user_activity_provider.dart';
import '../model/best_d.dart';
import '../my_widget/my_text_field.dart';
import '../settings/card_collection.dart';
import '../settings/settings_header.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: majorelleBlue,
        titleSpacing: 0,
        iconTheme: IconThemeData(color: ghostWhite, size: 18.r),
        centerTitle: false,
        toolbarHeight: 72.h,
        titleTextStyle: TextStyle(
          fontFamily: 'WendyOne',
          fontSize: 24.r,
          letterSpacing: 0.3.r,
        ),
        title: const AutoSizeText("Settings"),
      ),
      backgroundColor: ghostWhite,
      body: SlidingUpPanel(
        controller: ref.watch(settingPanelProvider),
        minHeight: 0.h,
        maxHeight: 300.h,
        borderRadius: slidingPanelTheme.slidingPanelRadius,
        backdropEnabled: true,
        panel: Container(
          decoration: BoxDecoration(
            color: majorelleBlue,
            borderRadius: slidingPanelTheme.slidingPanelRadius,
          ),
          padding: slidingPanelTheme.slidingPanelPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(15.r),
              AutoSizeText(
                "Edit Profile",
                style: TextStyle(
                  fontFamily: 'WendyOne',
                  fontSize: 21.r,
                  color: ghostWhite,
                ),
              ),
              Gap(30.r),
              const LoginTextField(),
            ],
          ),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: !isPhone ? Container() : const SettingsState(),
        ),
      ),
    );
  }
}

List<String> _settings = ["Card Collection", /* "Game Statistics",*/ "Log Out"];

const List<String> _tileText = ['Games', 'Best Duration', 'Rank'];

class SettingsState extends ConsumerWidget {
  const SettingsState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Gap(7.5.r),
        ListTile(
          horizontalTitleGap: 4.5.r,
          dense: true,
          onTap: () {
            ref.read(setActiveProvider(false));
            ref.read(signOutProvider);
          },
          leading: Icon(
            FontAwesomeIcons.rightFromBracket,
            size: 21.r,
            color: jasper,
          ),
          title: Container(
            height: 45.h,
            alignment: Alignment.centerLeft,
            child: Text(
              "Log Out",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 21.r, color: jasper),
              /* style: TextStyle(
                fontFamily: 'WendyOne',
                fontWeight: FontWeight.normal,
                fontSize: 21.r,
                color: jasper,
              ),*/
            ),
          ),
          trailing: SizedBox.square(
            dimension: 30.r,
            child: const Icon(Icons.chevron_right, color: jasper),
          ),
        )
      ],
    );
  }
}

class SettingsState1 extends ConsumerWidget {
  const SettingsState1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BestD? myBestD = ref.watch(myBestDProvider).value;

    return SafeArea(
      minimum: EdgeInsets.all(15.r),
      child: Column(
        children: [
          const SettingHeader(),
          Gap(24.r),
          AnimatedSwitcher(
            duration: const Duration(microseconds: 500),
            child: myBestD == null
                ? Container(
                    height: 30.h,
                    padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "Open challenge is still pending on your to-do list.",
                      style: TextStyle(
                        fontFamily: 'Cabin',
                        fontSize: 15.r,
                        fontWeight: FontWeight.w900,
                        color: cinerous,
                      ),
                      maxLines: 1,
                    ),
                  )
                : FadeIn(child: ShowBestDTile(myBestD)),
          ),
          Gap(15.r),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, int index) {
                final bool isLogOut = _settings[index] == _settings.last;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: isLogOut ? lavenderWeb : magnolia,
                    borderRadius: BorderRadius.circular(1.5.r),
                  ),
                  child: OpenContainer(
                    closedColor: magnolia,
                    closedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5.r),
                    ),
                    closedBuilder:
                        (BuildContext context, void Function() action) =>
                            ListTile(
                      onTap: isLogOut
                          ? () {
                              if (isLogOut) {
                                ref.read(signOutProvider);
                              }
                            }
                          : action,
                      dense: true,
                      leading: isLogOut
                          ? Icon(
                              FontAwesomeIcons.rightFromBracket,
                              size: 21.r,
                              color: jasper,
                            )
                          : null,
                      title: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 54.h,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _settings[index],
                          style: TextStyle(
                            fontFamily: 'WendyOne',
                            fontWeight: FontWeight.normal,
                            fontSize: 21.r,
                            color: isLogOut ? jasper : charcoal,
                          ),
                        ),
                      ),
                      trailing: SizedBox(
                        height: 30.h,
                        width: 30.w,
                        //color: Colors.amber,
                        child: Icon(
                          Icons.chevron_right,
                          color: isLogOut ? jasper : charcoal,
                        ),
                      ),
                    ),
                    openColor: magnolia,
                    openBuilder:
                        (_, void Function({Object? returnValue}) action) {
                      return isLogOut ? Container() : CardCollection(action);
                    },
                  ),
                );
              },
              separatorBuilder: (_, __) => Gap(7.5.r),
              itemCount: _settings.length,
            ),
          )
        ],
      ),
    );
  }
}

class ShowBestDTile extends ConsumerWidget {
  final BestD myBestD;

  const ShowBestDTile(this.myBestD, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(authUserProvider).value;
    final TextStyle tTheme = Theme.of(context).textTheme.titleLarge!;

    final List<String> bestDList = ref.watch(bestDListProvider).value ?? [];

    if (bestDList.isEmpty || user == null) return Container();
    final List<Widget> tileValue = [
      Text(
        "${myBestD.tCount}".padLeft(2, '0'),
        style: tTheme.copyWith(
          fontFamily: 'WendyOne',
          color: tropicalIndigo,
          fontSize: 27.r,
        ),
      ),
      AutoSizeText.rich(
        showTScore(
          myBestD.bestD,
          minute: tropicalIndigo,
          mm: periwinkle,
          tSize: 27,
          sSize: 12,
          family: 'WendyOne',
        ),
        style: tTheme.copyWith(
          fontFamily: 'WendyOne',
          color: tropicalIndigo,
          fontSize: 27.r,
        ),
      ),
      Text(
        "${bestDList.indexOf(user.uid) + 1}".padLeft(2, '0'),
        style: tTheme.copyWith(
          fontFamily: 'WendyOne',
          color: tropicalIndigo,
          fontSize: 27.r,
        ),
      ),
    ];
    return SizedBox(
      height: 90.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          3,
          (index) => AspectRatio(
            aspectRatio: index == 1 ? 1.8 : 1.05,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: magnolia,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              margin: EdgeInsets.symmetric(horizontal: 3.r),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  tileValue[index],
                  Gap(5.4.r),
                  AutoSizeText(
                    _tileText[index],
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: tropicalIndigo,
                      letterSpacing: 0,
                    ),
                    maxLines: 1,
                    minFontSize: 10.5,
                    maxFontSize: 12,
                    stepGranularity: 1.5,
                  ),
                  Gap(6.r),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
