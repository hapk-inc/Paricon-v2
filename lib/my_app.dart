import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_update/in_app_update.dart';

import '../logic/user_provider.dart';
import 'logic/auth_provider.dart';
import 'logic/firebase_init.dart';
import 'logic/remote_values.dart';
import 'logic/s_size.dart';
import 'logic/user_activity_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    bool isConnected = false;

    final showApp = ref.watch(showAppProvider);

    PageRouteInfo userRouteInfo = ref.watch(myUserProvider).when(
      loading: () {
        if (_scaffoldMessengerKey.currentState != null) {
          _scaffoldMessengerKey.currentState!.removeCurrentSnackBar();
        }
        return SplashRoute(otherColor: pictonBlue);
      },
      data: (d) {
        ref.read(appOpenedProvider);
        if (d != null) {
          debugPrint("Welcome ${d.name}");
        }
        return d == null
            ? SplashRoute(otherColor: darkPastelGreen) as PageRouteInfo
            : const DashboardRoute();
      },
      error: (e, s) {
        debugPrint("57--$e");
        ref.read(crashlyticsProvider).recordError(
              e,
              s,
              reason: 'a fatal error',
              fatal: true,
            );
        return const ErrorRoute();
      },
    );

    PageRouteInfo whichPageRoute = showApp
        ? const MaintenanceRoute()
        : ref.watch(authUserProvider).when(
              loading: () => SplashRoute(otherColor: jasper),
              error: (e, s) {
                debugPrint("72--$e");
                ref.read(crashlyticsProvider).recordError(
                      e,
                      s,
                      reason: 'auth User error',
                      fatal: true,
                    );
                return const ErrorRoute();
              },
              data: (user) {
                if (user == null) return const LoginRoute();
                return userRouteInfo;
              },
            );

    PageRouteInfo inAppUpdateRoute() => ref.watch(inAppUpdateProvider).when(
          data: (update) =>
              update.updateAvailability == UpdateAvailability.updateAvailable
                  ? const AppUpdateRoute()
                  : whichPageRoute,
          loading: () => SplashRoute(otherColor: xantHous),
          error: (e, s) {
            debugPrint("82--");
            debugPrint(e.toString());
            ref.read(crashlyticsProvider).recordError(
                  e,
                  s,
                  reason: 'inAppUpdate error',
                  fatal: true,
                );

            if (e is PlatformException) {
              if (e.code.contains("10")) {
                return whichPageRoute;
              }
            }
            return const ErrorRoute();
          },
        );

    ref.listen(
      internetConnectionProvider.select((value) => value.value),
      (previous, next) {
        debugPrint("97--$next");
        if (next != ConnectivityResult.none) {
          if (isConnected == false) {
            setState(() => isConnected = true);
          }
        }
      },
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
                kIsWeb
                    ? whichPageRoute
                    : ref.watch(isPhysicalDeviceProvider).when(
                          data: (isPhysicalDevice) {
                            if (kDebugMode) return whichPageRoute;
                            return !isPhysicalDevice
                                ? whichPageRoute
                                : inAppUpdateRoute();
                          },
                          error: (e, __) => const ErrorRoute(),
                          loading: () => SplashRoute(),
                        )
              ],
              /*onNavigate: (urlState) {
                debugPrint("OnNavigate");
              },*/
              /*onPopRoute: (routeMatch, x) {
                debugPrint("onPop Route");
                debugPrint(x);
                debugPrint(routeMatch.redirectedFrom);
                context.router.replace(const DashboardRoute());
              },*/
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
