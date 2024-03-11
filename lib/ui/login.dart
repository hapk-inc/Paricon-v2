import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/app_check.dart';
import '../logic/auth_provider.dart';
import '../my_widget/login_option_button.dart';
import '../my_widget/my_logo.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

final PanelController _panelController = PanelController();

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final pTheme = SlidingPanelTheme();
  late bool isLoading;
  late bool isNetConnected;

  @override
  void initState() {
    super.initState();
    debugPrint("Welcome to Login");
    isLoading = false;
    isNetConnected = true;
    Future.delayed(
      const Duration(milliseconds: 900),
      () {
        if (!_panelController.isPanelOpen) {
          if (mounted) {
            _panelController.open();
          }
        }
      },
    );
  }

  void changeFlag(bool flag) {
    if (mounted) {
      setState(() => isLoading = flag);
      if (isLoading) {
        _panelController.close();
      } else {
        _panelController.open();
      }
    }
  }

  Future get guestLogin {
    changeFlag(true);
    return ref.read(anonymousProvider.future).onError(
      (error, _) {
        if (error is FirebaseAuthException) {
          debugPrint("Guest Login error${error.code}");
          switch (error.code) {
            case "network-request-failed":
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: vanDyke,
                  content: Text("Network error. Please check your internet"),
                ),
              );
          }
        }
      },
    ).whenComplete(() => changeFlag(false));
  }

  Future<String?> get googleButtonClick {
    changeFlag(true);

    return ref.read(gSignProvider.future).catchError((_, __) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: vanDyke,
          content: Text("Retry Google Sign-In"),
        ),
      );
      return null;
    }).whenComplete(() => changeFlag(false));
  }

  Future get appleClick {
    changeFlag(true);
    return ref
        .read(appleClickProvider.future)
        .whenComplete(() => changeFlag(false));
  }

  List<Widget> get loginOptionList => [
        if (!kIsWeb)
          if (Platform.isIOS || Platform.isMacOS)
            LoginOptionButton(
              optionBtnPressed: isLoading
                  ? () => debugPrint("Wait now")
                  : () => kDebugMode ? guestLogin : appleClick,
              bColor: gray,
              lChild: ConstrainedBox(
                constraints: BoxConstraints.tight(Size.square(36.r)),
                child: const Icon(Icons.apple),
              ),
            ),
        LoginOptionButton(
          optionBtnPressed: isLoading
              ? () => debugPrint("Wait now")
              : () => kIsWeb
                  ? guestLogin
                  : Platform.isMacOS || ref.watch(isEmulatorProvider)
                      ? guestLogin
                      : googleButtonClick,
          bColor: pictonBlue,
          lChild: ConstrainedBox(
            constraints: BoxConstraints.tight(Size.square(36.r)),
            child: Container(
              padding: EdgeInsets.all(4.5.r),
              alignment: Alignment.center,
              constraints: BoxConstraints.tight(Size.square(36.r)),
              child: Image.asset('images/gLogo.png'),
            ),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final TextTheme tTheme = Theme.of(context).textTheme;

    ref.listen<int>(
      netConnectedNotifierProvider.select((value) => value),
      (previous, next) {
        final bool x = next != -1;
        debugPrint("netConnectedNotifierProvider in Login equals $next");
        setState(() => isNetConnected = x);
      },
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: majorelleBlue,
      body: SafeArea(
        bottom: false,
        child: SlidingUpPanel(
          controller: _panelController,
          borderRadius: pTheme.slidingPanelRadius,
          color: pTheme.slidingPanelColor,
          maxHeight: 225.h,
          defaultPanelState: PanelState.CLOSED,
          isDraggable: false,
          minHeight: 0.h,
          panel: Container(
            padding: pTheme.slidingPanelPadding * 1.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInRight(
                  child: Text(
                    "Login",
                    style: tTheme.bodyMedium!.copyWith(color: hookerGreen),
                  ),
                ),
                FadeInRight(
                  delay: const Duration(milliseconds: 900),
                  child: LoginSubText(isNetConnected),
                ),
                Gap(15.r),
                Expanded(
                  child: FadeInRight(
                    delay: const Duration(milliseconds: 1500),
                    child: Wrap(
                      spacing: 15.w,
                      children: loginOptionList,
                    ),
                  ),
                )
              ],
            ),
          ),
          body: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.fromLTRB(7.5.w, 240.h, 7.5.w, 0),
            child: FadeIn(child: const MyLogo()),
          ),
        ),
      ),
    );
  }
}

class LoginSubText extends StatelessWidget {
  const LoginSubText(this.isNetConnected, {super.key});

  final bool isNetConnected;

  @override
  Widget build(BuildContext context) {
    final TextTheme tTheme = Theme.of(context).textTheme;
    return AnimatedSwitcher(
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
                style: tTheme.bodyLarge
                    ?.copyWith(color: frenchGray, letterSpacing: 0),
              ),
              key: const ValueKey(true),
            )
          : AutoSizeText.rich(
              TextSpan(
                children: const [
                  TextSpan(
                    text: "Please check your internet connection",
                    style: TextStyle(color: cornellRed),
                  ),
                  TextSpan(
                    text: "  and try again",
                    style: TextStyle(color: darkPastelGreen),
                  ),
                ],
                style: tTheme.bodyLarge?.copyWith(
                  color: frenchGray,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              maxLines: 1,
              key: const ValueKey(false),
            ),
    );
    /*return RichText(
      text: TextSpan(
        children: [
          if (isNetConnected) ...[
            const TextSpan(text: "New to Paricon?"),
            const TextSpan(
              text: " Create a account",
              style: TextStyle(color: darkPastelGreen),
            ),
          ] else ...[
            const TextSpan(
              text: "Please check your internet connection",
              style: TextStyle(color: cornellRed),
            ),
            const TextSpan(
              text: " and try again",
              style: TextStyle(color: darkPastelGreen),
            ),
          ]
        ],
        style: tTheme.bodyLarge?.copyWith(color: frenchGray, letterSpacing: 0),
      ),
    );*/
  }
}
