import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/usecases/usecase.dart';
import '../repository/auth_repository.dart';
import '../../../../core/entities/user.dart';

class GoogleSigninUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;

  GoogleSigninUser({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.signInWithGoogle();
  }
}
