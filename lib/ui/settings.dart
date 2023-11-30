import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart' as badges;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/auth_provider.dart';
import '../logic/s_size.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../my_widget/login_option_button.dart';
import '../my_widget/my_text_field.dart';
import '../theme/my_color.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize screenSize = ref.read(sizeProvider);
    final bool isPhone = screenSize == ScreenSize.phone;
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
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: !isPhone ? Container() : const SettingsState(),
      ),
    );
  }
}

List<String> _settings = ["Card Collection", "Log Out"];

class SettingsState extends ConsumerWidget {
  const SettingsState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser myUser = ref.watch(myUserProvider).value!;

    final User? user = ref.watch(authUserProvider).value;
    final TextStyle tTheme = Theme.of(context).textTheme.titleLarge!;
    final TextStyle sTheme = Theme.of(context).textTheme.bodyLarge!;
    return SafeArea(
      minimum: EdgeInsets.all(15.r),
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            elevation: 3.r,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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
                              ? Text(myUser.name.substring(0, 2))
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
                                child: AutoSizeText(
                                  user?.email ?? "Anonymous User",
                                  style: sTheme.copyWith(color: tropicalIndigo),
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
          ),
          Gap(24.r),
          SizedBox(
            height: 105.h,
            // duration: const Duration(milliseconds: 500),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                3,
                (index) => AspectRatio(
                  aspectRatio: 1.11,
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
                        Text(
                          "${mockInteger(1, 50)}".padLeft(2, '0'),
                          style: tTheme.copyWith(
                            fontFamily: 'Montserrat',
                            color: tropicalIndigo,
                            fontSize: 27.r,
                            letterSpacing: .15.r,
                          ),
                        ),
                        Gap(9.r),
                        Text(
                          mockString(8),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12.r,
                            color: gray,
                            letterSpacing: 0,
                          ),
                        ),
                        Gap(6.r),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Gap(30.r),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, int index) => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 60.h,
                decoration: BoxDecoration(
                  color: _settings[index] == _settings.last
                      ? lavenderWeb
                      : magnolia,
                  borderRadius: BorderRadius.circular(1.5.r),
                ),
                child: ListTile(
                  onTap: () {
                    if (_settings[index] == _settings.last) {
                      ref.read(signOutProvider);
                    }
                  },
                  dense: true,
                  title: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 54.h,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _settings[index],
                      style: TextStyle(
                        fontFamily: 'Cabin',
                        fontSize: 18.r,
                        color: _settings[index] == _settings.last
                            ? chocolateCosmos
                            : charcoal,
                      ),
                    ),
                  ),
                  trailing: SizedBox(
                    height: 30.h,
                    width: 30.w,
                    //color: Colors.amber,
                    child: Icon(
                      Icons.chevron_right,
                      color: _settings[index] == _settings.last
                          ? chocolateCosmos
                          : charcoal,
                    ),
                  ),
                ),
              ),
              separatorBuilder: (_, __) => Gap(3.r),
              itemCount: _settings.length,
            ),
          )
        ],
      ),
    );
  }
}

class SettingsState1 extends ConsumerWidget {
  const SettingsState1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser myUser = ref.watch(myUserProvider).value!;
    final TextStyle tTheme = Theme.of(context).textTheme.titleLarge!;
    final TextStyle sTheme = Theme.of(context).textTheme.bodyLarge!;
    return SafeArea(
      bottom: false,
      minimum: EdgeInsets.only(top: 15.r, bottom: 15.r, left: 15.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15.r),
            child: Container(
              height: 120.h,
              decoration: BoxDecoration(
                color: lightOrange,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              padding: EdgeInsets.all(15.r),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 45.r,
                    child: myUser.avatar == null
                        ? Text(myUser.name.substring(0, 2))
                        : RandomAvatar(myUser.avatar!),
                  ),
                  Gap(15.r),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          myUser.name,
                          style: tTheme.copyWith(
                            fontFamily: 'WendyOne',
                            color: charcoal,
                            height: 0,
                          ),
                          maxLines: 1,
                        ),
                        Gap(3.r),
                        AutoSizeText(
                          myUser.id.toString(),
                          style: sTheme.copyWith(
                            height: 2.1.r,
                            color: cinerous,
                          ),
                          maxLines: 1,
                          minFontSize: 9,
                          maxFontSize: 10.5,
                          stepGranularity: 1.5,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Gap(30.r),
          Padding(
            padding: EdgeInsets.only(right: 15.r),
            child: const LoginTextField(),
          ),
          Gap(15.r),
          Padding(
            padding: EdgeInsets.only(right: 15.r),
            child: const DCardCollection(),
          ),
          Gap(12.r),
          CardList(myUser: myUser),
          Gap(18.r),
          //const Spacer(),
          //Gap(mainAxisExtent)
          //GiftAvatarCloseContainer(() {}),
          OutlinedButton(
            onPressed: () => ref.read(signOutProvider),
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 15.w),
              ),
              fixedSize: MaterialStatePropertyAll(
                Size.fromWidth(180.w),
              ),
            ),
            child: Text(
              "Click here to logout",
              style: TextStyle(
                fontFamily: 'Cabin',
                fontSize: 18.r,
                color: oldRose,
              ),
            ),
          ),
          Gap(30.r),
        ],
      ),
    );
  }
}

class CardList extends StatelessWidget {
  const CardList({
    super.key,
    required this.myUser,
  });

  final MyUser myUser;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      //color: xantHous,
      child: ListView(
        scrollDirection: Axis.horizontal,
        //padding: EdgeInsets.only(left: 15.w),
        children: myUser.avatarArr.map(
          (e) {
            final bool currentAvatar = e == myUser.avatar;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: currentAvatar ? 120.w : 105.w,
              margin: EdgeInsets.only(right: 9.w),
              decoration: BoxDecoration(
                color: currentAvatar
                    ? majorelleBlue
                    : [
                        aquamarine,
                        // uranianBlue,
                        xantHous
                      ][mockInteger(0, 1)]
                        .withOpacity(0.75),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    bottom: currentAvatar ? -36.r : -60.r,
                    top: 0,
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
                        e,
                        trBackground: true,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ).toList(),
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
      height: 195.r,
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
        ],
      ),
    );
  }
}
