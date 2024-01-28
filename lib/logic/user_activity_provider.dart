import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/my_user.dart';
import '../model/user_activity.dart';
import 'auth_provider.dart';
import 'firebase_init.dart';
import 'remote_values.dart';
import 'user_provider.dart';

final AutoDisposeFutureProvider<TransactionResult> appOpenedProvider =
    FutureProvider.autoDispose<TransactionResult>(
  (ref) async {
    final User user = ref.read(authUserProvider).value!;
    final FirebaseDatabase dt = ref.read(databaseProvider);
    final String? appVersion = await ref
        .read(packageInfoProvider.future)
        .then((value) => value.version);
    final MyUser myUser = ref.read(myUserProvider).value!;
    final DateTime now = DateTime.now();
    final DatabaseReference userRef = dt.ref('users/${user.uid}');
    return userRef.runTransaction(
      (Object? user) {
        late UserActivity userActivity;
        if (user == null) {
          userActivity = UserActivity(
            nowTime: now,
            name: myUser.name,
            appVersion: appVersion,
          );
        } else {
          Map<String, dynamic> json = Map<String, dynamic>.from(user as Map);
          final UserActivity old = UserActivity.fromJson(json);

          bool nextDayOpen = now.day != old.nowTime.day;
          Duration timeGap = now.difference(old.nowTime);
          bool timeGapInMinute = timeGap > const Duration(minutes: 1);
          if (timeGapInMinute || nextDayOpen) {
            debugPrint("Existing LastOpened");
            userActivity = UserActivity(
              nowTime: now,
              lastOpened: old.nowTime,
              appVersion: appVersion,
              name: myUser.name,
              avatar: myUser.avatar,
            );
            if (nextDayOpen) {
              final userDatastore = ref.read(userDatastoreProvider);
              userDatastore.newAvatarCode;
            }
          } else {
            debugPrint(timeGap.toString());
            debugPrint("Less than minute");
          }
        }
        return Transaction.success(userActivity.toJson());
      },
    );
  },
);

final AutoDisposeFutureProviderFamily<void, bool> setActiveProvider =
    FutureProvider.autoDispose.family<void, bool>(
  (ref, flag) async {
    final User user = ref.read(authUserProvider).value!;
    final FirebaseDatabase dt = ref.read(databaseProvider);
    final DatabaseReference userRef = dt.ref('users/${user.uid}');
    return userRef.update({'isActive': flag});
  },
);

final Provider<Query> recentUserProvider = Provider<Query>(
  (ref) {
    final dt = ref.read(databaseProvider);
    final int count = ref.watch(onlinePlayerProvider);

    return dt.ref('users').orderByChild('nowTime').limitToLast(count);
  },
);
