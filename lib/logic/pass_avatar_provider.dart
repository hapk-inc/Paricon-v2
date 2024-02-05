import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_provider.dart';
import 'firebase_init.dart';

final passAvatarDatabaseProvider = Provider((ref) => PassAvatarDatabase(ref));

class PassAvatarDatabase {
  final Ref ref;

  late DatabaseReference firebaseReference;
  late FirebaseFirestore firebaseFirestore;
  late User? user;
  late DatabaseReference passAvatarReference;

  PassAvatarDatabase(this.ref) {
    firebaseFirestore = ref.read(fireStoreProvider);
    firebaseReference = ref.read(databaseProvider).ref();

    user = ref.watch(authUserProvider).value;

    passAvatarReference = firebaseReference.child('pass_avatar');
  }
}
