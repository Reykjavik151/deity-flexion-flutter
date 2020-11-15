import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseAuthHelper {
  static Future<UserCredential> register({String email, String password}) async {
    UserCredential newUser = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return newUser;
  }

  static Future<UserCredential> login({String email, String password}) async {
    final UserCredential newUser = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return newUser;
  }
}
