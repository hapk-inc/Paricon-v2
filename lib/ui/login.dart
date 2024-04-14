import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:logger/logger.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/login/notifier.dart';
import '../my_widget/pi_logo.dart';
import '../theme/sliding_panel.dart';
import '../values/colors.dart';
import 'login/l_subtitle.dart';
import 'login/login_button.dart';

final PanelController _panelController = PanelController();
const Duration _m900 = Duration(milliseconds: 900);
const Duration _m1200 = Duration(milliseconds: 1200);

Logger _logger = Logger(
  filter: null, // Use the default LogFilter (-> only log in debug mode)
  printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
  output: null,
);

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late bool isLoading;
  late bool isNetConnected;
  late SlidingPanelTheme panelTheme;

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
    panelTheme = ref.watch(slidingPanelProvider);
    ref.listen(
      loginProvider.select((value) => value.isLoading),
      (_, next) {
        if (mounted) {
          if (next) {
            _panelController.close();
          } else {
            openPanelAfterDelay();
          }
        }
      },
    );

    return Scaffold(
      backgroundColor: majorelleBlue,
      body: SafeArea(
        bottom: false,
        child: SlidingUpPanel(
          controller: _panelController,
          borderRadius: panelTheme.panelRadius,
          color: panelTheme.slidingPanelColor,
          maxHeight: 240.h,
          defaultPanelState: PanelState.CLOSED,
          padding: panelTheme.padding,
          isDraggable: false,
          minHeight: 0,
          panel: FadeIn(child: PanelVertical(isNetConnected)),
          body: Stack(
            children: [
              Center(
                heightFactor: 4.5,
                child: Padding(
                  padding: panelTheme.padding,
                  child: FadeIn(child: const MyLogo()),
                ),
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
  Widget build(BuildContext context, WidgetRef ref) => FadeIn(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Login", style: Theme.of(context).textTheme.titleLarge),
            LSubtitle(isNetConnected),
            Gap(30.r),
            FadeInRight(
              delay: _m1200,
              child: Wrap(
                spacing: 24.w,
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
                            .read(loginProvider)
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
      );
}
