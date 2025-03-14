part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {
  // final User user;
}

final class UserLoggedIn extends UserState {
  final User user;

  UserLoggedIn({required this.user});
}
