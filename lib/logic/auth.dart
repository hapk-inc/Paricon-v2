import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/my_names.dart';
import 'package:rxdart/rxdart.dart';

import '../model/avatar_card.dart';
import '../model/my_user.dart';
import 'firebase_init.dart';

final firebaseUserProvider = Provider.autoDispose<User>(
  (ref) {
    final Auth auth = ref.watch(authProvider);
    return auth.currentUser!;
  },
);

final Provider<Auth> authProvider = Provider<Auth>((ref) => Auth(ref));

final authUserProvider = StreamProvider<User?>(
  (ref) {
    final auth = ref.watch(authProvider);
    return auth.authUser;
  },
);

final AutoDisposeFutureProvider signOutProvider =
    FutureProvider.autoDispose<void>(
  (ref) async {
    final auth = ref.read(authProvider);
    return auth.signOut;
  },
);

final AutoDisposeFutureProviderFamily updateNameProvider =
    FutureProvider.autoDispose.family<void, String>(
  (ref, name) async {
    final auth = ref.read(authProvider);
    return auth.updateName(name);
  },
);

final AutoDisposeFutureProvider anonymousProvider =
    FutureProvider.autoDispose<void>(
  (ref) async {
    final auth = ref.read(authProvider);
    return auth.signInAnonymous;
  },
);

final AutoDisposeFutureProvider gSignProvider =
    FutureProvider.autoDispose<void>(
  (ref) async {
    final auth = ref.read(authProvider);
    return auth.signInWithGoogle;
  },
);

class Auth {
  final Ref ref;
  late CollectionReference userColl;
  late FirebaseAuth _auth;
  //late String? userId;

  Auth(this.ref) {
    _auth = ref.read(firebaseAuthProvider);
    userColl = ref.read(fireStoreProvider).collection('users');
    //userId = ref.read(firebaseUserProvider).uid;
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
        onError: (e, s) {
          if (kDebugMode) {
            print(e);
          }
        },
      );

  Future createUser(UserCredential userCred) async {
    final User fUser = userCred.user!;
    final String xName = fUser.displayName ??
        (mockInteger(0, 1) == 0
            ? "${myRandomName()} $myLastName"
            : myRandomName());
    final DateTime createdAt = fUser.metadata.creationTime ?? DateTime.now();
    await userColl.doc(userCred.user!.uid).set(
      {
        ...MyUser(
          name: xName,
          rName: xName,
          id: mockInteger(11111111, 99999999),
          isActive: true,
          avatar: "",
          isHuman: true,
          createdAt: createdAt,
        ).toJson(),
        //...MyDuration(currentTime: createdAt).toJson()
      },
    );
    return userColl.doc(userCred.user!.uid).collection('avatar').add(
          AvatarCard(
            createdAt: createdAt,
            createdBy: userCred.user!.uid,
          ).toJson(),
        );
  }

  Future get signOut async {
    debugPrint("Signing Off ${_auth.currentUser!.uid}");
    await userColl.doc(_auth.currentUser!.uid).update({'isActive': false});
    return _auth.signOut();
  }

  Future updateName(String name) async {
    _auth.currentUser!.updateDisplayName(name);
    return userColl.doc(_auth.currentUser!.uid).update({'name': name});
  }

/*  Future batchDelete() {
    WriteBatch batch = ref.read(fireStoreProvider).batch();
    final String id = ref.read(firebaseUserProvider).uid;
    return ref
        .read(fireStoreProvider)
        .collection('tournament')
        .where('userId', isEqualTo: id)
        .get()
        .then((querySnapshot) {
      for (var document in querySnapshot.docs) {
        batch.delete(document.reference);
      }

      return batch.commit();
    });
  }*/

  Future get signInWithGoogle async {
    final credential = await googleCredentials;
    if (credential == null) return;
    return _auth.signInWithCredential(credential).then(
      (userCred) => createUser(userCred),
      onError: (e, s) {
        debugPrint(e);
      },
    );
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
