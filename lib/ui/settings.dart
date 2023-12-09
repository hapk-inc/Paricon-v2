import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart' as badges;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/my_widget/show_t_score.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/auth_provider.dart';
import '../logic/panel_provider.dart';
import '../logic/s_size.dart';
import '../logic/tournament_database.dart';
import '../logic/user_provider.dart';
import '../model/best_d.dart';
import '../model/my_user.dart';
import '../my_widget/login_option_button.dart';
import '../my_widget/my_text_field.dart';
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
            aspectRatio: index == 1 ? 1.5 : 1.05,
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
                      color: periwinkle,
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

class CardCollection extends ConsumerWidget {
  final Function({Object? returnValue}) action;

  const CardCollection(this.action, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextStyle tTheme = Theme.of(context).textTheme.titleLarge!;
    final TextStyle sTheme = Theme.of(context).textTheme.bodyLarge!;
    final MyUser? myUser = ref.watch(myUserProvider).value;
    return SafeArea(
      minimum: EdgeInsets.only(top: 15.h, left: 1.5.w, right: 1.5.w),
      child: Container(
        color: magnolia,
        padding: EdgeInsets.only(top: 15.h, left: 9.w, right: 9.w),
        child: InkWell(
          onTap: action,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Card Collection",
                style: tTheme.copyWith(
                  fontFamily: "WendyOne",
                  fontSize: 36.r,
                  height: 1.8.r,
                  color: cinerous,
                ),
              ),
              Text(
                "Increase your avatar collection by encouraging your "
                "friends and family to use the code above.",
                style: sTheme.copyWith(
                  height: 2.4.r,
                  fontSize: 15.r,
                  color: cinerous,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin: EdgeInsets.symmetric(vertical: 15.h),
                height: 51.h,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 225.w,
                      margin: EdgeInsets.only(right: 15.w),
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: magnolia,
                        borderRadius: BorderRadius.circular(7.5.r),
                        border: Border.all(width: 0.09.r, color: federalBlue),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            myUser!.avatarCode == null
                                ? "Hold on.."
                                : myUser.avatarCode!.toUpperCase(),
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.3.r,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.r,
                              color: vanDyke,
                            ),
                          ),
                          Icon(
                            Icons.copy,
                            size: 20.1.r,
                            color: cinerous,
                          )
                        ],
                      ),
                    ),
                    LoginOptionButton(
                      bColor: majorelleBlue,
                      lChild: Icon(Icons.share, size: 20.1.r),
                      optionBtnPressed: () {},
                      borderWidth: 0.75,
                    )
                  ],
                ),
              ),
              Gap(15.r),
              Expanded(
                child: MasonryGridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4.5.r,
                  crossAxisSpacing: 3.r,
                  itemBuilder: (_, index) {
                    final bool currentAvatar =
                        (myUser.avatar ?? "") == myUser.avatarArr[index];
                    return FadeIn(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: (mockInteger(14, 15)) * 0.96 * 12.h,
                        decoration: BoxDecoration(
                          color: currentAvatar
                              ? majorelleBlue
                              : lightColors[mockInteger(0, 2)],
                          borderRadius: BorderRadius.circular(7.5.r),
                        ),
                        child: LayoutBuilder(
                          builder: (_, BoxConstraints constraints) => Stack(
                            children: [
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                top: 0,
                                bottom: -constraints.maxHeight * 0.81,
                                left: 0,
                                right: 0,
                                child: badges.Badge(
                                  showBadge: currentAvatar,
                                  badgeContent: Icon(
                                    FontAwesomeIcons.check,
                                    size: 18.r,
                                    color: ghostWhite,
                                  ),
                                  position: badges.BadgePosition.topEnd(
                                    top: 6.r,
                                    end: 6.r,
                                  ),
                                  badgeStyle: badges.BadgeStyle(
                                    badgeColor: darkPastelGreen,
                                    shape: badges.BadgeShape.circle,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: RandomAvatar(
                                    myUser.avatarArr[index],
                                    trBackground: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: myUser.avatarArr.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DCardCollection extends ConsumerWidget {
  const DCardCollection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    if (myUser == null) return Container();
    final String? avatarCode = myUser.avatarCode;

    return Container(
      height: 192.r,
      color: lavenderWeb.withOpacity(0.12),
      padding: EdgeInsets.only(right: 15.r, left: 3.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "Get more Avatars",
            style: TextStyle(
              fontSize: 27.r,
              height: 2.1.r,
              fontFamily: 'DelaGothic',
              color: cinerous,
            ),
            maxLines: 1,
            maxFontSize: 30,
            minFontSize: 21,
          ),
          AutoSizeText(
            "Increase your avatar collection by encouraging your "
            "friends and family to use the code above.",
            style: TextStyle(
              height: 2.1.r,
              color: cinerous.withOpacity(0.75),
              fontFamily: 'Cabin',
              fontSize: 12.r,
            ),
            maxLines: 2,
            minFontSize: 9,
            maxFontSize: 12,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.r),
            height: 51.r,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  width: 225.w,
                  margin: EdgeInsets.only(right: 15.w),
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: magnolia,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        avatarCode == null
                            ? "Hold on.."
                            : avatarCode.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'LuckiestGuy',
                          letterSpacing: 1.2.r,
                          //fontWeight: FontWeight.w800,
                          fontSize: 18.r,
                          color: federalBlue,
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.clipboard,
                        size: 21.r,
                        color: federalBlue,
                      )
                    ],
                  ),
                ),
                LoginOptionButton(
                  lChild: Icon(
                    FontAwesomeIcons.share,
                    size: 21.r,
                    color: charcoal,
                  ),
                  optionBtnPressed: () {},
                  bColor: periwinkle,
                )
              ],
            ),
          ),
          //Expanded(child: ColoredBox(color: chocolateCosmos))
        ],
      ),
    );
  }
}
