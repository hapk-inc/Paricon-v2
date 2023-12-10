import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../my_widget/login_option_button.dart';
import '../theme/my_color.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                IconButton(
                  onPressed: action,
                  icon: Icon(
                    Icons.close,
                    size: 21.r,
                  ),
                ),
              ],
            ),
            Text(
              "Increase your avatar collection by encouraging your "
              "friends and family to use the code above.",
              style: sTheme.copyWith(
                height: 2.1.r,
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
                      border: Border.all(width: 0.12.r, color: federalBlue),
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
    );
  }
}
