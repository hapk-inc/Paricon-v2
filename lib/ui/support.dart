import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../logic/app_check.dart';
import '../theme/my_color.dart';

import 'package:url_launcher/url_launcher.dart';

import '../logic/s_size.dart';
import '../my_widget/my_logo.dart';

@RoutePage()
class SupportPage extends ConsumerWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tTheme = Theme.of(context).textTheme;
    final bool? isAndroidWeb = ref.read(androidWebProvider);
    final ScreenSize sSize = ref.read(sizeProvider);
    final isPhoneTab = sSize == ScreenSize.phone ||
        sSize == ScreenSize.tab ||
        sSize == ScreenSize.iPad;
    debugPrint("$sSize");
    return Scaffold(
      backgroundColor: majorelleBlue,
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 15.w),
        child: isPhoneTab
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(90.r),
                  Padding(
                    padding: EdgeInsets.all(7.5.r),
                    child: const MyLogo(),
                  ),
                  Gap(30.r),
                  AutoSizeText(
                    "Online Multiplayer Puzzle Game",
                    style: tTheme.bodyMedium?.copyWith(
                      fontSize: 60.r,
                      color: lavenderWeb,
                    ),
                    maxLines: 3,
                  ),
                  Text(
                    "Powered by Hapk. Inc",
                    style: tTheme.bodySmall?.copyWith(
                      //fontSize: 60.r,
                      fontSize: 15.r,
                      color: lavenderWeb,
                    ),
                  ),
                  Gap(15.r),
                  SupportButtonBar(),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Gap(90.r),
                  Container(
                    color: ghostWhite1,
                    width: 150.w,
                    padding: EdgeInsets.all(7.5.r),
                    alignment: Alignment.center,
                    child: const MyLogo(),
                  ),
                  Gap(30.r),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Online Multiplayer Puzzle Game",
                          style: tTheme.bodyMedium?.copyWith(
                            fontSize: 75.r,
                            color: lavenderWeb,
                          ),
                          maxLines: 3,
                        ),
                        Gap(15.r),
                        Text(
                          "Powered by Hapk. Inc",
                          style: tTheme.bodySmall?.copyWith(
                            //fontSize: 60.r,
                            fontSize: 15.r,
                            color: lavenderWeb,
                          ),
                          maxLines: 1,
                        ),
                        Gap(15.r),
                        SupportButtonBar(),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

class SupportButtonBar extends ConsumerWidget {
  const SupportButtonBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool? isAndroidWeb = ref.read(androidWebProvider);
    return ButtonBar(
      children: [
        if (isAndroidWeb == null)
          Text(
            "VIEW IN MOBILE",
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: ghostWhite1,
              fontSize: 18.r,
            ),
          )
        else
          ElevatedButton(
            onPressed: () async {
              final appId = isAndroidWeb ? 'com.hapk.paricon' : '6478455538';
              final url = Uri.parse(
                (isAndroidWeb)
                    ? "https://play.google.com/store/apps/details?id=$appId"
                    : "https://apps.apple.com/app/id$appId",
              );
              launchUrl(
                url,
                mode: LaunchMode.externalApplication,
              );
            },
            child: Container(
              height: 45.h,
              alignment: Alignment.center,
              child: const Text(
                "REDIRECT TO APP",
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
            ),
          )
      ],
    );
  }
}
