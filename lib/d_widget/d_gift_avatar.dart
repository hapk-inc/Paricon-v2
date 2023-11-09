import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/my_color.dart';
import 'd_enter_avatar_code_page.dart';

class GiftAvatar extends StatelessWidget {
  const GiftAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      tappable: false,
      closedBuilder: (_, void Function() action) =>
          GiftAvatarCloseContainer(action),
      closedShape:
          const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      closedElevation: 0,
      closedColor: ghostWhite,
      openBuilder: (_, void Function({bool? returnValue}) action) =>
          const EnterAvatarCodePage(),
    );
  }
}

class GiftAvatarCloseContainer extends StatelessWidget {
  final void Function() action;

  const GiftAvatarCloseContainer(this.action, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      //color: cinerous.withOpacity(0.9),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Gift your friends a new avatar",
                style: TextStyle(
                  fontSize: 27.r,
                  fontFamily: 'DelaGothic',
                  height: 1.8.r,
                  color: cinerous,
                ),
                maxLines: 1,
              ),
              Text(
                "You can also enter their code below and present them with new avatars.",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      height: 2.1.r,
                      color: cinerous.withOpacity(0.75),
                      letterSpacing: 0,
                    ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 24.r),
            height: 51.r,
            decoration: BoxDecoration(
              color: cinerous,
              borderRadius: BorderRadius.circular(7.5.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7.5.r),
              child: Row(
                children: [
                  Container(
                    width: 255.w,
                    color: lavenderWeb,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Text(
                      "Enter the code",
                      style: TextStyle(
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w400,
                        color: vanDyke.withOpacity(0.3),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: action,
                      child: Text(
                        "SHARE",
                        style: TextStyle(
                          fontFamily: 'Cabin',
                          fontSize: 15.r,
                          color: ghostWhite,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
