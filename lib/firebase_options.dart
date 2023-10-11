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
    apiKey: 'AIzaSyBV4umvi5_ak-HgGI3WhTvN4_IREuJrsqA',
    appId: '1:347977675225:web:1f2a0fa0f872a940b469c8',
    messagingSenderId: '347977675225',
    projectId: 'udemyapp-cf11e',
    authDomain: 'udemyapp-cf11e.firebaseapp.com',
    storageBucket: 'udemyapp-cf11e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvLHQ04Mvc_2lSXVYmXHndAf65lqQPbKw',
    appId: '1:347977675225:android:54e5208de7be6a8eb469c8',
    messagingSenderId: '347977675225',
    projectId: 'udemyapp-cf11e',
    storageBucket: 'udemyapp-cf11e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBna4M4pCXQ-eeTWSWyOvCVhhYuP0K7Mhg',
    appId: '1:347977675225:ios:d744184955c8df46b469c8',
    messagingSenderId: '347977675225',
    projectId: 'udemyapp-cf11e',
    storageBucket: 'udemyapp-cf11e.appspot.com',
    iosBundleId: 'com.example.udemy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBna4M4pCXQ-eeTWSWyOvCVhhYuP0K7Mhg',
    appId: '1:347977675225:ios:69e6af21cb0d9ca8b469c8',
    messagingSenderId: '347977675225',
    projectId: 'udemyapp-cf11e',
    storageBucket: 'udemyapp-cf11e.appspot.com',
    iosBundleId: 'com.example.udemy.RunnerTests',
  );
}