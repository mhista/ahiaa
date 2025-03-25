import 'package:ahiaa/core/entities/user.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../utils/exceptions/exceptions.dart';

abstract interface class AuthRepository {
  // Signup with email and password
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  });

  // Login with email and password
  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> currentUser();
  // google signin
  Future<Either<Failure, User>> signInWithGoogle();
}
