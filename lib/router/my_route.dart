import 'package:auto_route/auto_route.dart';

import '../my_widget/app_stack.dart';
import '../ui/app_error.dart';
import '../ui/app_update.dart';
import '../ui/dashboard.dart';
import '../ui/login.dart';
import '../ui/maintenance.dart';
import '../ui/no_net.dart';
import '../ui/splash.dart';
import '../ui/tournament.dart';

part 'my_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class MyRouter extends _$MyRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: LoginRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        AutoRoute(page: SplashRoute.page),
        AutoRoute(page: MaintenanceRoute.page),
        AutoRoute(page: NoNetRoute.page),
        AutoRoute(page: ErrorRoute.page),
        AutoRoute(page: AppUpdateRoute.page),
        AutoRoute(
          page: AppStackRoute.page,
          children: [
            AutoRoute(page: DashboardRoute.page),
            AutoRoute(page: TournamentRoute.page)
          ],
        )
      ];
}

//flutter packages pub run build_runner build --delete-conflicting-outputs

//for freezed
//flutter pub run build_runner build --delete-conflicting-outputs

//flutter pub run flutter_native_splash:create

//gradle signingreport

//flutter build appbundle --flavor prod --no-tree-shake-icons

//dart run build_runner build

//dart run build_runner build --delete-conflicting-outputs
