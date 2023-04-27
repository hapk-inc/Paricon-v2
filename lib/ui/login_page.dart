import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/s_size.dart';
import 'login/login_p.dart';
//import 'login/login_p.dart';
//import 'login/login_w.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.watch(sizeProvider);
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      resizeToAvoidBottomInset: false,
      body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: sSize == ScreenSize.phone || sSize == ScreenSize.tab
              ? const LoginP()
              : Text("Login PC")
          /*? const LoginP()
            : const LoginW(),*/
          ),
    );
  }
}
