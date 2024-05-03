import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth.dart';
//import '../user_logic/user_activity_database.dart';

final Provider<Auth> authProvider = Provider<Auth>((ref) => Auth(ref));

/*final Provider<User?> firebaseUserProvider = Provider<User?>((ref) {
  final Auth auth = ref.watch(authProvider);
  return auth.currentUser;
});*/

final StreamProvider<User?> authUserProvider = StreamProvider<User?>(
  (ref) {
    final Auth auth = ref.read(authProvider);
    return auth.authUser;
  },
);

final AutoDisposeFutureProvider signOutProvider = FutureProvider.autoDispose(
  (ref) {
    final Auth auth = ref.read(authProvider);
    return auth.signOut;
  },
);

final AutoDisposeFutureProvider deleteAccountProvider =
    FutureProvider.autoDispose(
  (ref) {
    final Auth auth = ref.read(authProvider);
    return auth.deleteAccount;
  },
);

final AutoDisposeFutureProviderFamily<void, String> updateNameProvider =
    FutureProvider.autoDispose.family<void, String>(
  (ref, name) async {
    final Auth auth = ref.read(authProvider);
    return auth.updateName(name);
  },
);
