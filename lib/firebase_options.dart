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
    apiKey: 'AIzaSyC8waJEnfrFuj1xjxkKbA8o-JpEH_qidVo',
    appId: '1:736058952517:web:a48e4465b5422915694c2c',
    messagingSenderId: '736058952517',
    projectId: 'chat-clone-5ba1a',
    authDomain: 'chat-clone-5ba1a.firebaseapp.com',
    storageBucket: 'chat-clone-5ba1a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBP1dMMNEC7pCkUI0O50rUXn1XGTevK3cI',
    appId: '1:736058952517:android:4a02bc93e4f82b55694c2c',
    messagingSenderId: '736058952517',
    projectId: 'chat-clone-5ba1a',
    storageBucket: 'chat-clone-5ba1a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvqS52dGEfIHxLH7gwLLYw6kTBD9FkeDY',
    appId: '1:736058952517:ios:529590476748e9d8694c2c',
    messagingSenderId: '736058952517',
    projectId: 'chat-clone-5ba1a',
    storageBucket: 'chat-clone-5ba1a.appspot.com',
    androidClientId: '736058952517-29c4jokroqaheoh0a8avqpdqbj246df9.apps.googleusercontent.com',
    iosClientId: '736058952517-bsidk8ej97j54b5ag6tf41g94efom5fh.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseChatClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBvqS52dGEfIHxLH7gwLLYw6kTBD9FkeDY',
    appId: '1:736058952517:ios:529590476748e9d8694c2c',
    messagingSenderId: '736058952517',
    projectId: 'chat-clone-5ba1a',
    storageBucket: 'chat-clone-5ba1a.appspot.com',
    androidClientId: '736058952517-29c4jokroqaheoh0a8avqpdqbj246df9.apps.googleusercontent.com',
    iosClientId: '736058952517-bsidk8ej97j54b5ag6tf41g94efom5fh.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseChatClone',
  );
}
