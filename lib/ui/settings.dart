import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart' as badges;
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
import '../theme/my_color.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser myUser = ref.watch(myUserProvider).value!;
    final ScreenSize screenSize = ref.read(sizeProvider);
    final bool isPhone = screenSize == ScreenSize.phone;
    final TextStyle tTheme = Theme.of(context).textTheme.titleLarge!;
    final TextStyle sTheme = Theme.of(context).textTheme.bodyLarge!;
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
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: !isPhone
            ? Container()
            : SafeArea(
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
              ),
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

class LoginTextField extends ConsumerWidget {
  const LoginTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 65.1.h,
      // color: cinerous.withOpacity(0.15),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
      alignment: Alignment.bottomCenter,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: myUser == null
            ? Container()
            : FadeIn(
                child: TextFormField(
                  enabled: true,
                  expands: true,
                  maxLines: null,
                  cursorHeight: 27.r,
                  initialValue: myUser.name,
                  style: TextStyle(
                    fontSize: 18.r,
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3.r,
                    color: charcoal,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        debugPrint("Confirm");
                      },
                      child: Container(
                        width: 90.w,
                        //color: majorelleBlue,
                        alignment: Alignment.center,
                        child: Text(
                          "CHANGE",
                          style: TextStyle(
                            fontSize: 15.r,
                            fontFamily: 'Cabin',
                            fontWeight: FontWeight.w700,
                            color: cinerous,
                          ),
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        // color: spaceCadet,
                        width: 0.3.r,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        // color: frenchGray,
                        width: 0.3.r,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          //color: barnRed,
                          ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    labelText: 'Enter your Nick Name',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15.r, color: periwinkle,
                      fontWeight: FontWeight.w300,
                      //color: frenchGray,
                    ),
                  ),
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
                    color: lavenderWeb,
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
                          color: cinerous,
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.clipboard,
                        size: 21.r,
                        color: cinerous,
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

/*Expanded(child: Container()),
          Text(
            [
              "Gift your friends a new avatar",
              "Update your friends' profiles with a new avatar."
            ][0],
            style: TextStyle(
              fontSize: 21.r,
              fontFamily: 'DelaGothic',
              height: 1.8.r,
              color: cinerous,
            ),
          ),
          Text(
            "You can also enter their code below and present them with new avatars.",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  height: 2.1.r,
                  color: cinerous.withOpacity(0.75),
                  letterSpacing: 0,
                ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 24.r),
            height: 51.r,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  width: 300.w,
                  margin: EdgeInsets.only(right: 15.w),
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: lavenderWeb,
                    borderRadius: BorderRadius.circular(7.5.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enter the code",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: vanDyke.withOpacity(0.3),
                        ),
                      ),
                      //Text("ENTER")
                    ],
                  ),
                ),
              ],
            ),
          ),*/
