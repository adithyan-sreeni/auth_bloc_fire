import 'package:auth_bloc_fire/core/exceptions/firebase_auth_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) throw Exception("Google Sign-In canceled");

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      //firebase_auth.UserCredential
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      throw Exception("Google Sign-In failed: $e");
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Sign up with email and password
  Future<String?> signUp(
    String email,
    String password,
    String phoneNumber,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      // If the user is created successfully, store the phone number in Firestore
      // if (user != null) {}
      // await Future.delayed(const Duration(seconds: 1));
      // await signOut();
      return "Sign up successful";
    } on FirebaseAuthException catch (e) {
      // Convert FirebaseAuthException into TFirebaseAuthException
      MyFirebaseAuthException customException = MyFirebaseAuthException(e.code);
      return customException.message;
    }
  }

  // Sign in with email and password
  Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Sign in successful";
    } on FirebaseAuthException catch (e) {
      // Convert FirebaseAuthException into TFirebaseAuthException
      MyFirebaseAuthException customException = MyFirebaseAuthException(e.code);
      return customException.message;
    }
  }

  // Check if a user is signed in
  User? get currentUser {
    return _auth.currentUser;
  }
}
