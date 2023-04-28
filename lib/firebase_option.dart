import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kDebugMode, kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    if (defaultTargetPlatform == TargetPlatform.macOS) {
      return macos;
    }
    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = kDebugMode
      ? FirebaseOptions(
          apiKey: 'AIzaSyARtYQDxF50QRLJjpM5A5d6azA6rVFJeIo',
          appId: '1:118238046593:web:c942a4382468ea25d0a080',
          messagingSenderId: '118238046593',
          projectId: 'flutter-paricon',
          authDomain: 'flutter-paricon.firebaseapp.com',
          databaseURL: 'https://flutter-paricon.firebaseio.com',
          storageBucket: 'flutter-paricon.appspot.com',
          measurementId: 'G-KV6FSJS4Y4',
        )
      : FirebaseOptions(
          apiKey: 'AIzaSyBrj3L5nmc1xoRATDzO5KSu39xQRsvKO_4',
          appId: '1:294396273385:web:1d1021a08354b0cd0c8678',
          messagingSenderId: '294396273385',
          projectId: 'paricon-85795',
          authDomain: 'paricon-85795.firebaseapp.com',
          databaseURL: 'https://paricon-85795-default-rtdb.firebaseio.com',
          storageBucket: 'paricon-85795.appspot.com',
          measurementId: 'G-7WN0JQJDXS',
        );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgWL9wWazKbcQtt07ovk4EDqpEzy0es7g',
    appId: '1:118238046593:ios:62bc4f3c1d8fe9add0a080',
    messagingSenderId: '118238046593',
    projectId: 'flutter-paricon',
    databaseURL: 'https://flutter-paricon.firebaseio.com',
    storageBucket: 'flutter-paricon.appspot.com',
    androidClientId:
        '118238046593-cer6cij6i7e3skqhf2fsgastdp6gt3nd.apps.googleusercontent.com',
    iosClientId:
        '118238046593-fueao4h12snth56f96f6pm5oac34bbuv.apps.googleusercontent.com',
    iosBundleId: 'com.hapk.paricon',
  );
}
