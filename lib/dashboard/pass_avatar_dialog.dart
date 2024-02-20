import 'package:dart_emoji/dart_emoji.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../logic/dashboard_provider.dart';
import '../logic/pass_avatar_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
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
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final String myAvatarCode = myUser?.avatarCode ?? "";
    //List<String> old = ref.watch(passAvatarProvider).value ?? [];

    return AlertDialog(
      backgroundColor: ghostWhite1,
      surfaceTintColor: ghostWhite1,
      shape: RoundedRectangleBorder(
        borderRadius: pTheme.slidingPanelFullRadius,
      ),
      title: Container(
        height: 60.h,
        alignment: Alignment.centerLeft,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          leading: InkWell(
            onTap: () async {
              final clipboardData =
                  await Clipboard.getData(Clipboard.kTextPlain);
              String clipboardText = clipboardData?.text ?? "";

              bool containsEmoji = EmojiUtil.hasOnlyEmojis(clipboardText);
              if (containsEmoji) {
                bool isMineCode = myAvatarCode == clipboardText;
                if (isMineCode && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Paste your friend's code, not yours",
                        style:
                            TextStyle(fontSize: 13.5.r, fontFamily: 'Poppins'),
                      ),
                    ),
                  );
                } else {
                  setState(() => arrayTxt = clipboardText);
                  Future.delayed(
                    const Duration(milliseconds: 500),
                    () => ref
                        .watch(searchAvatarCodeProvider(arrayTxt).future)
                        .whenComplete(
                          () => Navigator.pop(context),
                        ),
                  );
                }
              }
            },
            child: Icon(Icons.paste, size: 24.r),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  ref.read(pasteCodeTitleTextProvider),
                  maxLines: 1,
                ),
              ),
              AspectRatio(
                aspectRatio: 1,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, size: 18.r, color: gray),
                ),
              )
            ],
          ),
          titleTextStyle: TextStyle(
              fontFamily: 'WendyOne', color: violetBlue, fontSize: 15.r),
          horizontalTitleGap: 3.w,
        ),
      ),
      content: SizedBox(
        height: 150.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 54.h,
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
