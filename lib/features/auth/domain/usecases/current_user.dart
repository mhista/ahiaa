import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/features/auth/domain/repository/auth_repository.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/user.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;

  CurrentUser({required this.authRepository});
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
