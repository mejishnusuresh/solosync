import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solosync/services/databseservice.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? get currentUser => _auth.currentUser;

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('signInWithEmailAndPassword error: $e');
      return null;
    }
  }

  Future<String?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        await DatabaseService(uid: userCredential.user!.uid)
            .savingUserData(email);
        return null; // Registration successful
      }
    } on FirebaseAuthException catch (e) {
      print('registerWithEmailAndPassword error: $e');
      return e.message; // Return error message
    }
    return 'Unknown error'; // Return default error message
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        await DatabaseService(uid: userCredential.user!.uid)
            .savingUserData(userCredential.user!.email!);
        return userCredential.user;
      }
    } catch (e) {
      print('signInWithGoogle error: $e');
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  //delete user account
  Future deleteUserAccount() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await user.delete();
        print('User deleted successfully.');
      } catch (e) {
        print('Failed to delete user: $e');
      }
    }
  }

  Stream<User?> get user => _auth.authStateChanges();
}
