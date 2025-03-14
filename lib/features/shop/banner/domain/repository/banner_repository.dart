import 'package:ahiaa/features/shop/banner/domain/entities/banner.dart';
import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BannerRepository {
  Future<Either<Failure, List<Bannerr>>> getAllBanners();
}
