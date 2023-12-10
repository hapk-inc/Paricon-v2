import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../my_widget/login_option_button.dart';
import '../../my_widget/my_logo.dart';
import '../../theme/my_color.dart';
import '../logic/auth_provider.dart';
import '../theme/my_theme.dart';

final PanelController _panelController = PanelController();

//final _scaffoldLoginMessengerKey = GlobalKey<ScaffoldMessengerState>();

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Welcome to Login");
    final pTheme = SlidingPanelTheme();

    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        if (!_panelController.isPanelOpen) {
          _panelController.open();
        }
      },
    );
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: majorelleBlue,
      body: SlidingUpPanel(
        controller: _panelController,
        borderRadius: pTheme.slidingPanelRadius,
        color: pTheme.slidingPanelColor,
        maxHeight: pTheme.slidingPanelHeight,
        defaultPanelState: PanelState.CLOSED,
        isDraggable: false,
        panel: Container(
          padding:
              pTheme.slidingPanelPadding + (pTheme.slidingPanelPadding * 0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: hookerGreen, fontFamily: 'WendyOne'),
              ),
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
              Gap(24.r),
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

class LoginButtonBar extends ConsumerStatefulWidget {
  const LoginButtonBar({super.key});

  @override
  ConsumerState createState() => _LoginButtonBarState();
}

class _LoginButtonBarState extends ConsumerState<LoginButtonBar> {
  late bool isLoading;

  Future<String?> get googleButtonClick => ref.read(gSignProvider.future);

  Future get guestLogin => ref.read(anonymousProvider.future);

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  void changeFlag(bool flag) {
    if (mounted) {
      setState(() => isLoading = flag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        LoginOptionButton(
          lChild: Image.asset('images/gLogo.png'),
          optionBtnPressed: isLoading
              ? () {
                  debugPrint("isLoading");
                }
              : () {
                  changeFlag(true);
                  if (kIsWeb) {
                    googleButtonClick.then(
                      (value) {
                        if (mounted) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(buildLoginSnackBar(email: value));
                        }
                      },
                    ).whenComplete(() => changeFlag(false));
                  } else {
                    if (Platform.isMacOS) {
                      guestLogin.then(
                        (value) {
                          if (mounted) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(buildLoginSnackBar());
                          }
                        },
                      ).whenComplete(() => changeFlag(false));
                    } else {
                      googleButtonClick.then(
                        (value) {
                          if (mounted) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(buildLoginSnackBar(email: value));
                          }
                        },
                      ).whenComplete(() => changeFlag(false));
                    }
                  }
                },
        )
      ],
    );
  }
}

/*class LoginButtonBar1 extends ConsumerWidget {
  const LoginButtonBar1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isSnackBarVisible() {
      if (_scaffoldKey.currentState != null) {
        return _scaffoldKey.currentState!.mounted;
      }
      return false;
    }

    return Consumer(
      builder: (_, ref, __) {
        void googleButtonClick() => ref.read(gSignProvider.future).then(
              (value) {
                if (value != null) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(buildLoginSnackBar(email: value));
                }
              },
            ).catchError(
              (e, s) {
                debugPrint(e.toString());
                debugPrintStack(stackTrace: s);
                /*if (kDebugMode) {
                  ref.read(anonymousProvider);
                }*/
              },
            );
        void guestClick() {
          if (_panelController.isPanelOpen) {
            _panelController.close();
          }
          ref.read(anonymousProvider);
          ScaffoldMessenger.of(context).showSnackBar(buildLoginSnackBar());
        }

        return Wrap(
          spacing: 15.r,
          children: [
            LoginOptionButton(
              lChild: Image.asset('images/gLogo.png'),
              optionBtnPressed: !isSnackBarVisible()
                  ? () {
                      debugPrint("Wait Loading");
                    }
                  : kIsWeb
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
}*/
