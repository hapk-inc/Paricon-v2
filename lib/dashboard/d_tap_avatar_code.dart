import 'package:dart_emoji/dart_emoji.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../logic/user_provider.dart';

import '../model/my_user.dart';
import '../theme/my_color.dart';
import 'pass_avatar_dialog.dart';

class TapAvatarCode extends ConsumerWidget {
  const TapAvatarCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      height: 30.h,
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Tap here ",
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  final cText = await Clipboard.getData(Clipboard.kTextPlain);
                  final String text = cText?.text ?? "";
                  bool containsEmoji = EmojiUtil.hasOnlyEmojis(text ?? "");
                  if (context.mounted) {
                    if (!containsEmoji) {
                      return ScaffoldMessenger.of(context)
                          .showSnackBar(
                            SnackBar(
                              content: RichText(
                                text: TextSpan(
                                  text:
                                      "Copy the friend's avatar code and click ",
                                  children: const [
                                    TextSpan(
                                        text: "Tap here",
                                        style:
                                            TextStyle(color: darkPastelGreen))
                                  ],
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: ghostWhite1,
                                    fontSize: 15.r,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .closed
                          .then((value) => null);
                    }
                    final int emojiLength = text.characters.length;
                    //debugPrint(text.characters.length.toString());
                    debugPrint(text);
                    if (emojiLength != 6 ||
                        ((myUser?.avatarCode ?? "") == text)) {
                      return ScaffoldMessenger.of(context)
                          .showSnackBar(
                            SnackBar(
                              content: RichText(
                                text: const TextSpan(
                                    text: "Copy the friend's avatar code. ",
                                    children: [
                                      TextSpan(
                                        text: "Not yours",
                                        style: TextStyle(color: Colors.cyan),
                                      )
                                    ],
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: ghostWhite1)),
                              ),
                            ),
                          )
                          .closed
                          .then((value) => null);
                    }
                    showDialog(
                      context: context,
                      builder: (_) => PassAvatarDialog(text),
                    );
                  }
                },
              style: const TextStyle(color: darkPastelGreen),
            ),
            const TextSpan(
              text: "to paste avatar code",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        ),
        style: TextStyle(
          color: coolGray,
          fontWeight: FontWeight.normal,
          fontFamily: 'Poppins',
          fontSize: 12.r,
        ),
        maxLines: 1,
        //textAlign: TextAlign.center,
      ),
    );
  }
}
