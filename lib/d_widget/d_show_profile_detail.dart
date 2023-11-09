import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/auth_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../my_widget/login_option_button.dart';
import '../my_widget/show_t_score.dart';
import '../theme/my_color.dart';

class ShowProfileDetail extends ConsumerWidget {
  final Function({Object? returnValue}) action;

  const ShowProfileDetail(this.action, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final User? user = ref.watch(authUserProvider).value;

    if (myUser == null || user == null) return Container();
    late String createdAt;
    if (myUser.createdAt != null) {
      debugPrint(createdAt =
          DateFormat.yMMMMd('en_US').format(user.metadata.creationTime!));
    } else {
      debugPrint("CreatedAt empty");
      createdAt = "NIL";
    }

    return SafeArea(
      child: Container(
        color: majorelleBlue,
        constraints: const BoxConstraints.expand(),
        //padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(15.r),
              Container(
                height: 90.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                //color: charcoal,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      iconSize: 30.r,
                      color: ghostWhite,
                      onPressed: action,
                    ),
                    Flexible(
                      flex: 4,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: myUser.avatar == null || myUser.avatar!.isEmpty
                            ? CircleAvatar(
                                radius: 45.r,
                                backgroundColor: ghostWhite,
                                child: Text(
                                  myUser.name.substring(0, 2).toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        color: majorelleBlue,
                                        fontSize: 36.r,
                                      ),
                                ),
                              )
                            : Stack(
                                children: [
                                  Center(
                                    child: CircleAvatar(
                                      radius: 30.r,
                                      backgroundColor: majorelleBlue,
                                    ),
                                  ),
                                  Positioned(
                                    top: -3.r,
                                    bottom: -1.5.r,
                                    left: 0.r,
                                    right: 0.r,
                                    child: RandomAvatar(
                                      myUser.avatar!,
                                      trBackground: true,
                                      width: 30.r,
                                      height: 30.r,
                                    ),
                                  )
                                ],
                              ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Gap(15.r),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${myUser.name} ",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: ghostWhite),
                      ),
                      TextSpan(
                        text: "#${myUser.id}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: ghostWhite),
                      ),
                    ],
                  ),
                  maxLines: 1,
                ),
              ),
              Gap(3.r),
              Container(
                height: 30.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                alignment: Alignment.center,
                child: DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: ghostWhite),
                  child: Row(
                    children: [
                      Flexible(child: Text(myUser.rName)),
                      VerticalDivider(
                        color: ghostWhite,
                        indent: 7.5.r,
                      ),
                      if (user.isAnonymous)
                        const Flexible(child: Text("is Anonymous")),
                      if (user.email != null)
                        Flexible(child: Text(user.email ?? "abc@gmail.com")),
                      VerticalDivider(
                        color: ghostWhite,
                        indent: 7.5.r,
                      ),
                      if (myUser.createdAt != null)
                        Flexible(child: AutoSizeText(createdAt))
                    ],
                  ),
                ),
              ),
              Gap(36.r),
              if (myUser.bestDuration != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          AutoSizeText.rich(
                            TextSpan(
                              children: [
                                showTScore(myUser.bestDuration!,
                                    minute: ghostWhite, mm: ghostWhite)
                              ],
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontFamily: 'Montserrat', fontSize: 27.r),
                          ),
                          Text(
                            "Best Duration",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: ghostWhite),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              Gap(24.r),
              Container(
                height: 72.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                margin: EdgeInsets.symmetric(vertical: 9.h),
                // color: cinerous.withOpacity(0.15),
                // padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  enabled: true,
                  expands: true,
                  maxLines: null,
                  style: TextStyle(
                    fontSize: 15.r,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    //color: gunMetal,
                  ),
                  decoration: InputDecoration(
                    suffix: InkWell(
                      onTap: () {
                        debugPrint("Confirm");
                      },
                      child: Text(
                        "CONFIRM",
                        style: TextStyle(
                          fontSize: 15.r,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          //color: pistachio,
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
                    labelText: 'Enter Avatar Code',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15.r,
                      fontWeight: FontWeight.w300,
                      //color: frenchGray,
                    ),
                  ),
                ),
              ),
              //Gap(30.r),
              Container(
                height: 240.h,
                margin: EdgeInsets.symmetric(vertical: 15.r),
                color: charcoal,
              ),
              //Gap(30.r),
              Card(
                margin: EdgeInsets.all(15.r),
                elevation: 3.r,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.5.r),
                ),
                color: ghostWhite,
                child: Container(
                  height: 255.h,
                  padding: EdgeInsets.all(9.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get more Avatars",
                        style: TextStyle(
                          fontSize: 27.r,
                          height: 2.4.r,
                          fontFamily: 'DelaGothic',
                          color: cinerous,
                        ),
                      ),
                      Text(
                        "Increase your avatar collection by encouraging your "
                        "friends and family to use the code below.",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              height: 2.4.r,
                              color: cinerous,
                              letterSpacing: 0,
                            ),
                      ),
                      Gap(12.r),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15.r),
                        height: 51.r,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                              width: 240.w,
                              margin: EdgeInsets.only(right: 15.w),
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: lavenderWeb,
                                borderRadius: BorderRadius.circular(7.5.r),
                                border: Border.all(
                                  color: vanDyke,
                                  width: 0.15.r,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    myUser.avatarCode == null
                                        ? "Hold on.."
                                        : myUser.avatarCode!.toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 1.r,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.r,
                                      color: cinerous,
                                    ),
                                  ),
                                  Icon(
                                    Icons.copy,
                                    size: 21.r,
                                    color: cinerous,
                                  )
                                ],
                              ),
                            ),
                            LoginOptionButton(
                              lChild: Icon(
                                Icons.share,
                                size: 21.r,
                                color: cinerous,
                              ),
                              optionBtnPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
