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
    apiKey: 'AIzaSyBgUtZqUljC4ZtTvg3bWv5YVwHrCOvIvC4',
    appId: '1:60865435241:web:cf7850b84ed3906b0874f8',
    messagingSenderId: '60865435241',
    projectId: 'nfc-task-app',
    authDomain: 'nfc-task-app.firebaseapp.com',
    storageBucket: 'nfc-task-app.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCs7bpgW0tRsu_2KdoEr2mnbqYYzyI4Ty4',
    appId: '1:60865435241:android:7cb6cbee414811540874f8',
    messagingSenderId: '60865435241',
    projectId: 'nfc-task-app',
    storageBucket: 'nfc-task-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADeKsrz9_NROe-H_D-rIwjfSeNAEKCMDo',
    appId: '1:60865435241:ios:2e0c9cbda5295fe50874f8',
    messagingSenderId: '60865435241',
    projectId: 'nfc-task-app',
    storageBucket: 'nfc-task-app.firebasestorage.app',
    iosBundleId: 'com.example.nfctask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADeKsrz9_NROe-H_D-rIwjfSeNAEKCMDo',
    appId: '1:60865435241:ios:2e0c9cbda5295fe50874f8',
    messagingSenderId: '60865435241',
    projectId: 'nfc-task-app',
    storageBucket: 'nfc-task-app.firebasestorage.app',
    iosBundleId: 'com.example.nfctask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBgUtZqUljC4ZtTvg3bWv5YVwHrCOvIvC4',
    appId: '1:60865435241:web:c4e2ccfe25e9b23c0874f8',
    messagingSenderId: '60865435241',
    projectId: 'nfc-task-app',
    authDomain: 'nfc-task-app.firebaseapp.com',
    storageBucket: 'nfc-task-app.firebasestorage.app',
  );
}
