// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCYsOM98RtWGHYKUpT19tbPzlLSBJkzIs0',
    appId: '1:583991599412:web:865fb2a2658b49e2814561',
    messagingSenderId: '583991599412',
    projectId: 'infosas-6a5bf',
    authDomain: 'infosas-6a5bf.firebaseapp.com',
    storageBucket: 'infosas-6a5bf.appspot.com',
    measurementId: 'G-Y3KN5VJVRB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuUAH9ZiDu8kc4x6rhr2Ph2zCq1cjbZAg',
    appId: '1:583991599412:android:11b44bac12273d8a814561',
    messagingSenderId: '583991599412',
    projectId: 'infosas-6a5bf',
    storageBucket: 'infosas-6a5bf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBhHkTcrKRatuMVVbgC-20oKKH9QjfHiw',
    appId: '1:583991599412:ios:4d32339e71b27668814561',
    messagingSenderId: '583991599412',
    projectId: 'infosas-6a5bf',
    storageBucket: 'infosas-6a5bf.appspot.com',
    iosBundleId: 'com.example.timeAttendance',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBhHkTcrKRatuMVVbgC-20oKKH9QjfHiw',
    appId: '1:583991599412:ios:4d32339e71b27668814561',
    messagingSenderId: '583991599412',
    projectId: 'infosas-6a5bf',
    storageBucket: 'infosas-6a5bf.appspot.com',
    iosBundleId: 'com.example.timeAttendance',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCYsOM98RtWGHYKUpT19tbPzlLSBJkzIs0',
    appId: '1:583991599412:web:681175164f0b8f49814561',
    messagingSenderId: '583991599412',
    projectId: 'infosas-6a5bf',
    authDomain: 'infosas-6a5bf.firebaseapp.com',
    storageBucket: 'infosas-6a5bf.appspot.com',
    measurementId: 'G-7R08LMXQ22',
  );
}