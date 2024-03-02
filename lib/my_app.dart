import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:paricon/ui/no_net.dart';

import 'logic/auth_provider.dart';
import 'logic/firebase_init.dart';
import 'logic/remote_values.dart';
import 'logic/s_size.dart';
import 'logic/user_activity_provider.dart';
import 'logic/user_provider.dart';
import 'router/my_route.dart';
import 'theme/my_color.dart';
import 'theme/my_theme.dart';

final _myRoute = MyRouter();

final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late PageRouteInfo userRouteInfo;
  late PageRouteInfo whichPageRouteInfo;
  late PageRouteInfo appUpdateRouteInfo;
  bool isConnected = true;

  @override
  Widget build(BuildContext context) {
    ref.listen(
      internetConnectionProvider.select((value) => value.value),
      (previous, next) {
        if (next == ConnectivityResult.wifi ||
            next == ConnectivityResult.mobile) {
          ref.read(remoteConfigProvider).fetchAndActivate();
          setState(() => isConnected = true);
        } else {
          setState(() => isConnected = false);
        }
      },
    );

    final bool showApp = ref.watch(showAppProvider);
    userRouteInfo = ref.watch(myUserProvider).maybeWhen(
          orElse: () => SplashRoute(otherColor: pictonBlue),
          loading: () {
            if (_scaffoldMessengerKey.currentState != null) {
              _scaffoldMessengerKey.currentState!.removeCurrentSnackBar();
            }
            return SplashRoute(otherColor: pictonBlue);
          },
          data: (user) {
            if (user != null) {
              debugPrint("Welcome ${user.name}");
              ref.read(appOpenedProvider);
              return const DashboardRoute();
            } else {
              ref.read(signOutProvider);
              return const LoginRoute();
            }
          },
        );
    whichPageRouteInfo = showApp
        ? const MaintenanceRoute()
        : ref.watch(authUserProvider).when(
              loading: () => SplashRoute(otherColor: cornellRed),
              error: (_, __) => const ErrorRoute(),
              data: (user) {
                debugPrint("AuthUserProvider ${(user?.uid) ?? "No id"}");
                return user == null ? const LoginRoute() : userRouteInfo;
              },
            );
    appUpdateRouteInfo = ref.watch(inAppUpdateProvider).maybeWhen(
          orElse: () => SplashRoute(otherColor: cornellRed),
          data: (update) =>
              update.updateAvailability == UpdateAvailability.updateAvailable
                  ? const AppUpdateRoute()
                  : whichPageRouteInfo,
        );

    final bool isEmulator = ref.watch(isEmulatorProvider);

    return ScreenUtilInit(
      designSize: const Size(360, 900),
      useInheritedMediaQuery: true,
      builder: (__, _) {
        final double x = 900.h / 360.w;
        debugPrint("ScreenRatio $x");
        final ScreenSize sSize = _changeScreenSize(x);
        return ProviderScope(
          overrides: [
            sizeProvider.overrideWithValue(sSize),
          ],
          child: MaterialApp.router(
            color: cornellRed,
            scaffoldMessengerKey: _scaffoldMessengerKey,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: buildThemeData(sSize),
            routerDelegate: AutoRouterDelegate.declarative(
              _myRoute,
              routes: (handler) => !isConnected
                  ? [const NoNetRoute()]
                  : [
                      if (kIsWeb)
                        const SupportRoute()
                      else if (Platform.isMacOS || Platform.isIOS || isEmulator)
                        whichPageRouteInfo
                      else
                        appUpdateRouteInfo
                    ],
            ),
          ),
        );
      },
    );
  }
}

ScreenSize _changeScreenSize(double x) => x > 2
    ? ScreenSize.phone
    : x > 1.5
        ? ScreenSize.tab
        : x > 1.2
            ? ScreenSize.iPad
            : x > 0.6
                ? ScreenSize.pc
                : x > 0.4
                    ? ScreenSize.tv
                    : ScreenSize.tooSmall;
