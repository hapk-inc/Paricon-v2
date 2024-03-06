import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth.dart';
import 'user_activity_database.dart';

final Provider<Auth> authProvider = Provider<Auth>((ref) => Auth(ref));

final firebaseUserProvider = Provider<User?>(
  (ref) {
    final Auth auth = ref.watch(authProvider);
    return auth.currentUser;
  },
);

final authUserProvider = StreamProvider<User?>(
  (ref) {
    final auth = ref.read(authProvider);
    return auth.authUser;
  },
);

final AutoDisposeFutureProvider signOutProvider =
    FutureProvider.autoDispose<void>(
  (ref) {
    final auth = ref.read(authProvider);
    return auth.signOut;
  },
);

final AutoDisposeFutureProvider deleteAccountProvider =
    FutureProvider.autoDispose<void>(
  (ref) {
    final auth = ref.read(authProvider);
    return auth.deleteAccount;
  },
);

final AutoDisposeFutureProviderFamily updateNameProvider =
    FutureProvider.autoDispose.family<void, String>(
  (ref, name) async {
    final auth = ref.read(authProvider);
    await auth.updateName(name);

    final userDatabase = ref.read(userDatabaseProvider);
    return userDatabase.updateName(name);
  },
);

final AutoDisposeFutureProvider anonymousProvider =
    FutureProvider.autoDispose<void>(
  (ref) async {
    final auth = ref.read(authProvider);
    return auth.signInAnonymous;
  },
);

final AutoDisposeFutureProvider<String?> gSignProvider =
    FutureProvider.autoDispose<String?>(
  (ref) async {
    final auth = ref.read(authProvider);
    return auth.signInWithGoogle;
  },
);

final AutoDisposeFutureProvider appleClickProvider = FutureProvider.autoDispose(
  (ref) async {
    final auth = ref.read(authProvider);
    try {
      return auth.appleClick;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  },
);
