import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBQrZcDdX1DHM2krgXxX_swimednAi9FwA",
            authDomain: "wizarding-school.firebaseapp.com",
            projectId: "wizarding-school",
            storageBucket: "wizarding-school.appspot.com",
            messagingSenderId: "242795678972",
            appId: "1:242795678972:web:b9e7e289c2b6e6286d1b79",
            measurementId: "G-RXR2F3BLJ0"));
  } else {
    await Firebase.initializeApp();
  }
}
