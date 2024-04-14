import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/device_provider.dart';
import 'bloc.dart';

final ChangeNotifierProvider<LoginNotifier> loginProvider =
    ChangeNotifierProvider<LoginNotifier>(
  (ref) => LoginNotifier(ref),
);

class LoginNotifier extends ChangeNotifier {
  final Ref ref;
  bool _isLoading = false;

  LoginNotifier(this.ref);

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    if (value == _isLoading) return;
    _isLoading = value;
    notifyListeners();
  }

  Future get guestLogin => ref.read(anonymousProvider.future).whenComplete(
        () => isLoading = false,
      );

  Future get appleLogin => ref.read(appleClickProvider.future).whenComplete(
        () => isLoading = false,
      );

  Future get googleLogin => ref.read(gSignProvider.future).whenComplete(
        () => isLoading = false,
      );

  buttonClick(String s) {
    if (!_isLoading) {
      isLoading = true;
      switch (s) {
        case "[<'apple-login'>]":
          kDebugMode ? guestLogin : appleLogin;
          break;
        case "[<'google-login'>]":
          {
            final bool isGuest = kIsWeb
                ? true
                : Platform.isMacOS || ref.read(isEmulatorProvider);
            isGuest ? guestLogin : googleLogin;
          }
          break;
      }
    }
  }
}
