part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final String? user;

  Authenticated({required this.user});
}

class Unauthenticated extends AuthState {}

class AuthActionState extends AuthState {}

class AuthError extends AuthActionState {
  final String message;

  AuthError({required this.message});
}

class NavigateToSignUp extends AuthActionState {}

class NavigateToLogin extends AuthActionState {}

///
///ads
class AuthSuccess extends AuthState {
  final UserCredential userCredential;
  AuthSuccess(this.userCredential);
}

class AuthFailure extends AuthActionState {
  final String message;
  AuthFailure(this.message);
}

class UserCreatedState extends AuthActionState {}

class ShowSnackBarState extends AuthActionState {
  final String message;
  ShowSnackBarState(this.message);
}
