import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../my_widget/login_option_button.dart';
import '../../my_widget/my_logo.dart';
import '../../theme/my_color.dart';
import '../logic/auth.dart';
import '../theme/my_theme.dart';

final PanelController _panelController = PanelController();

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Welcome to Login");
    final pTheme = SlidingPanelTheme();
    Future.delayed(
      const Duration(milliseconds: 2100),
      () {
        if (!_panelController.isPanelOpen) {
          _panelController.open();
        }
      },
    );
    return Scaffold(
      backgroundColor: majorelleBlue,
      body: SlidingUpPanel(
        controller: _panelController,
        borderRadius: pTheme.slidingPanelRadius,
        color: pTheme.slidingPanelColor,
        maxHeight: pTheme.slidingPanelHeight,
        defaultPanelState: PanelState.CLOSED,
        isDraggable: false,
        panel: Container(
          padding: pTheme.slidingPanelPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: hookerGreen),
              ),
              //SizedBox(height: 9.h),
              RichText(
                text: TextSpan(
                  children: const [
                    TextSpan(
                      text: "New to Paricon?",
                      style: TextStyle(color: gray),
                    ),
                    TextSpan(
                      text: " Create a account",
                      style: TextStyle(color: darkPastelGreen),
                    ),
                  ],
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: 24.r),
              const Expanded(child: LoginButtonBar())
            ],
          ),
        ),
        minHeight: 0.h,
        body: const Center(child: MyLogo()),
      ),
    );
  }
}

class LoginButtonBar extends ConsumerWidget {
  const LoginButtonBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (_, ref, __) {
        void googleButtonClick() =>
            ref.read(gSignProvider.future).then((value) {}).catchError(
              (e, s) {
                debugPrint(e.toString());
                debugPrintStack(stackTrace: s);
                if (kDebugMode) {
                  ref.read(anonymousProvider);
                }
              },
            ).whenComplete(
              () {
                if (_panelController.isPanelOpen) {
                  // _panelController.close();
                }
              },
            );
        void guestClick() {
          if (_panelController.isPanelOpen) {
            _panelController.close();
          }
          ref.read(anonymousProvider);
          ScaffoldMessenger.of(context)
              .showSnackBar(buildLoginSnackBar())
              .closed
              .then(
                (value) {},
              );
        }

        return Wrap(
          spacing: 15.r,
          children: [
            LoginOptionButton(
              lChild: Image.asset('images/gLogo.png'),
              optionBtnPressed: kIsWeb
                  ? googleButtonClick
                  : Platform.isMacOS
                      ? guestClick
                      : googleButtonClick,
            ),
          ],
        );
      },
    );
  }
}
