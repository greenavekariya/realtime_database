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
    apiKey: 'AIzaSyAnhhTJSoerefR_UGf8F6ntik48GkpYGLI',
    appId: '1:348086841502:web:837f517c11205120220b8f',
    messagingSenderId: '348086841502',
    projectId: 'fir-620fd',
    authDomain: 'fir-620fd.firebaseapp.com',
    databaseURL: 'https://fir-620fd-default-rtdb.firebaseio.com',
    storageBucket: 'fir-620fd.appspot.com',
    measurementId: 'G-GZTWPT2DC6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhMi24iN71iw7N8wSiNGRmBVk_IDXfujs',
    appId: '1:348086841502:android:f0b2b1a03ebe8a0e220b8f',
    messagingSenderId: '348086841502',
    projectId: 'fir-620fd',
    databaseURL: 'https://fir-620fd-default-rtdb.firebaseio.com',
    storageBucket: 'fir-620fd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARNaTptEorgqwaEk28oc-40-bJak3d3M0',
    appId: '1:348086841502:ios:00e2e1b0fb0eeebf220b8f',
    messagingSenderId: '348086841502',
    projectId: 'fir-620fd',
    databaseURL: 'https://fir-620fd-default-rtdb.firebaseio.com',
    storageBucket: 'fir-620fd.appspot.com',
    iosBundleId: 'com.example.realtime',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyARNaTptEorgqwaEk28oc-40-bJak3d3M0',
    appId: '1:348086841502:ios:7e96f3594be271d2220b8f',
    messagingSenderId: '348086841502',
    projectId: 'fir-620fd',
    databaseURL: 'https://fir-620fd-default-rtdb.firebaseio.com',
    storageBucket: 'fir-620fd.appspot.com',
    iosBundleId: 'com.example.realtime.RunnerTests',
  );
}
