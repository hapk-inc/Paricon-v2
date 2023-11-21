import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:paricon/logic/auth_provider.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser myUser = ref.watch(myUserProvider).value!;
    final TextStyle tTheme = Theme.of(context).textTheme.titleLarge!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: majorelleBlue,
        titleSpacing: 0,
        iconTheme: IconThemeData(color: ghostWhite, size: 21.r),
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'Cabin',
          fontSize: 21.r,
          letterSpacing: 0.3.r,
        ),
        title: const AutoSizeText("Settings"),
      ),
      body: SafeArea(
        bottom: false,
        minimum: EdgeInsets.all(15.r),
        child: Column(
          children: [
            Container(
              height: 120.h,
              decoration: BoxDecoration(
                color: lightOrange,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              padding: EdgeInsets.all(15.r),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 45.r,
                    child: myUser.avatar == null
                        ? Text(myUser.name.substring(0, 2))
                        : RandomAvatar(myUser.avatar!),
                  ),
                  Gap(18.r),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          myUser.name,
                          style: tTheme.copyWith(
                            fontFamily: 'WendyOne',
                            color: charcoal,
                            height: 0,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Gap(15.r),
            OutlinedButton(
              onPressed: () => ref.read(signOutProvider),
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 15.w),
                ),
                fixedSize: MaterialStatePropertyAll(
                  Size.fromWidth(150.w),
                ),
              ),
              child: Text(
                "Logging off",
                style: TextStyle(
                    fontFamily: 'Cabin', fontSize: 18.r, color: charcoal),
              ),
            )
          ],
        ),
      ),
    );
  }
}
