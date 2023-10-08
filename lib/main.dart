import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
import 'logic/user_datastore.dart';
import 'router/my_route.dart';

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

  final FirebaseRemoteConfig remoteConfig =
      FirebaseRemoteConfig.instanceFor(app: app);
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(seconds: 10),
    ),
  );
  if (kIsWeb) remoteConfig.fetchAndActivate();

  runApp(
    ProviderScope(
      overrides: [
        firebaseAppProvider.overrideWithValue(app),
        firebaseAuthProvider.overrideWithValue(firebaseAuth),
        analyticsProvider.overrideWithValue(firebaseAnalytics),
        fireStoreProvider.overrideWithValue(fireStore),
        databaseProvider.overrideWithValue(database),
        remoteConfigProvider.overrideWithValue(remoteConfig),
      ],
      child: const MyApp(),
    ),
  );
}

final _myRoute = MyRouter();

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final netConnection = ref.watch(internetConnectionProvider);
    final PageRouteInfo whichPage = ref.watch(authUserProvider).when(
          data: (aUser) {
            if (aUser == null) return const LoginRoute();

            debugPrint(aUser.toString());

            final myUserAsync = ref.watch(myUserProvider);

            return myUserAsync.when(
              data: (_) {
                ref.read(updateDurationProvider);
                // ref.read(updateBotProvider);
                return const DashboardRoute();
              },
              error: (error, stackTrace) {
                debugPrint(error.toString());
                return const ErrorRoute();
              },
              loading: () => const SplashRoute(),
            );
          },
          error: (error, stackTrace) {
            return const ErrorRoute();
          },
          loading: () => const SplashRoute(),
        );

    ref.listen(
      internetConnectionProvider.select((value) => value.value),
      (previous, next) {
        final remoteConfig = ref.read(remoteConfigProvider);
        if (next != ConnectivityResult.none) {
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

        final ScreenSize sSize = x > 2
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

        return ProviderScope(
          overrides: [
            sizeProvider.overrideWithValue(sSize),
          ],
          child: MaterialApp.router(
            routeInformationParser: _myRoute.defaultRouteParser(),
            routerDelegate: AutoRouterDelegate.declarative(
              _myRoute,
              routes: (handler) {
                if (kIsWeb) {
                  final showApp = ref.watch(showAppProvider);
                  debugPrint("showAppProvider $showApp");

                  return !showApp && !kDebugMode
                      ? [const MaintenanceRoute()]
                      : [
                          kDebugMode
                              ? whichPage
                              : ref.watch(inAppUpdateProvider).maybeWhen(
                                    data: (data) => data.updateAvailability ==
                                            UpdateAvailability.updateAvailable
                                        ? const AppUpdateRoute()
                                        : whichPage,
                                    orElse: () => whichPage,
                                  )
                        ];
                }
                return netConnection.when(
                  loading: () => [const SplashRoute()],
                  error: (e, s) {
                    debugPrint(e.toString());
                    return [const ErrorRoute()];
                  },
                  data: (net) {
                    debugPrint("NetConnection $net");

                    final bool noNet = net == ConnectivityResult.none;

                    if (noNet) return [const ErrorRoute()];

                    final showApp = ref.watch(showAppProvider);
                    debugPrint("showAppProvider $showApp");

                    return showApp && !kDebugMode
                        ? [const MaintenanceRoute()]
                        : [
                            kDebugMode
                                ? whichPage
                                : ref.watch(inAppUpdateProvider).maybeWhen(
                                      data: (data) => data.updateAvailability ==
                                              UpdateAvailability.updateAvailable
                                          ? const AppUpdateRoute()
                                          : whichPage,
                                      orElse: () => whichPage,
                                    )
                          ];
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
