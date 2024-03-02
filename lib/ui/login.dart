import 'dart:io';

import 'package:animate_do/animate_do.dart';
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
import '../logic/firebase_init.dart';
import '../theme/my_theme.dart';

final PanelController _panelController = PanelController();

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final pTheme = SlidingPanelTheme();

  @override
  void initState() {
    super.initState();
    debugPrint("Welcome to Login");
    Future.delayed(
      const Duration(milliseconds: 600),
      () {
        if (!_panelController.isPanelOpen) {
          if (mounted) {
            _panelController.open();
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        backgroundColor: majorelleBlue,
        body: SafeArea(
          bottom: false,
          child: SlidingUpPanel(
            controller: _panelController,
            borderRadius: pTheme.slidingPanelRadius,
            color: pTheme.slidingPanelColor,
            maxHeight: 210.h,
            defaultPanelState: PanelState.CLOSED,
            isDraggable: false,
            panel: const LoginPanel(),
            minHeight: 0.h,
            body: Column(
              children: [
                Gap(300.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                  child: FadeIn(child: const MyLogo()),
                ),
              ],
            ),
          ),
        ),
      );
}

class LoginPanel extends StatelessWidget {
  const LoginPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final pTheme = SlidingPanelTheme();
    final tTheme = Theme.of(context).textTheme;

    return Container(
      padding: pTheme.slidingPanelPadding + (pTheme.slidingPanelPadding * 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInRight(
            child: Text(
              "Login",
              style: tTheme.titleLarge!
                  .copyWith(color: hookerGreen, fontFamily: 'WendyOne'),
            ),
          ),
          FadeInRight(
            delay: const Duration(milliseconds: 900),
            child: RichText(
              text: TextSpan(
                children: const [
                  TextSpan(text: "New to Paricon?"),
                  TextSpan(
                    text: " Create a account",
                    style: TextStyle(color: darkPastelGreen),
                  ),
                ],
                style: tTheme.bodyLarge?.copyWith(color: frenchGray),
              ),
            ),
          ),
          Gap(18.r),
          const Expanded(child: LoginButtonBar())
        ],
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
  late bool isPhysicalDevice;

  Future<String?> get googleButtonClick {
    changeFlag(true);

    return ref.read(gSignProvider.future).whenComplete(() => changeFlag(false));
  }

  Future get guestLogin {
    changeFlag(true);
    return ref
        .read(anonymousProvider.future)
        .whenComplete(() => changeFlag(false));
  }

  Future get appleClick {
    changeFlag(true);
    return ref
        .read(appleClickProvider.future)
        .whenComplete(() => changeFlag(false));
  }

  @override
  void initState() {
    super.initState();
    isLoading = false;
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

  List<Widget> get loginOptionList => [
        if (!kIsWeb)
          if (Platform.isIOS || Platform.isMacOS)
            LoginOptionButton(
              optionBtnPressed: () async =>
                  kDebugMode ? guestLogin : appleClick,
              bColor: gray,
              lChild: ConstrainedBox(
                constraints: BoxConstraints.tight(Size.square(36.r)),
                child: const Icon(Icons.apple),
              ),
            ),
        Consumer(
          builder: (context, ref, child) {
            final isEmulator = ref.watch(isEmulatorProvider);
            return LoginOptionButton(
              optionBtnPressed: isLoading
                  ? () => debugPrint("Wait now")
                  : () => Platform.isMacOS || isEmulator
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
            );
          },
        ),
      ];

  @override
  Widget build(BuildContext context) => FadeInRight(
        delay: const Duration(milliseconds: 1500),
        child: Wrap(
          spacing: 15.w,
          children: loginOptionList,
        ),
      );
}
