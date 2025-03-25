import 'package:ahiaa/features/shop/banner/data/datasource/banner_data_source.dart';
import 'package:ahiaa/features/shop/banner/domain/entities/banner.dart';

import 'package:ahiaa/utils/exceptions/exceptions.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../utils/exceptions/subabase/server_exceptions.dart';
import '../../domain/repository/banner_repository.dart';

class BannerRepoImpl implements BannerRepository {
  final BannerDataSource bannerDataSource;

  BannerRepoImpl({required this.bannerDataSource});
  @override
  Future<Either<Failure, List<Bannerr>>> getAllBanners() async {
    try {
      final banners = await bannerDataSource.getAllBanners();

      return right(banners);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
