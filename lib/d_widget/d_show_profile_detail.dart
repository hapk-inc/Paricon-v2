import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/auth_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../my_widget/show_t_score.dart';
import '../theme/my_color.dart';

class ShowProfileDetail extends ConsumerWidget {
  final Function({Object? returnValue}) action;

  const ShowProfileDetail(this.action, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final User? user = ref.watch(authUserProvider).value;

    if (myUser == null || user == null) return Container();
    late String createdAt;
    if (myUser.createdAt != null) {
      debugPrint(createdAt =
          DateFormat.yMMMMd('en_US').format(user.metadata.creationTime!));
    } else {
      debugPrint("CreatedAt empty");
      createdAt = "NIL";
    }

    return SafeArea(
      child: Container(
        color: majorelleBlue,
        constraints: const BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(15.r),
            Container(
              height: 90.h,
              //color: charcoal,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left),
                    iconSize: 30.r,
                    color: ghostWhite,
                    onPressed: action,
                  ),
                  Flexible(
                    flex: 4,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: myUser.avatar == null || myUser.avatar!.isEmpty
                          ? CircleAvatar(
                              radius: 45.r,
                              backgroundColor: ghostWhite,
                              child: Text(
                                myUser.name.substring(0, 2).toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: majorelleBlue,
                                      fontSize: 36.r,
                                    ),
                              ),
                            )
                          : Stack(
                              children: [
                                Center(
                                  child: CircleAvatar(
                                    radius: 30.r,
                                    backgroundColor: majorelleBlue,
                                  ),
                                ),
                                Positioned(
                                  top: -3.r,
                                  bottom: -1.5.r,
                                  left: 0.r,
                                  right: 0.r,
                                  child: RandomAvatar(
                                    myUser.avatar!,
                                    trBackground: true,
                                    width: 30.r,
                                    height: 30.r,
                                  ),
                                )
                              ],
                            ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Gap(15.r),
            AutoSizeText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "${myUser.name} ",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: ghostWhite),
                  ),
                  TextSpan(
                    text: "#${myUser.id}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ghostWhite),
                  ),
                ],
              ),
              maxLines: 1,
            ),
            Gap(3.r),
            Container(
              height: 30.h,
              alignment: Alignment.center,
              child: DefaultTextStyle(
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: ghostWhite),
                child: Row(
                  children: [
                    Flexible(child: Text(myUser.rName)),
                    VerticalDivider(
                      color: ghostWhite,
                      indent: 7.5.r,
                    ),
                    if (user.isAnonymous)
                      const Flexible(child: Text("is Anonymous")),
                    if (user.email != null)
                      Flexible(child: Text(user.email ?? "abc@gmail.com")),
                    VerticalDivider(
                      color: ghostWhite,
                      indent: 7.5.r,
                    ),
                    if (myUser.createdAt != null)
                      Flexible(child: AutoSizeText(createdAt))
                  ],
                ),
              ),
            ),
            Gap(60.r),
            if (myUser.bestDuration != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Column(
                      children: [
                        AutoSizeText.rich(
                          TextSpan(
                            children: [
                              showTScore(myUser.bestDuration!,
                                  minute: ghostWhite, mm: ghostWhite)
                            ],
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontFamily: 'Montserrat', fontSize: 27.r),
                        ),
                        Text(
                          "Best Duration",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: ghostWhite),
                        ),
                      ],
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
