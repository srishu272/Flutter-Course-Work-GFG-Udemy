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
    apiKey: 'AIzaSyB13Og04Wrr0zUBCUZoDWNzhTqN3oMM6k8',
    appId: '1:261663055103:web:8e1cfb268ecf08cbf280ca',
    messagingSenderId: '261663055103',
    projectId: 'the-tele-healthcare-80c3b',
    authDomain: 'the-tele-healthcare-80c3b.firebaseapp.com',
    storageBucket: 'the-tele-healthcare-80c3b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwbphy5jZ4xvWv5Mil0yUy6j1gRWAd1Zo',
    appId: '1:261663055103:android:7fa1630f496fb755f280ca',
    messagingSenderId: '261663055103',
    projectId: 'the-tele-healthcare-80c3b',
    storageBucket: 'the-tele-healthcare-80c3b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTMfu6Gx8HUSbttsdi-l7zOuzYLDVMGdI',
    appId: '1:261663055103:ios:4d68bca9c885da9af280ca',
    messagingSenderId: '261663055103',
    projectId: 'the-tele-healthcare-80c3b',
    storageBucket: 'the-tele-healthcare-80c3b.appspot.com',
    iosBundleId: 'com.example.teleHealthcare',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTMfu6Gx8HUSbttsdi-l7zOuzYLDVMGdI',
    appId: '1:261663055103:ios:3c339e159317fcc1f280ca',
    messagingSenderId: '261663055103',
    projectId: 'the-tele-healthcare-80c3b',
    storageBucket: 'the-tele-healthcare-80c3b.appspot.com',
    iosBundleId: 'com.example.teleHealthcare.RunnerTests',
  );
}
