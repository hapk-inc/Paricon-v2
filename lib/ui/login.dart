import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:logger/logger.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../enums/enums.dart';
import '../logic/app/size_provider.dart';
import '../logic/login/notifier.dart';
import '../my_widget/pi_logo.dart';
import '../values/colors.dart';
import 'login/l_subtitle.dart';
import 'login/login_button.dart';
import 'my_theme.dart';

final PanelController _panelController = PanelController();
const Duration _m900 = Duration(milliseconds: 900);
const Duration _m1200 = Duration(milliseconds: 1200);

Logger _logger = Logger();

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState createState() => _LoginPageState();
}

final SlidingPanelTheme _pTheme = SlidingPanelTheme();

class _LoginPageState extends ConsumerState<LoginPage> {
  late bool isLoading;
  late bool isNetConnected;

  @override
  void initState() {
    super.initState();
    _logger.i("Welcome to Login");
    isLoading = false;
    isNetConnected = true;
    Future.delayed(_m900, openPanelAfterDelay);
  }

  openPanelAfterDelay() {
    if (!_panelController.isPanelOpen) {
      if (mounted) {
        _panelController.open();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      loginNotifierProvider.select((value) => value.isLoading),
      (previous, next) {
        if (mounted) {
          if (next) {
            _panelController.close();
          } else {
            _panelController.open();
          }
        }
      },
    );

    final ScreenSize screenSize = ref.watch(sizeProvider);
    final sizeNotifier = SizeNotifier(screenSize);

    return Scaffold(
      backgroundColor: majorelleBlue,
      body: SafeArea(
        bottom: false,
        child: SlidingUpPanel(
          controller: _panelController,
          borderRadius:
              _pTheme.slidingPanelRadius * (sizeNotifier.isPad ? 1.8 : 1),
          color: _pTheme.slidingPanelColor,
          maxHeight: 240.h,
          defaultPanelState: PanelState.CLOSED,
          padding:
              _pTheme.slidingPanelPadding * (sizeNotifier.isPad ? 3 : 1.8.r),
          isDraggable: false,
          minHeight: 0,
          panel: FadeIn(
            child: sizeNotifier.isPad
                ? Container()
                : PanelVertical(isNetConnected),
          ),
          body: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: 300.r,
                left: sizeNotifier.isPad ? 30.w : 15.w,
                right: sizeNotifier.isPad ? 30.w : 15.w,
                child: const MyLogo(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PanelVertical extends ConsumerWidget {
  final bool isNetConnected;
  const PanelVertical(this.isNetConnected, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return FadeIn(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: textTheme.titleLarge!.copyWith(color: charcoal),
            ),
            LSubtitle(isNetConnected),
            Gap(900.h * 0.03),
            FadeInRight(
              delay: _m1200,
              child: Wrap(
                spacing: 15.w,
                children: [
                  const Icon(Icons.apple, key: ValueKey('apple-login')),
                  Padding(
                    padding: EdgeInsets.all(3.6.r),
                    key: const ValueKey('google-login'),
                    child: Image.asset('images/gLogo.png'),
                  )
                ]
                    .map(
                      (e) => LoginButton(
                        onClick: () => ref
                            .read(loginNotifierProvider)
                            .buttonClick(e.key.toString()),
                        borderColor: e.key.toString().contains('apple')
                            ? gray
                            : pictonBlue,
                        child: e,
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
