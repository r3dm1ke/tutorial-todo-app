import 'package:firebase_auth/firebase_auth.dart';

class Authentication {

  final _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> login(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      return result.user;
    } catch (e) {
      return null;
    }
  }
}