import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paricon/my_widget/enter_avatar_pinput.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

class EnterAvatarCode extends ConsumerWidget {
  const EnterAvatarCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    return myUser == null
        ? Container()
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Gift your friends, a new avatars",
                        style: TextStyle(
                          fontSize: 30.r,
                          fontFamily: 'WendyOne',
                          height: 1.8.r,
                          color: cinerous,
                        ),
                        maxLines: 2,
                      ),
                      //Gap(6.r),
                      AutoSizeText(
                        "Enter their code below and present them with new avatars.",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              height: 2.1.r,
                              color: cinerous,
                              letterSpacing: 0,
                              fontFamily: 'Poppins',
                            ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  margin: EdgeInsets.symmetric(vertical: 24.r),
                  height: 48.r,
                  decoration: BoxDecoration(
                    color: cinerous,
                    borderRadius: BorderRadius.circular(7.5.r),
                  ),
                  child: InkWell(
                    onTap: () => showGeneralDialog(
                      barrierColor: Colors.black.withOpacity(0.72),
                      transitionBuilder: (_, x, ___, __) => Transform.scale(
                        scale: x.value,
                        child: Opacity(
                          opacity: x.value,
                          child: AlertDialog(
                            backgroundColor: chocolateCosmos,
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.5.r),
                              borderSide: const BorderSide(
                                  width: 0, color: chocolateCosmos),
                            ),
                            title: const Text(
                              'Enter the avatar code',
                              style: TextStyle(
                                  fontFamily: 'WendyOne', color: xantHous),
                            ),
                            insetPadding:
                                EdgeInsets.symmetric(horizontal: 7.5.w),
                            content: AnimatedContainer(
                              color: chocolateCosmos,
                              duration: const Duration(milliseconds: 500),
                              height: 72.h,
                              // color: cinerous.withOpacity(0.15),
                              padding: EdgeInsets.symmetric(
                                horizontal: 3.w,
                                vertical: 3.h,
                              ),
                              alignment: Alignment.bottomCenter,
                              child: const EnterAvatarCodePinPut(),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "SHARE NOW",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: ghostWhite,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      transitionDuration: const Duration(milliseconds: 200),
                      barrierDismissible: true,
                      barrierLabel: '',
                      context: context,
                      pageBuilder: (_, animation1, animation2) => Container(),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.5.r),
                      child: Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            width: 225.w,
                            color: wheat,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: AutoSizeText.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(text: "Your code - "),
                                  TextSpan(
                                    text: myUser.avatarCode,
                                    style:
                                        const TextStyle(color: chocolateCosmos),
                                  ),
                                ],
                              ),
                              style: TextStyle(
                                fontFamily: 'Cabin',
                                fontSize: 15.r,
                                fontWeight: FontWeight.w400,
                                color: cinerous,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "ENTER CODE",
                                style: TextStyle(
                                  fontFamily: 'Cabin',
                                  fontSize: 13.5.r,
                                  color: ghostWhite,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
