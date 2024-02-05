import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:paricon/theme/my_color.dart';

import '../logic/auth_provider.dart';
import '../logic/panel_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_theme.dart';

class ChangeName extends ConsumerWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final pTheme = SlidingPanelTheme();
    if (myUser == null) return Container();
    final TextEditingController controller = TextEditingController();

    onSubmitted() => () {
          debugPrint("54--");
          if (myUser.name != controller.text) {
            ref.read(updateNameProvider(controller.text).future).whenComplete(
              () {
                if (ref.read(dashboardPanelProvider).isPanelOpen) {
                  ref.read(dashboardPanelProvider).close();
                }
                if (ref.read(settingPanelProvider).isPanelOpen) {
                  ref.read(settingPanelProvider).close();
                }
              },
            );
          } else {
            //ref.read(dashboardPanelProvider).close();
          }
        };
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Edit Name",
              style: TextStyle(fontFamily: 'Poppins', fontSize: 21.r),
            ),
            Text(
              "Change your current name here. Now you're ${myUser.name}",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                color: gray,
                fontSize: 12.r,
              ),
            ),
            Gap(24.r),
            //Gap(30.r),
            TextFormField(
              maxLines: 1,
              cursorColor: chocolateCosmos,
              cursorHeight: 30.r,
              cursorWidth: 1.2.r,
              controller: controller,
              keyboardType: TextInputType.name,
              autocorrect: true,
              onFieldSubmitted: (x) => onSubmitted(),
              onEditingComplete: onSubmitted(),
              style: TextStyle(
                color: chocolateCosmos,
                fontSize: 18.r,
                height: 2.1.r,
                fontWeight: FontWeight.normal,
                letterSpacing: 0.12.r,
              ),
              decoration: InputDecoration(
                hintText: 'Enter new name',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  letterSpacing: 0,
                  fontSize: 15.r,
                  color: gray,
                  fontWeight: FontWeight.w300,
                ),
                isDense: true,
                isCollapsed: false,
                suffixIcon: Container(
                  constraints: BoxConstraints.tight(Size.square(30.r)),
                  child: IconButton(
                    onPressed: onSubmitted(),
                    icon: Icon(Icons.abc, size: 45.r),
                  ),
                ),
              ),
            ),
            //Gap(12.r),
          ],
        ),
      ),
    );
  }
}

/*  /*border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                    color: ghostWhite,
                    width: 0.3.r,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                    color: chocolateCosmos,
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
                ),*/*/

/*TextFormField(
            controller: textEditingController,
            keyboardType: TextInputType.name,
            cursorHeight: 15.r,
            scrollPadding: EdgeInsets.zero,
            maxLines: null,
            showCursor: false,
            expands: true,
            decoration: InputDecoration(contentPadding: EdgeInsets.zero),
          ),*/

//contentPadding:
//    EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h)
/*contentPadding: EdgeInsets.only(
                  left: 15.w,
                  bottom: 15.h,
                  top: 30.h,
                  right: 15.w,
                ),*/

/* style: TextStyle(
                color: chocolateCosmos,
                fontSize: 18.r,
                height: 2.1.r,
              ),*/
//cursorHeight: 36.r,
