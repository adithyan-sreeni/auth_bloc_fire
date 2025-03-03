import 'package:auth_bloc_fire/features/auth/presentation/pages/home_page.dart';
import 'package:auth_bloc_fire/features/auth/presentation/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // User is signed in
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.popUntil(context, (route) => route.isFirst);
          });

          return Home();
        } else {
          // User is not signed in
          return Login();
        }
      },
    );
  }
}
