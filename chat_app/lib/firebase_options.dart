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
    apiKey: 'AIzaSyCKdJz-Vcae0SKoH5BpL0Y4933M9zrNzxQ',
    appId: '1:898447144576:web:6e80e9caca2735c2425865',
    messagingSenderId: '898447144576',
    projectId: 'chatapp-87dd3',
    authDomain: 'chatapp-87dd3.firebaseapp.com',
    storageBucket: 'chatapp-87dd3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOsc2BijX_heY8GvqPQA5xc9pcuLgqIu4',
    appId: '1:898447144576:android:fe0dcd86025968bd425865',
    messagingSenderId: '898447144576',
    projectId: 'chatapp-87dd3',
    storageBucket: 'chatapp-87dd3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFPmC_neIOeZzfsTizZ_Kcf2LY2zudAnU',
    appId: '1:898447144576:ios:aac2fb57920e7d8d425865',
    messagingSenderId: '898447144576',
    projectId: 'chatapp-87dd3',
    storageBucket: 'chatapp-87dd3.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFPmC_neIOeZzfsTizZ_Kcf2LY2zudAnU',
    appId: '1:898447144576:ios:e9f43f575b61707c425865',
    messagingSenderId: '898447144576',
    projectId: 'chatapp-87dd3',
    storageBucket: 'chatapp-87dd3.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
