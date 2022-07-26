// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDeBuUihlUjqEpEFNsHLhhKgtZPijbtMdA',
    appId: '1:538850303764:web:8097a2405906464a15ac01',
    messagingSenderId: '538850303764',
    projectId: 'akwaaba-app-ghana',
    authDomain: 'akwaaba-app-ghana.firebaseapp.com',
    storageBucket: 'akwaaba-app-ghana.appspot.com',
  );
  static const vapidKey = "BFYfHkINADT93GaU7PXYF2ktbeokHPeKL1Uwwj1ltvJZpPn6bNEADs4n4q9OYjb1pSOiITNpeE2yNUdH30EJ28E";

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXLPuNLqjC8fYuz704rlYB7ORNYiAXeLE',
    appId: '1:538850303764:android:70bcaed905600d3115ac01',
    messagingSenderId: '538850303764',
    projectId: 'akwaaba-app-ghana',
    storageBucket: 'akwaaba-app-ghana.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_xS4ctvSVLeXfzDBr2WhRdW1iBYQdqK0',
    appId: '1:538850303764:ios:35eda8ec6194dd3f15ac01',
    messagingSenderId: '538850303764',
    projectId: 'akwaaba-app-ghana',
    storageBucket: 'akwaaba-app-ghana.appspot.com',
    iosClientId: '538850303764-8iblpgj8vcd2kd3q8tjp3ad760nlkem3.apps.googleusercontent.com',
    iosBundleId: 'com.example.akwaabaUserApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_xS4ctvSVLeXfzDBr2WhRdW1iBYQdqK0',
    appId: '1:538850303764:ios:35eda8ec6194dd3f15ac01',
    messagingSenderId: '538850303764',
    projectId: 'akwaaba-app-ghana',
    storageBucket: 'akwaaba-app-ghana.appspot.com',
    iosClientId: '538850303764-8iblpgj8vcd2kd3q8tjp3ad760nlkem3.apps.googleusercontent.com',
    iosBundleId: 'com.example.akwaabaUserApp',
  );
}
