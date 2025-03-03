import 'package:auth_bloc_fire/features/auth/authwrapper.dart';
import 'package:auth_bloc_fire/core/theme/dark_theme.dart';
import 'package:auth_bloc_fire/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(create: (context) => AuthBloc(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication with Firebase',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: AuthWrapper(),
    );
  }
}
