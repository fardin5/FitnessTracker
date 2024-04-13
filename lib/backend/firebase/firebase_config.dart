import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAk1q9gEPk9lG_j6PJQuds2eZwvXHLXSPs",
            authDomain: "fitness-tracker-4f280.firebaseapp.com",
            projectId: "fitness-tracker-4f280",
            storageBucket: "fitness-tracker-4f280.appspot.com",
            messagingSenderId: "619489619182",
            appId: "1:619489619182:web:2e72e8cc6c7bf6dc9d17ff",
            measurementId: "G-YY9MG3YW86"));
  } else {
    await Firebase.initializeApp();
  }
}
