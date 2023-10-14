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
    apiKey: 'AIzaSyDowE48MTEgxl_7-lAcNn9FyngudEyBPfE',
    appId: '1:1045501620992:web:7b35fef21181ee0b3b39e5',
    messagingSenderId: '1045501620992',
    projectId: 'learngual-assesment',
    authDomain: 'learngual-assesment.firebaseapp.com',
    storageBucket: 'learngual-assesment.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmwiID_dgdSwNv4aG8mK1xM8KIFiM2Vow',
    appId: '1:1045501620992:android:7d15006ffe90bd5e3b39e5',
    messagingSenderId: '1045501620992',
    projectId: 'learngual-assesment',
    storageBucket: 'learngual-assesment.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTXZ3lKhX7t33oPE7-Af1ZG95m0U9oxyU',
    appId: '1:1045501620992:ios:2271d048e42d1d543b39e5',
    messagingSenderId: '1045501620992',
    projectId: 'learngual-assesment',
    storageBucket: 'learngual-assesment.appspot.com',
    iosBundleId: 'com.capturedHeart.learngualTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTXZ3lKhX7t33oPE7-Af1ZG95m0U9oxyU',
    appId: '1:1045501620992:ios:2271d048e42d1d543b39e5',
    messagingSenderId: '1045501620992',
    projectId: 'learngual-assesment',
    storageBucket: 'learngual-assesment.appspot.com',
    iosBundleId: 'com.capturedHeart.learngualTest',
  );
}