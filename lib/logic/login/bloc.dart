import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/bloc.dart';

final AutoDisposeFutureProvider<UserCredential?> anonymousProvider =
    FutureProvider.autoDispose<UserCredential?>(
  (ref) async {
    final auth = ref.read(authProvider);
    return auth.anonymousUser;
  },
);

final AutoDisposeFutureProvider<UserCredential?> gSignProvider =
    FutureProvider.autoDispose<UserCredential?>(
  (ref) async {
    final auth = ref.read(authProvider);
    return auth.googleSignIn;
  },
);

final AutoDisposeFutureProvider appleClickProvider = FutureProvider.autoDispose(
  (ref) async {
    final auth = ref.read(authProvider);
    return auth.appleLogin;
  },
);
