import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paricon/my_widget/my_logo.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../my_widget/login_option_Button.dart';
import '../../theme/my_color.dart';
import '../logic/auth.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late PanelController _panelController;

  @override
  void initState() {
    _panelController = PanelController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2100), () {
      setState(() {
        _panelController.open();
      });
    });
    return Scaffold(
      backgroundColor: majorelleBlue,
      body: SlidingUpPanel(
        controller: _panelController,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        color: ghostWhite,
        panel: Container(
          height: 165.h,
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24.r,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 9.r),
              Text(
                "New to Paricon. Create a account",
                style: TextStyle(
                    fontFamily: 'Poppins', fontSize: 12.r, color: Colors.grey),
              ),
              SizedBox(height: 24.r),
              Expanded(
                child: Consumer(
                  builder: (_, ref, __) => Wrap(
                    spacing: 15.r,
                    children: [
                      LoginOptionButton(
                        lChild: Image.asset('images/gLogo.png'),
                        optionBtnPressed: () =>
                            ref.read(gSignProvider.future).catchError(
                          (e, s) {
                            debugPrintStack(stackTrace: s);
                            if (kDebugMode) {
                              ref.read(anonymousProvider);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        minHeight: 0,
        maxHeight: 180.h,
        body: Center(child: MyLogo()),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          fontFamily: 'Cabin',
          letterSpacing: 1.r,
          fontSize: 15.r,
          fontWeight: FontWeight.w700),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 15.h),
        labelText: 'Mobile Number',

        labelStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15.r,
            fontWeight: FontWeight.normal,
            letterSpacing: 0),
        // hintText: 'Type something here',
        //prefixIcon: Icon(Icons.text_fields),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.r),
          borderSide: BorderSide(
            color: Colors.blue,
            width: .6.r,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.r),
          borderSide: BorderSide(
            color: Colors.blue,
            width: .9.r,
          ),
        ),
      ),
    );
  }
}
