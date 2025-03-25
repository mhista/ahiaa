part of 'auth_bloc.dart';

@immutable
sealed class AuthStateChanges {
  const AuthStateChanges();
}

final class AuthInitial extends AuthStateChanges {}

final class AuthSuccess extends AuthStateChanges {
  final User user;

  const AuthSuccess({required this.user});
}

final class AuthFailure extends AuthStateChanges {
  final String message;

  const AuthFailure({required this.message});
}

final class AuthLoading extends AuthStateChanges {}
