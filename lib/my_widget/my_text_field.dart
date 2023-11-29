import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

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
