
import 'package:firebase_auth/firebase_auth.dart';
class FirebaseAuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
Future<User?> signUpWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  } catch (e) {
    print("Error during sign up: $e");
    rethrow;
  }
}

Future<User?> signInWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential.user;
  } catch (e) {
    print("Error during sign in: $e");
    rethrow;
  }
}
  Future<void> signOut() async {
    await _auth.signOut();
  }


}