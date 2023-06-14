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
    apiKey: 'AIzaSyAKRi09-BpTDZw_qIx8eYVMFLoY1UpJNQY',
    appId: '1:710719046634:web:5b94234f91046d84816893',
    messagingSenderId: '710719046634',
    projectId: 'air-retailer-project',
    authDomain: 'air-retailer-project.firebaseapp.com',
    storageBucket: 'air-retailer-project.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZBTGB66ICWaZEN5J9OYd2SX7AbxbojBE',
    appId: '1:710719046634:android:4187f655321b3117816893',
    messagingSenderId: '710719046634',
    projectId: 'air-retailer-project',
    storageBucket: 'air-retailer-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBg31IyVfK3MtSfQ7tZamdetP1YJdry9n8',
    appId: '1:710719046634:ios:8432f22130d506be816893',
    messagingSenderId: '710719046634',
    projectId: 'air-retailer-project',
    storageBucket: 'air-retailer-project.appspot.com',
    iosClientId: '710719046634-h0tihmdpnv8rec10tfk9tnjgqpbmbtqg.apps.googleusercontent.com',
    iosBundleId: 'com.example.airRetailerTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBg31IyVfK3MtSfQ7tZamdetP1YJdry9n8',
    appId: '1:710719046634:ios:8432f22130d506be816893',
    messagingSenderId: '710719046634',
    projectId: 'air-retailer-project',
    storageBucket: 'air-retailer-project.appspot.com',
    iosClientId: '710719046634-h0tihmdpnv8rec10tfk9tnjgqpbmbtqg.apps.googleusercontent.com',
    iosBundleId: 'com.example.airRetailerTask',
  );
}
