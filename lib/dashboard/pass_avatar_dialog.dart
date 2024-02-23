import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../logic/pass_avatar_provider.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

class PassAvatarDialog extends ConsumerWidget {
  final String text;
  const PassAvatarDialog(this.text, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pTheme = SlidingPanelTheme();
    return ref.watch(searchAvatarCodeProvider(text)).when(
          data: (map) {
            debugPrint(map.toString());
            if (map.isEmpty) return Container();
            return SlideInUp(
              child: AlertDialog(
                elevation: 9.r,
                backgroundColor: ghostWhite1,
                shape: RoundedRectangleBorder(
                  borderRadius: pTheme.slidingPanelFullRadius,
                ),
                titlePadding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 15.h,
                ),
                title: SizedBox(
                  //color: coolGray,
                  height: 45.h,
                  child: ListTile(
                    dense: false,
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Pasting friend's code"),
                    leading: const Icon(Icons.paste),
                    horizontalTitleGap: 7.5.w,
                    titleTextStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color: violetBlue,
                      fontSize: 15.r,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                contentTextStyle: TextStyle(
                  fontSize: 12.r,
                  height: 1.8,
                  color: violetBlue,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins',
                ),
                content: SizedBox(
                  height: 150.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: TextStyle(fontSize: 39.r, letterSpacing: 1.5.r),
                        maxLines: 1,
                      ),
                      Gap(15.r),
                      Text(
                        "Looks like a this is ${map.values.first.name}'s avatar.",
                        //" Click below to pass new avatar",
                        style: const TextStyle(height: 2.4),
                      )
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () => ref
                        .read(updatePassAvatarProvider(map.keys.first).future)
                        .then(
                      (value) {
                        Navigator.pop(context);
                      },
                    ),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(violetBlue),
                    ),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: 300.w, maxHeight: 30.h),
                      child: Text(
                        "PASS NEW AVATAR TO ${map.values.first.name.toUpperCase()}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: ghostWhite1,
                          fontFamily: 'Montserrat',
                          fontSize: 12.r,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          error: (error, stackTrace) => Container(),
          loading: () => Container(),
        );
  }
}
