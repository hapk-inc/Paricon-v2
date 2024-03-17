import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/my_user.dart';
import '../model/user_activity.dart';
import '../theme/my_theme.dart';
import 'app_check.dart';
import 'auth_provider.dart';
import 'firebase_init.dart';
import 'user_datastore.dart';
import 'user_provider.dart';

final Provider<UserDatabase> userDatabaseProvider =
    Provider<UserDatabase>((ref) => UserDatabase(ref));

class UserDatabase {
  final Ref ref;

  late User? user;
  late DatabaseReference firebaseReference;

  late DatabaseReference passAvatarReference;
  late DatabaseReference userReference;
  late DatabaseReference myReference;

  UserDatabase(this.ref, {this.user}) {
    firebaseReference = ref.read(databaseProvider).ref();

    user = ref.watch(authUserProvider).value;
    passAvatarReference = firebaseReference.child('pass_avatar');

    userReference = firebaseReference.child('users');

    if (!kIsWeb) userReference.keepSynced(true);

    if (user != null) myReference = userReference.child(user!.uid);
  }

  Future updateName(String name) =>
      myReference.update({'name': firstCaps(name)});

  Future setActive(bool flag) => myReference.update({'isActive': flag});

  Future setPlaying(bool flag) => myReference.update({'isPlaying': flag});

  Future setAvatar(String avatar) => myReference.update({'avatar': avatar});

  Query get passAvatarQuery =>
      passAvatarReference.orderByChild('createdAt').limitToLast(6);

  Future<TransactionResult> get appOpened async {
    //final MyUser myUser = ref.read(myUserProvider).value!;
    final String? version =
        await ref.read(packageInfoProvider.future).then((x) => x.buildNumber);
    return myReference.runTransaction(
      (Object? user) {
        late UserActivity userActivity;
        final DateTime now = DateTime.now();
        if (user == null) {
          final MyUser? myUser = ref.read(myUserProvider).value;

          final bool isEmulator = ref.read(isEmulatorProvider);

          userActivity = UserActivity(
              nowTime: now,
              name: myUser?.name ?? "",
              avatar: myUser?.avatar ?? "",
              appVersion: version,
              isEmulator: isEmulator);
          return Transaction.success(userActivity.toJson());
        } else {
          return existingData(user, version ?? "");
        }
      },
    );
  }

  Transaction existingData(Object? user, String version) {
    debugPrint("Existing UserActivity");
    UserActivity userActivity;
    Map<String, dynamic> json = Map<String, dynamic>.from(user as Map);

    final UserActivity old = UserActivity.fromJson(json);
    final DateTime now = DateTime.now();

    bool nextDayOpen = now.day != old.nowTime.day;
    Duration timeGap = now.difference(old.nowTime);
    bool timeGapInMinute = timeGap > const Duration(minutes: 1);
    if (timeGapInMinute || nextDayOpen) {
      debugPrint("NewUpdate & timeGap ${timeGap.inSeconds}");

      userActivity = old.newUpdate(version);
      if (nextDayOpen) {
        final userDatastore = ref.read(userDatastoreProvider);
        userDatastore.newAvatarCode;
      }
      return Transaction.success(userActivity.toJson());
    } else {
      debugPrint("Less than minute & timeGap ${timeGap.inSeconds}");
      return Transaction.abort();
    }
  }

  Query recentUser(int count) => userReference
      //.orderByChild('nowTime')
      //.startAfter(DateTime.now().microsecondsSinceEpoch)
      .orderByChild('isEmulator')
      .equalTo(false)
      .limitToLast(count);
}
