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
    apiKey: 'AIzaSyB5WpTh_Fp-Sy2woOS7ttyZgcMq_4kmz00',
    appId: '1:185263385061:web:db49693cd61d7ead16670c',
    messagingSenderId: '185263385061',
    projectId: 'new-chats-apps',
    authDomain: 'new-chats-apps.firebaseapp.com',
    storageBucket: 'new-chats-apps.firebasestorage.app',
    measurementId: 'G-Y1N1DFF475',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfJfCzdhJrhNgHgM2MNgRW1JEelFkA630',
    appId: '1:185263385061:android:8dac229559d3714316670c',
    messagingSenderId: '185263385061',
    projectId: 'new-chats-apps',
    storageBucket: 'new-chats-apps.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAP1v6Ft_qlBt1fUDsVfR0xlymAVl4GH5A',
    appId: '1:185263385061:ios:20f4e9985f40f52816670c',
    messagingSenderId: '185263385061',
    projectId: 'new-chats-apps',
    storageBucket: 'new-chats-apps.firebasestorage.app',
    iosClientId: '185263385061-hukp8ahs5o7h4t285dipi2kocovm2dti.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAP1v6Ft_qlBt1fUDsVfR0xlymAVl4GH5A',
    appId: '1:185263385061:ios:20f4e9985f40f52816670c',
    messagingSenderId: '185263385061',
    projectId: 'new-chats-apps',
    storageBucket: 'new-chats-apps.firebasestorage.app',
    iosClientId: '185263385061-hukp8ahs5o7h4t285dipi2kocovm2dti.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB5WpTh_Fp-Sy2woOS7ttyZgcMq_4kmz00',
    appId: '1:185263385061:web:d64d89783df368f416670c',
    messagingSenderId: '185263385061',
    projectId: 'new-chats-apps',
    authDomain: 'new-chats-apps.firebaseapp.com',
    storageBucket: 'new-chats-apps.firebasestorage.app',
    measurementId: 'G-71KMHYPZ0M',
  );

}