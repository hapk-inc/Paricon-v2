import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

import 'enums/enums.dart';
import 'logic/app/size_provider.dart';
import 'logic/auth/notifier.dart';

import 'router/my_route.dart';
import 'ui/my_theme.dart';

final _myRoute = MyRouter();

Logger _logger = Logger();

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
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 900),
      //rebuildFactor: RebuildFactors.none,
      //ensureScreenSize: true,
      builder: (_, __) {
        final double x = 900.h / 360.w;
        _logger.i("ScreenRatio $x");
        ScreenSize screenSize = _changeScreenSize(x);
        return ProviderScope(
          overrides: [
            sizeProvider.overrideWith((_) => SizeNotifier(screenSize))
          ],
          child: MaterialApp.router(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: MyTheme(screenSize).themeData,
            routerDelegate: AutoRouterDelegate.declarative(
              _myRoute,
              routes: (handler) =>
                  [ref.watch(authNotifierProvider).pageRouteInfo],
            ),
          ),
        );
      },
      useInheritedMediaQuery: true,
    );
  }
}

ScreenSize _changeScreenSize(double x) => x > 2
    ? ScreenSize.mobile
    : x > 1.65
        ? ScreenSize.tab
        : x > 1.2
            ? ScreenSize.iPad
            : x > 0.7
                ? ScreenSize.pc
                : x > 0.5
                    ? ScreenSize.tv
                    : ScreenSize.tooSmall;

// For pad and above, use device-preview
