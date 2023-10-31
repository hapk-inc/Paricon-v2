import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/model/my_duration.dart';

import '../../logic/user_datastore.dart';
import '../../model/my_user.dart';
import '../../my_widget/login_option_button.dart';
import '../../theme/my_color.dart';

class DCardCollection extends ConsumerWidget {
  const DCardCollection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final MyDuration? myDuration = ref.watch(myDurationProvider).value;

    return Container(
      color: lavenderBlush.withOpacity(0.12),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
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
            margin: EdgeInsets.symmetric(vertical: 21.r),
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
                        myDuration == null
                            ? "Hold on.."
                            : myDuration.avatarCode!.toUpperCase(),
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
          ),
        ],
      ),
    );
  }
}

class DCardCollection1 extends ConsumerWidget {
  const DCardCollection1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: onyx,
        borderRadius: BorderRadius.circular(0.3.r),
      ),
      //margin: EdgeInsets.all(9.r),
      padding: EdgeInsets.all(15.r),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const AutoSizeText(
                        "Ask your friends to enter code below to get more avatar",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: azure,
                          fontWeight: FontWeight.w200,
                          height: 2.4,
                        ),
                        maxLines: 2,
                        maxFontSize: 12,
                        minFontSize: 6,
                        textAlign: TextAlign.right,
                      ),
                      SizedBox.square(dimension: 24.r),
                      Expanded(
                        child: Text(
                          mockString(6, 'A'),
                          style: TextStyle(
                              fontSize: 30.r,
                              fontFamily: 'DelaGothic',
                              letterSpacing: 1.5.r,
                              color: azure),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              VerticalDivider(
                indent: 9.r,
                endIndent: 9.r,
                color: azure,
                thickness: 0.45.r,
              ),
              Flexible(
                flex: 2,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 0.9,
                  child: Lottie.asset(
                    'lottie/avatar-outline.json',
                    //width: 180.r,
                    //height: 180.r,
                    repeat: false,
                    controller: const AlwaysStoppedAnimation(0.012),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            right: 0,
            bottom: -0.r,
            child: FittedBox(
              child: Text(
                "Click here to enter",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: azure,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w200,
                      fontSize: 10.8.r,
                    ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: -0.r,
            child: Text(
              "View all Avatars",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: gray,
                    fontFamily: 'Montserrat',
                    fontSize: 10.8.r,
                    fontWeight: FontWeight.w200,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
