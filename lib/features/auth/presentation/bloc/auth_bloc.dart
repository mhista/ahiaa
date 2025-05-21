import 'dart:async';
import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/features/auth/domain/usecases/current_user.dart';
import 'package:ahiaa/features/auth/domain/usecases/login.dart';
import 'package:ahiaa/features/auth/domain/usecases/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/cubits/user/user_cubit.dart';
import '../../../../../core/entities/user.dart';
import '../../domain/usecases/google_signin.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStateChanges> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final UserCubit _userCubit;
  final GoogleSigninUser _googleSignIn;
  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
    required CurrentUser currentUser,
    required UserCubit userCubit,
    required GoogleSigninUser googleSignIn,
  }) : _userSignUp = userSignUp,
       _userLogin = userLogin,
       _currentUser = currentUser,
       _userCubit = userCubit,
       _googleSignIn = googleSignIn,
       super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLoginWithEmailAndPasword);
    on<AuthUserLoggedIn>(_isUserLoggedIn);
    on<GoogleSigninEvent>(_googleSigninUser);
  }

  // SIGNUP EVENT

  FutureOr<void> _onAuthSignUp(AuthSignUp event, emit) async {
    emit(AuthLoading());
    // debugPrint(event.)
    final res = await _userSignUp(
      // debugPrint
      UserSignUpParams(
        email: event.email,
        password: event.password,
        firstName: event.firstName,
        lastName: event.lastName,
        phoneNumber: event.phoneNumber,
      ),
    );
    debugPrint('signing up');
    res.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  // LOGIN EVENT

  FutureOr<void> _onAuthLoginWithEmailAndPasword(event, emit) async {
    emit(AuthLoading());

    final res = await _userLogin(
      UserLoginParams(email: event.email, password: event.password),
    );
    debugPrint('logging in');
    res.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  // CURRENT USER EVENT
  void _isUserLoggedIn(
    AuthUserLoggedIn event,
    Emitter<AuthStateChanges> emit,
  ) async {
    final result = await _currentUser(NoParams());
    result.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  // GOOGLE SIGNIN
  void _googleSigninUser(
    GoogleSigninEvent event,
    Emitter<AuthStateChanges> emit,
  ) async {
    emit(AuthLoading());

    final result = await _googleSignIn(NoParams());
    result.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _emitAuthSuccess(User user, Emitter<AuthStateChanges> emit) {
    _userCubit.updateUser(user);
    emit(AuthSuccess(user: user));
  }
}
