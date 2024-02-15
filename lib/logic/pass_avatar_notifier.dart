import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';

import '../model/d_avatar.dart';
import '../model/my_user.dart';
import '../model/pass_avatar.dart';
import 'auth_provider.dart';
import 'firebase_init.dart';
import 'user_provider.dart';

final passAvatarNotifierProvider = ChangeNotifierProvider<PassAvatarNotifier>(
  (ref) => PassAvatarNotifier(ref),
);

//----------------------------------
//List<String> coll = const ['n_male', 'n_female'];

class PassAvatarNotifier extends ChangeNotifier {
  final Ref ref;
  late DatabaseReference firebaseReference;
  late FirebaseFirestore firebaseFirestore;
  late User? user;

  /*late List<String> xCard = [
    ...["d", "j", "k", "o", "p", "r", "t", "u", "w", "ab", "ae"],
  ];*/
  late MyUser? myUser;

  late CollectionReference myPassAvatarColl;
  late DatabaseReference passAvatarReference;
  late DatabaseReference userReference;

  late CollectionReference userColl;

  PassAvatarNotifier(this.ref) {
    user = ref.watch(authUserProvider).value;
    firebaseReference = ref.read(databaseProvider).ref();
    firebaseFirestore = ref.read(fireStoreProvider);
    //myUser = ref.read(myUserProvider).value;
    //avatarCollection().then((y) => xCard = y);

    userColl = firebaseFirestore.collection('users');

    passAvatarReference = firebaseReference.child('pass_avatar');
    userReference = firebaseReference.child('users');

    if (user != null) {
      myPassAvatarColl = userColl.doc(user!.uid).collection('pass_avatar');
    }
  }

  Future<String> get giveOneAvatar async {
    List<String> myList = ref.read(myUserProvider).value?.avatarArr ?? [];
    //debugPrint("$xCard");

    List<String> x = await avatarCollection();
    debugPrint("$x");
    List<String> balance = List.from(x.toSet().difference(myList.toSet()));
    return balance.isEmpty
        ? mockString(16)
        : balance[mockInteger(0, balance.length - 1)];
  }

  Future<List<String>> avatarCollection(
      {List<String> coll = const ['n_male', 'n_female']}) async {
    final List q = await Future.wait(
      coll.map(
        (e) => firebaseReference.child(e).once().then(
          (databaseEvent) {
            final List a = databaseEvent.snapshot.value as List;
            return a;
          },
        ),
      ),
    );

    List y = q.expand((element) => element).toList();
    List<String> z = y.map((e) => e.toString()).toList();
    return z;
  }

  String get generateAvatarCode {
    String str = List.generate(
        6,
        <String>(int index) => defaultEmojiSet[1]
            .emoji[mockInteger(0, defaultEmojiSet[1].emoji.length - 1)]
            .emoji).join();
    return str;
  }

  Future searchAvatarCode(String code) =>
      userColl.where('avatarCode', isEqualTo: code).get().then(
        (QuerySnapshot snapshot) async {
          if (snapshot.docs.isEmpty) {
            debugPrint("123--isEmpty");
            return;
          }

          final List<String> list = snapshot.size == 0
              ? []
              : snapshot.docs.map((e) => e.id.toString()).toList();
          for (String x in list) {
            await Future.wait([friendCollection(x), passAvatarColl(x)]);
          }
        },
      );

  Future passAvatarColl(String x) async {
    final now = DateTime.now();
    await firebaseReference
        .child('pass_avatar_count')
        .set(ServerValue.increment(1));
    return passAvatarReference.child("${user?.uid ?? ""}+$x").set(
          PassAvatar(
            createdAt: now,
            from: user?.uid ?? "",
            to: x,
          ).toJson(),
        );
  }

  Future friendCollection(String x) => userColl
      .doc(x)
      .collection('pass_avatar')
      .doc(user?.uid ?? "")
      .set(DAvatar(createdAt: DateTime.now()).toJson());

  Future getNewAvatar(String x) async {
    final oneAvatar = await giveOneAvatar;
    return [
      myPassAvatarColl.doc(x).update({'avatar': oneAvatar}),
      updateFaceAvatar(oneAvatar)
    ];
  }

/*  Future firstAvatar(String avatar) async => [
        myPassAvatarColl
            .doc(user?.uid)
            .set(DAvatar(createdAt: DateTime.now(), avatar: avatar).toJson()),
        updateFaceAvatar(avatar),
      ];*/

  Future updateFaceAvatar(String avatar) => Future.wait(
        [
          userColl.doc(user?.uid ?? "").update(
            {
              'avatarArr': FieldValue.arrayUnion([avatar]),
              'avatar': avatar,
            },
          ),
          userReference.child(user?.uid ?? "").child('avatar').set(avatar)
        ],
      );
}
