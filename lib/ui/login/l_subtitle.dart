import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../values/colors.dart';

class LSubtitle extends StatelessWidget {
  const LSubtitle(this.isNetConnected, {super.key});

  final bool isNetConnected;

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isNetConnected
            ? AutoSizeText.rich(
                TextSpan(
                  children: const [
                    TextSpan(text: "New to Paricon?"),
                    TextSpan(
                      text: " Create a account",
                      style: TextStyle(color: darkPastelGreen),
                    ),
                  ],
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                key: ValueKey(isNetConnected),
              )
            : AutoSizeText.rich(
                TextSpan(
                  children: const [
                    TextSpan(
                      text: "Please check your internet connection",
                      style: TextStyle(color: cornellRed),
                    ),
                    TextSpan(
                      text: " and try again",
                      style: TextStyle(color: hookerGreen),
                    ),
                  ],
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                maxLines: 1,
                key: ValueKey(isNetConnected),
              ),
      );
}
