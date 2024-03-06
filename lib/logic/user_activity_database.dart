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
  late String? id;

  late DatabaseReference firebaseReference;

  late DatabaseReference passAvatarReference;
  late DatabaseReference userReference;

  UserDatabase(this.ref, {this.id}) {
    firebaseReference = ref.read(databaseProvider).ref();

    id = ref.watch(authUserProvider).value!.uid;

    passAvatarReference = firebaseReference.child('pass_avatar');

    userReference = id == null
        ? firebaseReference.child('users')
        : firebaseReference.child('users/${id!}');
  }

  Future<TransactionResult> get appOpened async {
    final MyUser myUser = ref.read(myUserProvider).value!;
    final String name = myUser.name;

    final String? version =
        await ref.read(packageInfoProvider.future).then((x) => x.buildNumber);
    final DateTime now = DateTime.now();
    return userReference.runTransaction(
      (Object? user) {
        late UserActivity uA;
        if (user == null) {
          uA = UserActivity(nowTime: now, name: name, appVersion: version);
          return Transaction.success(uA.toJson());
        } else {
          Map<String, dynamic> json = Map<String, dynamic>.from(user as Map);

          final UserActivity old = UserActivity.fromJson(json);

          bool nextDayOpen = now.day != old.nowTime.day;
          Duration timeGap = now.difference(old.nowTime);
          bool timeGapInMinute = timeGap > const Duration(minutes: 1);
          if (timeGapInMinute || nextDayOpen) {
            debugPrint("Existing LastOpened");
            uA = UserActivity(
              nowTime: now,
              lastOpened: old.nowTime,
              appVersion: version,
              name: myUser.name,
              avatar: myUser.avatar,
            );
            if (nextDayOpen) {
              final userDatastore = ref.read(userDatastoreProvider);
              userDatastore.newAvatarCode;
            }
            return Transaction.success(uA.toJson());
          } else {
            debugPrint("Less than minute");
            return Transaction.abort();
          }
        }
      },
    );
  }

  Query recentUser(int count) => firebaseReference
      .child('users')
      .orderByChild('nowTime')
      .limitToLast(count);

  Future setActive(bool flag) => userReference.update({'isActive': flag});

  Future setPlaying(bool flag) => userReference.update({'isPlaying': flag});

//  Future setAvatar(String avatar) => userReference.update({'avatar': avatar});

  Future updateName(String name) {
    String n = firstCaps(name);
    return userReference.update({'name': n});
  }

  Query get passAvatarQuery =>
      passAvatarReference.orderByChild('createdAt').limitToLast(6);

/*  Future newPassAvatar(String x) {
    firebaseReference.child('pass_avatar_count').set(ServerValue.increment(1));
    return passAvatarReference.push().set(
          PassAvatar(
            createdAt: DateTime.now(),
            from: id ?? "",
            to: x,
          ).toJson(),
        );*/
}

/*Stream<num> get passAvatarCount => firebaseReference
      .child('pass_avatar_count')
      .onValue
      .map((event) => event.snapshot.value as num);*/

/*Query get myPassAvatarQuery {
    debugPrint("120--${id ?? "abc"}");
    return passAvatarReference.orderByChild('to').equalTo(id);
    //.orderByChild('created At');
  }*/

/*Future passAvatarUpdate(String doc, String avatar) =>
      passAvatarReference.child(doc).update({'avatar': avatar});
*/
/*Stream<bool> get hasNewAvatars {
    late BehaviorSubject<bool> subject;
    subject = BehaviorSubject<bool>(
      onListen: () => myPassAvatarQuery.onValue.listen(
        (event) {
          final a = event.snapshot.exists;
          subject.add(a);
        },
      ),
    );
    return subject.stream;
  }
}*/
