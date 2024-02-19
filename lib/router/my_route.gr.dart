// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'my_route.dart';

abstract class _$MyRouter extends RootStackRouter {
  // ignore: unused_element
  _$MyRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppStackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppStackPage(),
      );
    },
    AppUpdateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppUpdatePage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    ErrorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ErrorPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    MaintenanceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MaintenancePage(),
      );
    },
    NoNetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NoNetPage(),
      );
    },
    PassAvatarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PassAvatarPage(),
      );
    },
    PlayFriendRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlayFriendPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashPage(
          otherColor: args.otherColor,
          key: args.key,
        ),
      );
    },
    TournamentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TournamentPage(),
      );
    },
    ViewLeaderBoardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ViewLeaderBoardPage(),
      );
    },
    ViewTournamentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ViewTournamentPage(),
      );
    },
  };
}

/// generated route for
/// [AppStackPage]
class AppStackRoute extends PageRouteInfo<void> {
  const AppStackRoute({List<PageRouteInfo>? children})
      : super(
          AppStackRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppStackRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppUpdatePage]
class AppUpdateRoute extends PageRouteInfo<void> {
  const AppUpdateRoute({List<PageRouteInfo>? children})
      : super(
          AppUpdateRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppUpdateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ErrorPage]
class ErrorRoute extends PageRouteInfo<void> {
  const ErrorRoute({List<PageRouteInfo>? children})
      : super(
          ErrorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MaintenancePage]
class MaintenanceRoute extends PageRouteInfo<void> {
  const MaintenanceRoute({List<PageRouteInfo>? children})
      : super(
          MaintenanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'MaintenanceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoNetPage]
class NoNetRoute extends PageRouteInfo<void> {
  const NoNetRoute({List<PageRouteInfo>? children})
      : super(
          NoNetRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoNetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PassAvatarPage]
class PassAvatarRoute extends PageRouteInfo<void> {
  const PassAvatarRoute({List<PageRouteInfo>? children})
      : super(
          PassAvatarRoute.name,
          initialChildren: children,
        );

  static const String name = 'PassAvatarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlayFriendPage]
class PlayFriendRoute extends PageRouteInfo<void> {
  const PlayFriendRoute({List<PageRouteInfo>? children})
      : super(
          PlayFriendRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlayFriendRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    Color? otherColor,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(
            otherColor: otherColor,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<SplashRouteArgs> page = PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({
    this.otherColor,
    this.key,
  });

  final Color? otherColor;

  final Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{otherColor: $otherColor, key: $key}';
  }
}

/// generated route for
/// [TournamentPage]
class TournamentRoute extends PageRouteInfo<void> {
  const TournamentRoute({List<PageRouteInfo>? children})
      : super(
          TournamentRoute.name,
          initialChildren: children,
        );

  static const String name = 'TournamentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ViewLeaderBoardPage]
class ViewLeaderBoardRoute extends PageRouteInfo<void> {
  const ViewLeaderBoardRoute({List<PageRouteInfo>? children})
      : super(
          ViewLeaderBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewLeaderBoardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ViewTournamentPage]
class ViewTournamentRoute extends PageRouteInfo<void> {
  const ViewTournamentRoute({List<PageRouteInfo>? children})
      : super(
          ViewTournamentRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewTournamentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
