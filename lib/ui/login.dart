import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../my_widget/login_option_Button.dart';
import '../../my_widget/my_logo.dart';
import '../../theme/my_color.dart';
import '../logic/auth.dart';

final PanelController _panelController = PanelController();

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Welcome to Login");
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        color: ghostWhite,
        maxHeight: 210.h,
        defaultPanelState: PanelState.CLOSED,
        isDraggable: false,
        panel: Container(
          height: 210.h,
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30.r,
                  fontWeight: FontWeight.w700,
                  color: hookerGreen,
                ),
              ),
              SizedBox(height: 9.r),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "New to Paricon?"),
                    TextSpan(
                      text: " Create a account",
                      style:
                          TextStyle(color: darkPastelGreen, fontSize: 13.5.r),
                    ),
                  ],
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12.r,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 24.r),
              Expanded(
                child: Consumer(
                  builder: (_, ref, __) {
                    void googleButtonClick() => ref
                            .read(gSignProvider.future)
                            .then((value) {})
                            .catchError(
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
                ),
              )
            ],
          ),
        ),
        minHeight: 0.h,
        body: const Center(child: MyLogo()),
      ),
    );
  }
}
