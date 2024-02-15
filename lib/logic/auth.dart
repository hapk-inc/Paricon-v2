import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/pass_avatar_notifier.dart';
import '../model/d_avatar.dart';
import '../theme/my_theme.dart';
import 'package:rxdart/rxdart.dart';

import '../model/my_user.dart';
import 'firebase_init.dart';
import 'my_names.dart';

class Auth {
  final Ref ref;
  late CollectionReference userColl;
  late FirebaseFirestore _firebaseFirestore;

  late FirebaseAuth _auth;

  Auth(this.ref) {
    _auth = ref.read(firebaseAuthProvider);
    _firebaseFirestore = ref.read(fireStoreProvider);
    userColl = ref.read(fireStoreProvider).collection('users');
  }

  Stream<User?> get authUser {
    late BehaviorSubject<User?> subject;
    subject = BehaviorSubject<User?>(
      onListen: () => _auth.authStateChanges().listen(
        (event) {
          subject.add(event);
        },
      ),
    );
    return subject.stream;
  }

  User? get currentUser => _auth.currentUser;

  Future get signInAnonymous async => _auth.signInAnonymously().then(
        (userCred) => createUser(userCred),
      );

  Future createUser(UserCredential userCred) {
    final User fUser = userCred.user!;
    final String xName = fUser.displayName ??
        (mockInteger(0, 2) == 0
            ? "${myRandomName()} $myLastName"
            : myRandomName());
    //final String avatarCode =
    //    List.generate(6, (index) => mockInteger(1, 8).toString()).join();
    final DateTime createdAt = DateTime.now();
    final String id = fUser.uid;

    WriteBatch batch = _firebaseFirestore.batch();
    batch.set(
      userColl.doc(id),
      MyUser(
        name: xName,
        rName: xName,
        id: mockInteger(11111111, 99999999),
        //avatarCode: avatarCode,
        avatarCode: ref.read(passAvatarNotifierProvider).generateAvatarCode,
        createdAt: createdAt,
      ).toJson(),
    );
    batch.set(
      userColl.doc(id).collection('pass_avatar').doc(id),
      DAvatar(createdAt: createdAt).toJson(),
    );
    return batch.commit();
  }

  Future get signOut async {
    debugPrint("Signing Off ${_auth.currentUser!.uid}");
    return _auth.signOut();
  }

  Future updateName(String name) async {
    final String n = firstCaps(name);
    await _auth.currentUser!.updateDisplayName(n);
    return userColl.doc(_auth.currentUser!.uid).update({'name': n});
  }

  Future<String?> get signInWithGoogle async {
    final credential = await googleCredentials;
    if (credential == null) return null;
    return _auth.signInWithCredential(credential).then(
      (userCred) async {
        if (userCred.user == null) {
          return null;
        } else {
          final bool docExist = await checkIfDocExists(userCred.user!.uid);
          if (!docExist) {
            createUser(userCred);
          }
          return userCred.user!.email;
        }
      },
      onError: (Object e, s) {
        if (e is FirebaseAuthException) {
          debugPrint(e.toString());

          // debugPrintStack(stackTrace: exe.stackTrace);
        }
        debugPrintStack(stackTrace: s);
      },
    );
  }

  /// Check If Document Exists
  Future<bool> checkIfDocExists(String docId) async {
    try {
      var doc = await userColl.doc(docId).get();
      debugPrint("checkIfDocExists");
      return doc.exists;
    } catch (e) {
      return false;
    }
  }

  Future<AuthCredential?> get googleCredentials async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    try {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return credential;
    } on PlatformException {
      rethrow;
    }
  }
}
