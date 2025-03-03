import 'dart:developer';

import 'package:auth_bloc_fire/common/widgets/background.dart';
import 'package:auth_bloc_fire/common/widgets/my_button.dart';
import 'package:auth_bloc_fire/common/widgets/my_outlined_btn.dart';
import 'package:auth_bloc_fire/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth_bloc_fire/features/auth/presentation/widgets/email_field.dart';
import 'package:auth_bloc_fire/features/auth/presentation/widgets/or_continue.dart';
import 'package:auth_bloc_fire/features/auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _emailformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          // bloc: authBloc,
          listener: (context, state) {
            log("Current AuthBloc state: $state");
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is Authenticated) {
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(builder: (context) => Home()),
              // );
              //TODO: Navigate to home page
            } else if (state is UserCreatedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("User created successfully"),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          listenWhen: (previous, current) => current is AuthActionState,
          buildWhen: (previous, current) => current is! AuthActionState,
          builder: (context, state) {
            // if (state is AuthLoading) {
            //   return Center(child: CircularProgressIndicator());
            // }
            return Stack(
              children: [
                BackgroundWidget(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      controller: emailController,
                      hintText: 'Enter Email',
                      formKey: _emailformKey,
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    PasswordField(
                      controller: passwordController,
                      hintText: "Enter Password",
                      formKey: _passwordformKey,
                    ),
                    const SizedBox(height: 20),
                    MyButton(
                      onTap: () {
                        if (_emailformKey.currentState!.validate() &&
                            _passwordformKey.currentState!.validate()) {
                          // log("Email: ${emailController.text} no errors here");
                          context.read<AuthBloc>().add(
                            SignUpWithEmailEvent(
                              email: emailController.text,
                              password: passwordController.text,
                              name: "none",
                            ),
                          );
                        }
                      },
                      label: 'Sign Up',
                    ),
                    SizedBox(height: 20),
                    //or continue with
                    Continue(),
                    SizedBox(height: 20),
                    //google button
                    MyOutlinedButton(
                      onTap: () async {
                        context.read<AuthBloc>().add(SignInWithGoogleEvent());
                      },
                      label: 'Create Account with Google',
                      // assetLocation: 'lib/images/google.svg',
                    ),
                    SizedBox(height: 20),
                    //register here button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            // authBloc.add(NavigateToLoginEvent());
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Login here',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                if (state is AuthLoading)
                  IgnorePointer(
                    ignoring: true,
                    child: Container(
                      color: const Color.fromARGB(155, 0, 0, 0),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
