import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'firebase_option.dart';
import 'logic/auth.dart';
import 'logic/bot_datastore.dart';
import 'logic/firebase_init.dart';
import 'logic/s_size.dart';
import 'logic/user_datastore.dart';
import 'routes/my_route.dart';
import 'theme/app_theme.dart';

//void main() => runApp(const M1());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final PackageInfo info = await PackageInfo.fromPlatform();

  final FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform(info.appName));

  final FirebaseAuth firebaseAuth = FirebaseAuth.instanceFor(app: app);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  //final FirebaseAnalytics analytics = FirebaseAnalytics.instanceFor(app: app);
  final FirebaseFirestore fireStore = FirebaseFirestore.instanceFor(app: app);
  final FirebaseDatabase database = FirebaseDatabase.instanceFor(app: app);

  runApp(
    ProviderScope(
      overrides: [
        firebaseAppProvider.overrideWithValue(app),
        firebaseAuthProvider.overrideWithValue(firebaseAuth),
        //analyticsProvider.overrideWithValue(analytics),
        fireStoreProvider.overrideWithValue(fireStore),
        databaseProvider.overrideWithValue(database),
      ],
      child: const MyApp(),
    ),
  );
}

final _myRoute = MyRouter();

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageRouteInfo whichPage = ref.watch(authUserProvider).when(
          data: (aUser) {
            if (aUser == null) return const LoginRoute();

            debugPrint(aUser.toString());

            final myUserAsync = ref.watch(myUserProvider);

            return myUserAsync.when(
              data: (_) {
                ref.read(updateDurationProvider);
                ref.read(updateBotProvider);

                return const DashboardRoute();
              },
              error: (error, stackTrace) {
                if (kDebugMode) {
                  print("76 - $error");
                }
                ref.read(signOutProvider);
                return const ErrorRoute();
              },
              loading: () => const SplashRoute(),
            );
          },
          error: (error, stackTrace) {
            if (kDebugMode) {
              print("86- $error");
              print("87- $stackTrace");
            }

            return const ErrorRoute();
          },
          loading: () => const SplashRoute(),
        );

    return ScreenUtilInit(
      designSize: const Size(360, 900),
      useInheritedMediaQuery: true,
      builder: (_, __) {
        final double x = 900.h / 360.w;
        if (kDebugMode) {
          print("ScreenRatio $x");
        }
        return ProviderScope(
          overrides: [
            sizeProvider.overrideWithValue(x > 1.5
                ? ScreenSize.phone
                : x > 1
                    ? ScreenSize.tab
                    : x > 0.6
                        ? ScreenSize.pc
                        : x > 0.4
                            ? ScreenSize.tv
                            : ScreenSize.tooSmall)
          ],
          child: MaterialApp.router(
            routeInformationParser: _myRoute.defaultRouteParser(),
            theme: appTheme,
            routerDelegate: AutoRouterDelegate.declarative(
              _myRoute,
              routes: (handler) => [
                whichPage
                /* kDebugMode
                    ? whichPage
                    : ref.watch(inAppUpdateProvider).maybeWhen(
                          data: (data) => data.updateAvailability ==
                                  UpdateAvailability.updateAvailable
                              ? const AppUpdateRoute()
                              : whichPage,
                          orElse: () => whichPage,
                        )*/
              ],
            ),
          ),
        );
      },
    );
  }
}
