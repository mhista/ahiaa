import 'dart:async';
import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/features/auth/domain/usecases/current_user.dart';
import 'package:ahiaa/features/auth/domain/usecases/login.dart';
import 'package:ahiaa/features/auth/domain/usecases/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/user/user_cubit.dart';
import '../../../../core/entities/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final UserCubit _userCubit;
  AuthBloc(
      {required UserSignUp userSignUp,
      required UserLogin userLogin,
      required CurrentUser currentUser,
      required UserCubit userCubit})
      : _userSignUp = userSignUp,
        _userLogin = userLogin,
        _currentUser = currentUser,
        _userCubit = userCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthUserLoggedIn>(_isUserLoggedIn);
  }

  // SIGNUP EVENT

  FutureOr<void> _onAuthSignUp(event, emit) async {
    final res = await _userSignUp(UserSignUpParams(
      email: event.email,
      password: event.password,
      firstName: event.firstName,
      lastName: event.lastName,
      phoneNumber: event.phoneNumber,
    ));
    debugPrint('signing up');
    res.fold((l) => emit(AuthFailure(message: l.message)),
        (user) => _emitAuthSuccess(user, emit));
  }

// LOGIN EVENT

  FutureOr<void> _onAuthLogin(event, emit) async {
    final res = await _userLogin(UserLoginParams(
      email: event.email,
      password: event.password,
    ));
    debugPrint('logging in');
    res.fold((l) => emit(AuthFailure(message: l.message)),
        (user) => _emitAuthSuccess(user, emit));
  }

  // CURRENT USER EVENT
  void _isUserLoggedIn(
    AuthUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _currentUser(NoParams());
    result.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _emitAuthSuccess(User user, Emitter<AuthState> emit) {
    _userCubit.updateUser(user);
    emit(AuthSuccess(user: user));
  }
}
