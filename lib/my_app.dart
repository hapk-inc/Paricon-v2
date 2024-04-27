import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'logic/auth/notifier.dart';

import 'router/my_route.dart';
import 'theme/my_theme.dart';

final _myRoute = MyRouter();

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late AuthNotifier authNotifier;

  @override
  void initState() {
    super.initState();
    authNotifier = ref.read(authNotifierProvider);
  }

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(360, 900),
        builder: (_, __) => MaterialApp.router(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: ref.watch(themeProvider).themeData,
          //routeInformationParser: _myRoute.defaultRouteParser(),
          //routerDelegate: _myRoute.delegate(),
          routerDelegate: AutoRouterDelegate.declarative(
            _myRoute,
            routes: (_) => [ref.watch(authNotifierProvider).pageRouteInfo],
          ),
        ),
        useInheritedMediaQuery: true,
      );
}
