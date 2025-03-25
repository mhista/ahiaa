import 'package:ahiaa/core/entities/user.dart';
import 'package:ahiaa/utils/exceptions/subabase/server_exceptions.dart';
import 'package:fpdart/fpdart.dart';

import 'package:ahiaa/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } on sb.AuthException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    try {
      final user = await remoteDataSource.signUpWithEmailAndPassword(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
      );
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } on sb.AuthException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUserData();
      if (user == null) {
        return left(Failure('User not logged in'));
      }
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      final user = await remoteDataSource.signInWithGoogle();
      if (user == null) {
        return left(Failure('User not logged in'));
      }
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
