import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

class CopyCodeButton extends ConsumerStatefulWidget {
  const CopyCodeButton({super.key});

  @override
  ConsumerState createState() => _CopyCodeButtonState();
}

class _CopyCodeButtonState extends ConsumerState<CopyCodeButton> {
  late bool isCopyDone = false;
  late String avatarCode;

  @override
  void initState() {
    super.initState();
    avatarCode = ref.read(myUserProvider).value?.avatarCode ?? "";
    debugPrint("24--$avatarCode");
    Clipboard.getData(Clipboard.kTextPlain).then(
      (clipboardData) {
        setState(() => isCopyDone = clipboardData?.text == avatarCode);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: !isCopyDone ? darkPurple : emerald, //emerald
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 300),
      child: InkWell(
        onTap: () {
          Clipboard.setData(ClipboardData(text: avatarCode)).whenComplete(
            () => setState(() => isCopyDone = true),
          );
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            isCopyDone ? "COPIED 👍" : "COPY CODE",
            key: ValueKey(isCopyDone),
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15.r,
              fontWeight: FontWeight.normal,
              color: ghostWhite,
            ),
          ),
        ),
      ),
    );
  }
}
