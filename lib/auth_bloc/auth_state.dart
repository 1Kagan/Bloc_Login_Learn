part of 'auth_bloc.dart';

sealed class AuthState {
  final String email;
  final String password;

  AuthState({this.email = '', this.password = ''});
}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  AuthSuccess({required super.email, required super.password});
}

final class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);
}

final class AuthLoading extends AuthState {}
