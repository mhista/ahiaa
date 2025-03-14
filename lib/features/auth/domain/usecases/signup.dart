import 'package:ahiaa/core/entities/user.dart';
import 'package:fpdart/fpdart.dart';

import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';

import '../repository/auth_repository.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;
  UserSignUp({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
        email: params.email,
        password: params.password,
        firstName: params.firstName,
        lastName: params.lastName,
        phoneNumber: params.phoneNumber);
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  UserSignUpParams(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber});
}
