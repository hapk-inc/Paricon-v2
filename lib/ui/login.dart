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
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 500),
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
  Widget build(BuildContext context) {
    debugPrint("Welcome to Login");
    final tTheme = Theme.of(context).textTheme;

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
                style: tTheme.titleLarge!
                    .copyWith(color: hookerGreen, fontFamily: 'WendyOne'),
              ),
              RichText(
                text: TextSpan(
                  children: const [
                    TextSpan(text: "New to Paricon?"),
                    TextSpan(
                      text: " Create a account",
                      style: TextStyle(color: darkPastelGreen),
                    ),
                  ],
                  style: tTheme.bodyLarge?.copyWith(color: gray),
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
  late bool isPhysicalDevice;

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
      if (isLoading) {
        _panelController.close();
      } else {
        _panelController.open();
      }
    }
  }

  List<Widget> get loginOptionList => [
        if (!kIsWeb)
          if (Platform.isIOS)
            LoginOptionButton(
              optionBtnPressed: () {},
              bColor: gray,
              lChild: ConstrainedBox(
                constraints: BoxConstraints.tight(Size.square(36.r)),
                child: const Icon(Icons.apple),
              ),
            ),
        LoginOptionButton(
          optionBtnPressed: isLoading
              ? () => debugPrint("Wait now")
              : () {
                  changeFlag(true);
                  if (kIsWeb || !isPhysicalDevice) {
                    guestLogin.whenComplete(() => changeFlag(false));
                  } else {
                    if (Platform.isMacOS) {
                      guestLogin.whenComplete(() => changeFlag(false));
                    } else {
                      googleButtonClick.whenComplete(() => changeFlag(false));
                    }
                  }
                },
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
    isPhysicalDevice = ref
        .watch(isPhysicalDeviceProvider)
        .when(data: (x) => x, error: (_, __) => true, loading: () => true);
    debugPrint("isPhysicalDevice $isPhysicalDevice");
    return Wrap(
      spacing: 15.w,
      children: loginOptionList,
    );
  }
}
