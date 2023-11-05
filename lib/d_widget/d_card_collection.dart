import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../my_widget/login_option_button.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';
import 'd_enter_avatar_code_page.dart';

class DCardCollection extends ConsumerWidget {
  const DCardCollection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    //final PUser? pUser = ref.watch(pUserMeProvider).value;
    if (myUser == null) return Container();
    final String? avatarCode = myUser.avatarCode;

    return Container(
      //color: lavenderBlush.withOpacity(0.12),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Get more Avatars",
            style: TextStyle(
              fontSize: 21.r,
              height: 2.1.r,
              fontFamily: 'DelaGothic',
              color: cinerous,
            ),
          ),
          Text(
            "Increase your avatar collection by encouraging your "
            "friends and family to use the code above.",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  height: 2.1.r,
                  color: cinerous.withOpacity(0.75),
                  letterSpacing: 0,
                ),
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
                    borderRadius: BorderRadius.circular(7.5.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        avatarCode == null
                            ? "Hold on.."
                            : avatarCode.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          letterSpacing: 1.r,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.r,
                          color: vanDyke,
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
                  lChild: Icon(Icons.share, size: 21.r),
                  optionBtnPressed: () {},
                )
              ],
            ),
          ),
          Expanded(
            child: Divider(
              color: cinerous,
              thickness: 0.45.r,
              endIndent: 15.w,
              indent: 15.w,
            ),
          ),
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
                OpenContainer(
                  closedElevation: 0,
                  middleColor: lavenderWeb,
                  closedBuilder:
                      (BuildContext context, void Function() action) {
                    return Container(
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
                    );
                  },
                  openBuilder: (BuildContext context,
                      void Function({Object? returnValue}) action) {
                    return const EnterAvatarCodePage();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
