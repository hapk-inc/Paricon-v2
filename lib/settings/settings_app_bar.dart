import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

AppBar settingAppBar(BuildContext context) => AppBar(
      iconTheme: IconThemeData(color: richBlack, size: 24.r),
      toolbarHeight: 90.h,
      centerTitle: false,
      titleSpacing: 0,
      title: Consumer(
        builder: (__, ref, _) {
          final MyUser? myUser = ref.watch(myUserProvider).value;

          return AnimatedSwitcher(
            key: ValueKey(myUser?.name ?? ""),
            duration: const Duration(milliseconds: 500),
            child: AutoSizeText.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Settings")
                  /*TextSpan(text: "${myUser?.name ?? ""} "),
                  TextSpan(
                    text: "#${myUser?.id.toString() ?? ""}",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                      fontSize: 12.r,
                    ),
                  ),*/
                ],
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        },
      ),
      /* actions: [
        Consumer(
          builder: (__, ref, _) {
            final PanelController controller = ref.watch(settingPanelProvider);

            return TextButton(
              onPressed: () {
                if (!controller.isPanelOpen) controller.open();
              },
              child: Text(
                "EDIT PROFILE",
                style: TextStyle(fontFamily: 'Poppins', fontSize: 15.r),
              ),
            );
          },
        ),
      ],*/
    );
