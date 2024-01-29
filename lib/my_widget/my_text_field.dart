import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/auth_provider.dart';
import '../logic/panel_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

/*class LoginTextField extends ConsumerWidget {
  const LoginTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    if (myUser == null) return Container();
    final TextEditingController textEditingController =
        TextEditingController(text: myUser.name);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 72.h,
      // color: cinerous.withOpacity(0.15),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
      alignment: Alignment.bottomCenter,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: FadeIn(
          child: TextFormField(
            controller: textEditingController,
            enabled: true,
            expands: true,
            maxLines: null,
            cursorHeight: 27.r,
            cursorColor: ghostWhite,
            cursorWidth: 0.9.r,
            //initialValue: myUser.name,
            style: TextStyle(
              fontSize: 18.r,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3.r,
              color: ghostWhite,
            ),
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () {
                  debugPrint("Confirm");
                },
                child: Container(
                  width: 90.w,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      debugPrint("54--");
                      if (myUser.name != textEditingController.text) {
                        ref
                            .read(updateNameProvider(textEditingController.text)
                                .future)
                            .whenComplete(
                          () {
                            ref.read(settingPanelProvider).close();
                          },
                        );
                      } else {
                        ref.read(settingPanelProvider).close();
                      }
                    },
                    child: Text(
                      "CHANGE",
                      style: TextStyle(
                        fontSize: 15.r,
                        fontFamily: 'WendyOne',
                        fontWeight: FontWeight.w700,
                        color: ghostWhite,
                      ),
                    ),
                  ),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide: BorderSide(
                  color: ghostWhite,
                  width: 0.3.r,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.3.r),
                borderRadius: BorderRadius.circular(6.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(6.r),
              ),
              labelText: 'Enter your Nick Name',
              labelStyle: TextStyle(
                fontFamily: 'Cabin',
                fontSize: 15.r,
                color: periwinkle,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/
