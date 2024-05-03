import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../enums/enums.dart';
import '../../firebase/bloc.dart';
import '../../router/my_route.dart';

import '../app/net_notifier.dart';
import '../app/remote_bloc.dart';

import 'bloc.dart';

final ChangeNotifierProvider<AuthNotifier> authNotifierProvider =
    ChangeNotifierProvider<AuthNotifier>(
  (ref) => AuthNotifier(ref),
);

Logger _logger = Logger();

class AuthNotifier extends ChangeNotifier {
  final Ref ref;

  late PageRouteInfo _pageRouteInfo;

  late AuthValidate _authValidate;

  bool _inMaintenance = false;

  User? _fUser;

  bool _isConnected = true;

  //bool _updateAvailable = false;

  AuthNotifier(this.ref) {
    _inMaintenance = ref.read(showAppProvider);

    _pageRouteInfo = SplashRoute();
    _authValidate = AuthValidate.notLogged;
  }

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    _logger.i("AuthNotifier Override addListener");

    ref.listen<ConnectivityResult>(
      internetConnectionProvider.select(
        (x) => x.value?.last ?? ConnectivityResult.none,
      ),
      (previous, next) async {
        final bool validConnection = next == ConnectivityResult.wifi ||
            next == ConnectivityResult.mobile;
        _logger.i("validConnection $validConnection");
        if (validConnection) {
          int remoteConnected = await ref
              .watch(remoteConfigProvider)
              .fetchAndActivate()
              .then((value) => value ? 1 : 0)
              .onError(
            (e, __) {
              _logger.i("RemoteConnection $e");
              return -1;
            },
          );
          _logger.i("RemoteConnected $remoteConnected");
          ref.read(netConnectedNotifierProvider.notifier).state =
              remoteConnected;
        } else {
          ref.read(netConnectedNotifierProvider.notifier).state = -1;
        }
      },
    );

    ref.listen(
      netConnectedNotifierProvider.select((value) => value),
      (previous, next) {
        _logger.i("netConnectedNotifierProvider $next");
        //isConnected = !next.isNegative;
      },
    );
    if (!_inMaintenance) {
      ref.listen<User?>(
        authUserProvider.select((value) => value.value),
        (_, next) {
          _logger.i("AuthNotifier Listener Running");
          fUser = next;
          authValidate =
              next != null ? AuthValidate.loggedIn : AuthValidate.notLogged;
          pageRouteInfo = SplashRoute();
        },
      );
    }
  }

  PageRouteInfo get pageRouteInfo => _pageRouteInfo;

  AuthValidate get authValidate => _authValidate;

  set pageRouteInfo(PageRouteInfo value) {
    if (_pageRouteInfo == value) return;
    _pageRouteInfo = value;
    notifyListeners();
  }

  set authValidate(AuthValidate value) {
    if (_authValidate == value) return;
    _authValidate = value;
    notifyListeners();
  }

  validateAuth() {
    pageRouteInfo = _inMaintenance
        ? const MaintenanceRoute()
        : _authValidate == AuthValidate.notLogged
            ? const LoginRoute()
            : const DashboardRoute();
  }

  User? get fUser => _fUser;

  set fUser(User? value) {
    if (_fUser == value) return;
    _fUser = value;
    notifyListeners();
  }

  bool get isConnected => _isConnected;

  set isConnected(bool value) {
    if (_isConnected == value) return;
    _isConnected = value;
    notifyListeners();
  }
}
