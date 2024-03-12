import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/auth_provider.dart';
import '../logic/panel_provider.dart';
import '../theme/my_color.dart';

class DeactivateAccount extends ConsumerWidget {
  const DeactivateAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  "Before you go ...",
                  style: TextStyle(
                    color: amaranthPurple,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    height: 1.8,
                  ),
                ),
                subtitle: FadeIn(
                  child: AutoSizeText(
                    "Deactivating your\nAccount",
                    style: TextStyle(color: amaranthPurple),
                    maxLines: 2,
                  ),
                ),
              ),
              ...[
                "If you want to change username, "
                    "you can do here.",
                "Account Deletion is final. "
                    "There will be no way to restore your account",
              ].map(
                (e) => GridTileBar(
                  leading: SizedBox(
                    width: 15.w,
                    child: Icon(Icons.circle, size: 7.5.r, color: vanDyke),
                  ),
                  title: Text(
                    e,
                    maxLines: 2,
                    style: TextStyle(
                      color: cinerous,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                      fontSize: 13.5.r,
                      height: 2.1.r,
                    ),
                  ),
                ),
              ),
              FadeIn(
                delay: const Duration(milliseconds: 900),
                child: ButtonBar(
                  buttonTextTheme: ButtonTextTheme.normal,
                  children: ["I DON'T WANNA DO THIS NOW", "DEACTIVATE NOW"].map(
                    (e) {
                      final bool isDeactivate = e.contains('DEACTIVATE');
                      return TextButton(
                        onPressed: isDeactivate
                            ? () => ref.read(deleteAccountProvider)
                            : () => ref.read(settingPanelProvider).close(),
                        child: Text(
                          e,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 13.5.r,
                            color: isDeactivate ? frenchGray : federalBlue,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              //SizedBox.square(dimension: 30)
            ],
          ),
        ),
      );
}

class DeActivateListTile extends StatelessWidget {
  final String text;
  const DeActivateListTile(this.text, {super.key});

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 6,
        child: GridTileBar(
          leading: Container(
            width: 30.w,
            alignment: Alignment.center,
            child: Icon(Icons.circle, size: 9.r, color: gray),
          ),
          title: Text(
            text,
            maxLines: 2,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
              color: gray,
              letterSpacing: 0,
              fontSize: 15.r,
              height: 1.8.r,
            ),
          ),
        ),
      );
}
