import 'package:auto_route/auto_route.dart';

import '../my_widgets/app_stack.dart';
import '../ui/dashboard_page.dart';
//import '../ui/game_page.dart';
import '../ui/splash_page.dart';
import '../ui/login_page.dart';
//import '../ui/room_page.dart';
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
        AutoRoute(page: SplashRoute.page),
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

//flutter packages pub run build_runner build

//for freezed
//flutter pub run build_runner build --delete-conflicting-outputs

//flutter pub run flutter_native_splash:create
