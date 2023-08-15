import 'package:auto_route/auto_route.dart';

import '../my_widgets/app_stack.dart';
import '../ui/dashboard_page.dart';

import '../ui/splash_page.dart';
import '../ui/app_update_page.dart';
import '../ui/login_page.dart';
import '../ui/error_page.dart';

import '../ui/tournament_page.dart';
part 'my_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class MyRouter extends _$MyRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: LoginRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        /*CustomRoute(
          page: LoginRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),*/
        AutoRoute(page: SplashRoute.page),
        AutoRoute(page: ErrorRoute.page),
        AutoRoute(page: AppUpdateRoute.page),
        AutoRoute(
          page: AppStackRoute.page,
          children: [
            AutoRoute(page: DashboardRoute.page),
            //AutoRoute(page: RoomRoute.page),
            /*CustomRoute(
              page: RoomRoute.page,
              transitionsBuilder: TransitionsBuilders.slideTop,
            ),*/
            //AutoRoute(page: GameRoute.page),
            /*CustomRoute(
              page: GameRoute.page,
              transitionsBuilder: TransitionsBuilders.slideBottom,
            ),*/
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

//118238046593-nlgc5ogpujcarqq5m1n0a4m3bhl3ad0m.apps.googleusercontent.com

//118238046593-kvp54d513sjkd1lai0o51rs9kdakci50.apps.googleusercontent.com
