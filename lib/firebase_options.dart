import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // Web configuration
    return const FirebaseOptions(
        apiKey: "AIzaSyA94jT1CFynwH2g5ilF46PnTm2mGADNfbc",
        authDomain: "bookmyshow-5dbcc.firebaseapp.com",
        projectId: "bookmyshow-5dbcc",
        storageBucket: "bookmyshow-5dbcc.firebasestorage.app",
        messagingSenderId: "39196205377",
        appId: "1:39196205377:web:17336d9ca1e8fcfba3c1c0"
    );
  }
}
