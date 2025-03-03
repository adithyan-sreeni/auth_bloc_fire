import 'package:auth_bloc_fire/features/auth/services/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SignInWithGoogleEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final userCredential = await AuthService().signInWithGoogle();
        emit(AuthSuccess(userCredential));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      } finally {
        emit(AuthInitial());
      }
    });

    on<SignInWithEmailEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        // final userCredential = await signInWithEmailAndPassword(
        //   event.email,
        //   event.password,
        // );
        String? result = await AuthService().signIn(
          event.email,
          event.password,
        );
        if (result == "Sign in successful") {
          emit(Authenticated(user: result));
        } else {
          emit(AuthFailure(result!));
        }

        // emit(AuthSuccess(userCredential));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      } finally {
        emit(AuthInitial());
      }
    });
    on<SignUpWithEmailEvent>((event, emit) async {
      // log("Sign up event no error");
      emit(AuthLoading());
      try {
        String? result = await AuthService().signUp(
          event.email,
          event.password,
          event.name,
        );
        if (result == "Sign up successful") {
          emit(Authenticated(user: result));
          emit(UserCreatedState());
        } else {
          emit(AuthFailure(result!));
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      } finally {
        emit(AuthInitial());
      }
    });
    on<SignOutEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await AuthService().signOut();
        emit(Unauthenticated());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      } finally {
        emit(AuthInitial());
      }
    });
    on<ShowSnackBarEvent>((event, emit) {
      emit(ShowSnackBarState(event.message));
    });
  }
}
