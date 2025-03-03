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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDmxXix26Kezopz0XtfCd6bQeTY4BnYOXw',
    appId: '1:440909651606:web:16b16b3d32012da55a2cb7',
    messagingSenderId: '440909651606',
    projectId: 'simple-auth-task',
    authDomain: 'simple-auth-task.firebaseapp.com',
    storageBucket: 'simple-auth-task.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACeemsqQnnPL0NZT61eHim-a0_rlrD4xA',
    appId: '1:440909651606:android:8a2028ce0b6766c35a2cb7',
    messagingSenderId: '440909651606',
    projectId: 'simple-auth-task',
    storageBucket: 'simple-auth-task.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbtwiY6uAgnMuprsE2Zt8T6wneWueRHws',
    appId: '1:440909651606:ios:558d7244897254e25a2cb7',
    messagingSenderId: '440909651606',
    projectId: 'simple-auth-task',
    storageBucket: 'simple-auth-task.firebasestorage.app',
    iosBundleId: 'com.example.authBlocFire',
  );
}
