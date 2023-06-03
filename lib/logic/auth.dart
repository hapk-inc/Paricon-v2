import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rxdart/rxdart.dart';

import 'package:mock_data/mock_data.dart';

import '../model/my_duration.dart';
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

final AutoDisposeFutureProviderFamily anonymousProvider =
    FutureProvider.autoDispose.family<void, String>(
  (ref, name) async {
    final auth = ref.read(authProvider);
    return auth.signInAnonymous(name: name);
  },
);

class Auth {
  final Ref ref;
  late FirebaseAuth _auth;

  Auth(this.ref) {
    _auth = ref.read(firebaseAuthProvider);
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

  Future signInAnonymous({String name = "Guest"}) {
    //final String avatar = ref.read(pickAvatarProvider);
    final String avatar = mockString();

    return _auth.signInAnonymously().then(
      (userCred) {
        return ref
            .read(fireStoreProvider)
            .collection('users')
            .doc(userCred.user!.uid)
            .set(
          {
            ...MyUser(
              name: "User#${mockInteger(100000, 999999)}",
              id: mockInteger(11111111, 99999999),
              isActive: true,
              avatar: avatar.isNotEmpty ? avatar : mockString(),
              isHuman: true,
            ).toJson(),
            ...MyDuration(currentTime: DateTime.now()).toJson()
          },
        );
      },
      onError: (e, s) {
        print(e);
        print(s);
      },
    ) /*.whenComplete(() => _auth.currentUser!.updateDisplayName(name))*/;
  }

  Future get signOut async {
    if (_auth.currentUser != null) {
      User? user = _auth.currentUser;
      bool? isAnonymous = user!.isAnonymous;
      await _auth.signOut();
      /*if (isAnonymous) {
        await ref
            .read(fireStoreProvider)
            .collection('users')
            .doc(user.uid)
            .delete();
        await ref
            .read(fireStoreProvider)
            .collection('tournament')
            .where('userId', isEqualTo: user.uid)
            .get()
            .then((value) {});
        // await batchDelete();
        await _auth.currentUser!
            .delete()
            .whenComplete(
              () => print("User Deleted"),
            )
            .catchError((e, s) => print(e));
      }*/
    }
  }

  Future updateName(String name) async {
    _auth.currentUser!.updateDisplayName(name);

    return ref
        .read(fireStoreProvider)
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .update({'name': name});
  }

  Future batchDelete() {
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
  }
}
