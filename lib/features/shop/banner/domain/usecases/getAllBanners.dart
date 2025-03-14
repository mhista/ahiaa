import 'package:ahiaa/core/usecases/usecase.dart';
import 'package:ahiaa/features/shop/banner/domain/entities/banner.dart';
import 'package:ahiaa/features/shop/banner/domain/repository/banner_repository.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:fpdart/fpdart.dart';

class GetAllBanners implements UseCase<List<Bannerr>, NoParams> {
  final BannerRepository _repository;

  GetAllBanners({required BannerRepository repository})
    : _repository = repository;
  @override
  Future<Either<Failure, List<Bannerr>>> call(NoParams params) async {
    return await _repository.getAllBanners();
  }
}
