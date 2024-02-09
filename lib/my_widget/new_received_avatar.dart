import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/my_names.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

class NewReceivedAvatar extends ConsumerWidget {
  const NewReceivedAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tTheme = Theme.of(context).textTheme;
    final MyUser? myUser = ref.watch(myUserProvider).value;

    return Container(
      height: 240.h,
      color: ghostWhite,
      padding: EdgeInsets.all(12.r),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Avatars",
            style: tTheme.bodyMedium!.copyWith(
              height: 1.8.r,
              fontFamily: 'Honk',
              color: drabDarkBrown,
            ),
          ),
          Gap(3.r),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 7.5.w),
              children: List.generate(
                  4,
                  (index) => Container(
                        width: 150.w,
                        margin: EdgeInsets.only(right: 15.w),
                        child: Card(
                          color: gridColor[index % 3],
                          child: Stack(
                            children: [
                              Positioned.fill(
                                bottom: -15.r,
                                child: FadeInUp(
                                  child: RandomAvatar(
                                    mockString(),
                                    trBackground: true,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 7.5.r,
                                height: 54.h,
                                left: 15.r,
                                right: 15.r,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ghostWhite.withOpacity(0.75),
                                      borderRadius:
                                          BorderRadius.circular(7.5.r)),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 7.5.r),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Shared by",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 7.5.r,
                                          color: gray,
                                        ),
                                      ),
                                      Gap(4.5.r),
                                      AutoSizeText(
                                        myRandomName(),
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 13.5.r,
                                          color: gray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
