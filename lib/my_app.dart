import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:paricon/logic/user_provider.dart';

import 'logic/auth_provider.dart';
import 'logic/firebase_init.dart';
import 'logic/remote_values.dart';
import 'logic/s_size.dart';
import 'router/my_route.dart';
import 'theme/my_theme.dart';

final _myRoute = MyRouter();

final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showApp = ref.read(showAppProvider);

    PageRouteInfo userRouteInfo = ref.watch(myUserProvider).when(
          loading: () {
            if (_scaffoldMessengerKey.currentState != null) {
              _scaffoldMessengerKey.currentState!.removeCurrentSnackBar();
            }
            return const SplashRoute();
          },
          data: (d) {
            ref.read(appOpenedOrLoggedInProvider);
            if (d != null) {
              debugPrint("Welcome ${d.name}");
            }
            return d == null ? const SplashRoute() : const DashboardRoute();
          },
          error: (e, s) => const ErrorRoute(),
        );

    PageRouteInfo whichPageRoute = showApp
        ? const MaintenanceRoute()
        : ref.watch(authUserProvider).maybeWhen(
              orElse: () => const SplashRoute(),
              data: (user) {
                if (user == null) return const LoginRoute();
                return userRouteInfo;
              },
            );

    PageRouteInfo inAppUpdateRoute = ref.read(inAppUpdateProvider).maybeWhen(
          data: (update) =>
              update.updateAvailability == UpdateAvailability.updateAvailable
                  ? const AppUpdateRoute()
                  : whichPageRoute,
          orElse: () => const SplashRoute(),
        );

    return ScreenUtilInit(
      designSize: const Size(360, 900),
      useInheritedMediaQuery: true,
      builder: (_, __) {
        final double x = 900.h / 360.w;
        debugPrint("ScreenRatio $x");
        final ScreenSize sSize = _changeScreenSize(x);
        return ProviderScope(
          overrides: [
            sizeProvider.overrideWithValue(sSize),
          ],
          child: MaterialApp.router(
            scaffoldMessengerKey: _scaffoldMessengerKey,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: buildThemeData,
            routerDelegate: AutoRouterDelegate.declarative(
              _myRoute,
              routes: (handler) => [
                ref.read(checkNetProvider).maybeWhen(
                      orElse: () => const SplashRoute(),
                      data: (net) => net == ConnectivityResult.none
                          ? const NoNetRoute()
                          : kDebugMode
                              ? whichPageRoute
                              : inAppUpdateRoute,
                    )
              ],
              onNavigate: (urlState) {
                debugPrint("OnNavigate");
              },
              onPopRoute: (routeMatch, x) {
                debugPrint("onPop Route");
              },
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
