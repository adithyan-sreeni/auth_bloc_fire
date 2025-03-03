// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// Future<UserCredential> signInWithGoogle() async {
//   try {
//     // Trigger the Google Sign-In flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     if (googleUser == null) throw Exception("Google Sign-In canceled");

//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;
// // 
//     // Create a new credential
//     final OAuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     // Sign in to Firebase with the Google credential
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   } catch (e) {
//     throw Exception("Google Sign-In failed: $e");
//   }
// }

// Future<void> signOut() async {
//   await FirebaseAuth.instance.signOut();
//   await GoogleSignIn().signOut();
// }

// Future<User> signInWithEmailAndPassword(String email, String password) async {
//   try {
//     final UserCredential userCredential = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password);
//     return userCredential.user!;
//   } catch (e) {
//     throw Exception("Sign in failed: $e");
//   }
// }

// Future<User> signUpWithEmailAndPassword(String email, String password) async {
//   final UserCredential userCredential = await FirebaseAuth.instance
//       .createUserWithEmailAndPassword(email: email, password: password);
//   return userCredential.user!;
// }
