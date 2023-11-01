import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'firebase_option.dart';
import 'logic/auth.dart';
import 'logic/firebase_init.dart';
import 'logic/remote_values.dart';
import 'logic/s_size.dart';
import 'logic/user_provider.dart';
import 'router/my_route.dart';
import 'theme/my_theme.dart';

Future<void> main() async {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final PackageInfo info = await PackageInfo.fromPlatform();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  final FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(info.appName),
  );

  final FirebaseAuth firebaseAuth = FirebaseAuth.instanceFor(app: app);
  final FirebaseFirestore fireStore = FirebaseFirestore.instanceFor(app: app);
  final FirebaseDatabase database = FirebaseDatabase.instanceFor(app: app);

  final FirebaseAnalytics firebaseAnalytics =
      FirebaseAnalytics.instanceFor(app: app);

  final FirebaseCrashlytics firebaseCrashlytics = FirebaseCrashlytics.instance;

  final FirebaseRemoteConfig remoteConfig =
      FirebaseRemoteConfig.instanceFor(app: app);
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(seconds: 10),
    ),
  );

  final Connectivity connectivity = Connectivity();
  final iNet = await connectivity.checkConnectivity();

  if (iNet != ConnectivityResult.none) {
    debugPrint("Initialising Remote Config for connectivity $iNet");
    await remoteConfig.fetchAndActivate();
  }

  if (!kIsWeb) {
    await firebaseCrashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);
  }

  //const fatalError = true;
  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    firebaseCrashlytics.recordFlutterFatalError(errorDetails);
  };

  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    firebaseCrashlytics.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (_) => ProviderScope(
        overrides: [
          firebaseAppProvider.overrideWithValue(app),
          firebaseAuthProvider.overrideWithValue(firebaseAuth),
          analyticsProvider.overrideWithValue(firebaseAnalytics),
          fireStoreProvider.overrideWithValue(fireStore),
          databaseProvider.overrideWithValue(database),
          remoteConfigProvider.overrideWithValue(remoteConfig),
          internetConnectionProvider
              .overrideWith((ref) => connectivity.onConnectivityChanged),
          checkNetProvider
              .overrideWith((ref) => connectivity.checkConnectivity()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

final _myRoute = MyRouter();

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkNet = ref.watch(checkNetProvider);

    final showApp = ref.read(showAppProvider);

    final PageRouteInfo whichPage = showApp
        ? const MaintenanceRoute()
        : ref.watch(authUserProvider).when(
              data: (aUser) {
                if (aUser == null) return const LoginRoute();

                debugPrint("AuthUser True");
                debugPrint(aUser.toString());
                ref.read(updateDurationProvider.future);
                final myUser = ref.watch(pUserMeProvider);
                return myUser.when(
                  data: (d) {
                    debugPrint("Getting MyUser Details $d");
                    return const DashboardRoute();
                  },
                  error: (error, stackTrace) {
                    debugPrint(error.toString());
                    return const ErrorRoute();
                  },
                  loading: () {
                    debugPrint("Loading --134");
                    return const SplashRoute();
                  },
                );
              },
              error: (error, stackTrace) => const ErrorRoute(),
              loading: () {
                ref.refresh(pUserMeProvider);
                return const SplashRoute();
              },
            );

    ref.listen(
      internetConnectionProvider.select((value) => value.value),
      (previous, next) {
        final remoteConfig = ref.read(remoteConfigProvider);

        if (previous == null &&
            next != ConnectivityResult.none &&
            next != null) {
          debugPrint("Initialising Remote Config");
          remoteConfig.fetchAndActivate();
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
            routeInformationParser: _myRoute.defaultRouteParser(),
            //useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: buildThemeData,
            routerDelegate: AutoRouterDelegate.declarative(
              _myRoute,
              routes: (handler) => checkNet.when(
                data: (x) {
                  debugPrint("checkNet Data $x");
                  if (x == ConnectivityResult.none) {
                    return [const NoNetRoute()];
                  } else {
                    if (kDebugMode) {
                      return [whichPage];
                    } else {
                      return ref.watch(inAppUpdateProvider).when(
                            data: (data) => data.updateAvailability ==
                                    UpdateAvailability.updateAvailable
                                ? [const AppUpdateRoute()]
                                : [whichPage],
                            loading: () => [const SplashRoute()],
                            error: (e, s) {
                              debugPrint(e.toString());
                              return [const ErrorRoute()];
                            },
                          );
                    }
                  }
                },
                error: (e, s) {
                  debugPrint(e.toString());
                  return [const ErrorRoute()];
                },
                loading: () => [const SplashRoute()],
              ),
            ),
          ),
        );
      },
    );
  }
}

ScreenSize _changeScreenSize(double x) {
  return x > 2
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
}
