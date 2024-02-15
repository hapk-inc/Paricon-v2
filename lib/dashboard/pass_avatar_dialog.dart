import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../logic/dashboard_provider.dart';
import '../logic/pass_avatar_provider.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

class PassAvatarDialog extends ConsumerStatefulWidget {
  const PassAvatarDialog({super.key});

  @override
  ConsumerState createState() => _PassAvatarDialogState();
}

class _PassAvatarDialogState extends ConsumerState<PassAvatarDialog> {
  final pTheme = SlidingPanelTheme();

  String arrayTxt = "";

  /*String str = List.generate(
                6,
                <String>(int index) => defaultEmojiSet[1]
                    .emoji[mockInteger(0, defaultEmojiSet[1].emoji.length - 1)]
                    .emoji).join();*/

  @override
  Widget build(BuildContext context) {
    final tTheme = Theme.of(context).textTheme;
    //List<String> old = ref.watch(passAvatarProvider).value ?? [];

    return AlertDialog(
      backgroundColor: ghostWhite1,
      surfaceTintColor: ghostWhite1,
      shape: RoundedRectangleBorder(
        borderRadius: pTheme.slidingPanelFullRadius,
      ),
      title: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: InkWell(
          onTap: () async {
            final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
            String? clipboardText = clipboardData?.text;
            setState(() => arrayTxt = clipboardText ?? "");
            Future.delayed(
              const Duration(milliseconds: 500),
              () {
                ref
                    .watch(searchAvatarCodeProvider(arrayTxt).future)
                    .whenComplete(
                      () => Navigator.pop(context),
                    )
                    .catchError((e, s) {
                  debugPrint(e.toString());
                  debugPrintStack(stackTrace: s);
                });
              },
            );
          },
          child: Icon(Icons.paste, size: 24.r),
        ),
        title: Text(
          ref.read(pasteCodeTitleTextProvider),
          maxLines: 1,
        ),
        titleTextStyle: TextStyle(
            fontFamily: 'WendyOne', color: violetBlue, fontSize: 18.r),
        horizontalTitleGap: 3.w,
      ),
      content: SizedBox(
        height: 120.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 45.h,
              alignment: Alignment.centerLeft,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  arrayTxt,
                  key: ValueKey(arrayTxt),
                  style: TextStyle(fontSize: 30.r),
                ),
              ),
            ),
            Gap(15.r),
            Text(
              ref.read(pasteCodeTextProvider),
              style: tTheme.bodySmall!.copyWith(
                color: gray,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
