import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import '../logic/my_names.dart';
import 'package:random_avatar/random_avatar.dart';
import '../logic/auth_provider.dart';
import '../logic/pass_avatar_provider.dart';
import '../logic/s_size.dart';
import '../theme/my_color.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_theme.dart';

@RoutePage()
class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme tTheme = Theme.of(context).textTheme;
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final SlidingPanelTheme pTheme = SlidingPanelTheme();
    final ScreenSize screenSize = ref.watch(sizeProvider);
    final User? user = ref.watch(authUserProvider).value;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60.w,
        titleSpacing: 0,
        toolbarHeight: 90.h,
        centerTitle: false,
        title: myUser == null
            ? null
            : AutoSizeText.rich(
                TextSpan(
                  text: myUser.rName,
                  children: [
                    TextSpan(
                        text: " #${myUser.id}",
                        style: TextStyle(fontSize: 15.r, color: frenchGray))
                  ],
                  style: tTheme.bodyMedium!.copyWith(
                    color: ghostWhite1,
                    fontFamily: 'Montserrat',
                    fontSize: 24.r,
                  ),
                ),
              ),
      ),
      body: SafeArea(
        //minimum: EdgeInsets.symmetric(horizontal: 15.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header1(
                    "You will be shown as",
                    hStyle: tTheme.bodySmall?.copyWith(
                      fontSize: 13.2.r,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Container(
                    height: 60.h,
                    //color: xantHous,
                    padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller:
                          TextEditingController(text: myUser?.name ?? ""),
                      maxLines: 1,
                      cursorColor: chocolateCosmos,
                      cursorHeight: 30.r,
                      cursorWidth: 1.2.r,
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                        color: chocolateCosmos,
                        fontSize: 18.r,
                        height: 2.1,
                        letterSpacing: 0.r,
                        fontFamily: 'Montserrat',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Give a new name',
                        contentPadding: _textFieldContentPadding,
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13.5.r,
                          color: frenchGray,
                          fontWeight: FontWeight.w300,
                        ),
                        isDense: true,
                        isCollapsed: false,
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: majorelleBlue, width: 0.45.r),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: majorelleBlue, width: 1.2.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(15.r),
            Container(
              height: 450.h,
              //color: xantHous,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.r),
                    child: Header1(
                      "Available Cards - ${myUser?.avatarArr.length ?? 0}",
                      hStyle: tTheme.bodyMedium?.copyWith(
                        fontSize: 16.5.r,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Gap(15.r),
                  Expanded(
                    child: (myUser?.avatarArr ?? []).isEmpty
                        ? Container(color: magnolia)
                        : GridView.custom(
                            //scrollDirection: Axis.horizontal,
                            gridDelegate: SliverWovenGridDelegate.count(
                              crossAxisCount:
                                  screenSize == ScreenSize.phone ? 2 : 3,
                              mainAxisSpacing: 1.2.r,
                              crossAxisSpacing: 1.2.r,
                              pattern: [
                                const WovenGridTile(1, crossAxisRatio: 0.9),
                                const WovenGridTile(1),
                              ],
                            ),
                            childrenDelegate: SliverChildBuilderDelegate(
                              (_, index) {
                                final String e =
                                    myUser?.avatarArr[index] ?? mockString(1);
                                return Card(
                                  margin: EdgeInsets.all(3.r),
                                  elevation: 3.r,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.5.r),
                                  ),
                                  child: AnimatedContainer(
                                    //padding: EdgeInsets.all(4.5.r),
                                    margin: EdgeInsets.all(4.5.r),
                                    duration: const Duration(milliseconds: 500),
                                    color: (myUser?.avatar ?? "") == e
                                        ? xantHous
                                        : uranianBlue,
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          bottom: -24.r,
                                          child: FadeInUp(
                                            delay: const Duration(
                                                milliseconds: 300),
                                            child: InkWell(
                                              onDoubleTap: () => ref.watch(
                                                  updateFaceAvatarProvider(
                                                      myUser?.avatarArr[
                                                              index] ??
                                                          mockString(1))),
                                              child: RandomAvatar(
                                                myUser?.avatarArr[index] ??
                                                    mockString(1),
                                                trBackground: true,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //padding: EdgeInsets.all(3.r),
                                );
                              },
                              childCount: myUser?.avatarArr.length ?? 1,
                            ),
                          ),
                  )
                ],
              ),
            )
            /*const SizedBox(height: 15),
            const Header1("Available Cards"),
            const SizedBox(height: 15),
            Expanded(
              child: (myUser?.avatarArr ?? []).isEmpty
                  ? Container(
                      color: magnolia,
                    )
                  : GridView.custom(
                      //scrollDirection: Axis.horizontal,
                      gridDelegate: SliverWovenGridDelegate.count(
                        crossAxisCount: screenSize == ScreenSize.phone ? 2 : 3,
                        mainAxisSpacing: 1.2.r,
                        crossAxisSpacing: 1.2.r,
                        pattern: [
                          const WovenGridTile(1, crossAxisRatio: 0.9),
                          const WovenGridTile(1),
                        ],
                      ),
                      childrenDelegate: SliverChildBuilderDelegate(
                        (_, index) {
                          final String e =
                              myUser?.avatarArr[index] ?? mockString(1);
                          return Card(
                            margin: EdgeInsets.all(3.r),
                            elevation: 3.r,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.5.r),
                            ),
                            child: AnimatedContainer(
                              //padding: EdgeInsets.all(4.5.r),
                              margin: EdgeInsets.all(4.5.r),
                              duration: const Duration(milliseconds: 500),
                              color: (myUser?.avatar ?? "") == e
                                  ? xantHous
                                  : uranianBlue,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    bottom: -24.r,
                                    child: FadeInUp(
                                      delay: const Duration(milliseconds: 300),
                                      child: InkWell(
                                        onDoubleTap: () => ref.watch(
                                            updateFaceAvatarProvider(
                                                myUser?.avatarArr[index] ??
                                                    mockString(1))),
                                        child: RandomAvatar(
                                          myUser?.avatarArr[index] ??
                                              mockString(1),
                                          trBackground: true,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            //padding: EdgeInsets.all(3.r),
                          );
                        },
                        childCount: myUser?.avatarArr.length ?? 1,
                      ),
                    ),
            ),*/
          ],
        ),
      ),
    );
  }
}

class Header1 extends StatelessWidget {
  final String text;
  final TextStyle? hStyle;
  const Header1(this.text, {this.hStyle, super.key});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: hStyle,
        /*style: TextStyle(
          fontFamily: text.contains("Available") ? "Montserrat" : 'Poppins',
          fontWeight:
              text.contains("Available") ? FontWeight.normal : FontWeight.w300,
          color: text == "Logged in"
              ? gray
              : text.contains("Available")
                  ? vanDyke
                  : gray,
          fontSize: text.contains("Available") ? 18.r : 15.r,
        ),*/
      );
}

//const SizedBox(height: 15),
/*Container(
              margin: EdgeInsets.symmetric(vertical: 15.h),
              decoration: BoxDecoration(
                color: aquamarine,
                borderRadius: BorderRadius.circular(7.5.r),
                border: Border.all(width: 0.03.r, color: magnolia),
              ),
              height: 105.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Header1("Logged in"),
                  Container(
                    // decoration: const BoxDecoration(color: magnolia1),
                    height: 45.h,
                    alignment: Alignment.center,
                    child: TextFormField(
                      enabled: false,
                      controller: TextEditingController(
                        text: (user?.isAnonymous ?? true)
                            ? "${mockAvatarName().toLowerCase()}@gmail.com"
                            : (user?.email ?? "@gmail.com"),
                      ),
                      maxLines: 1,
                      style: TextStyle(
                        color: vanDyke,
                        fontSize: 18.r,
                        height: 2.1,
                        fontFamily: 'Montserrat',
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                            _textFieldContentPadding.copyWith(bottom: 0),
                        isDense: true,
                        isCollapsed: false,
                        disabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: majorelleBlue, width: .03.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),*/

EdgeInsets get _textFieldContentPadding => EdgeInsets.fromLTRB(0.w, 0, 0, 12.h);
