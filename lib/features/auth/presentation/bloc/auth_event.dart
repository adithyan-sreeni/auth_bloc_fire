part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignInWithGoogleEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class SignInWithEmailEvent extends AuthEvent {
  final String email;
  final String password;
  // final String name;

  SignInWithEmailEvent({required this.email, required this.password});
}

class SignUpWithEmailEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  SignUpWithEmailEvent({
    required this.email,
    required this.password,
    required this.name,
  });
}

class NavigateToSignUpEvent extends AuthEvent {}

class NavigateToLoginEvent extends AuthEvent {}

class AuthErrorEvent extends AuthEvent {
  final String message;

  AuthErrorEvent({required this.message});
}

class UserCreatedEvent extends AuthEvent {}

class ShowSnackBarEvent extends AuthEvent {
  final String message;

  ShowSnackBarEvent({required this.message});
}
