import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/tournament_database.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

class TopPlayerHorizontalList extends ConsumerWidget {
  const TopPlayerHorizontalList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> bestDList = ref.watch(bestDListProvider).value ?? [];

    return SizedBox(
      height: 75.h,
      child: Card(
        color: ghostWhite,
        margin: EdgeInsets.zero,
        elevation: 0.3.r,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        //alignment: Alignment.centerLeft,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 15.w),
          children: [
            Container(
              height: double.maxFinite,
              alignment: Alignment.centerLeft,
              child: Text(
                "Top Players",
                style: TextStyle(fontFamily: 'WendyOne', fontSize: 24.r),
              ),
            ),
            Gap(12.r),
            ...List.generate(
              bestDList.length,
              (index) {
                final String bD = bestDList[index];
                final MyUser? xUser = ref.watch(xUserProvider(bD)).value;
                return xUser == null
                    ? Container()
                    : Container(
                        //width: 135.w,
                        padding: EdgeInsets.only(left: 4.5.w, right: 13.5.w),
                        margin: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 18.r),
                        decoration: BoxDecoration(
                          color: [
                            aquamarine,
                            xantHous,
                            uranianBlue
                          ][mockInteger(0, 2)],
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              child: xUser.avatar == null
                                  ? Text(
                                      xUser.name
                                          .substring(0, 2)
                                          .toUpperCase()
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(fontSize: 15.r),
                                    )
                                  : RandomAvatar(xUser.avatar!),
                            ),
                            Gap(10.5.r),
                            AutoSizeText(
                              xUser.name,
                              style: TextStyle(
                                  fontSize: 13.5.r,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: federalBlue),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
