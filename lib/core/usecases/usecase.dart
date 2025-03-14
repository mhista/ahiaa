import 'package:fpdart/fpdart.dart';

import '../../utils/exceptions/exceptions.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
