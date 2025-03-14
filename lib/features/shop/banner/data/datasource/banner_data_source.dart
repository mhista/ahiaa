import 'package:ahiaa/features/shop/banner/data/models/banner_model.dart';
import 'package:ahiaa/utils/exceptions/subabase/server_exceptions.dart'
    show ServerException;
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class BannerDataSource {
  Future<List<BannerModel>> getAllBanners();
}

class BannerRemoteDataSource extends BannerDataSource {
  final SupabaseClient supabaseClient;

  BannerRemoteDataSource({required this.supabaseClient});

  @override
  Future<List<BannerModel>> getAllBanners() async {
    try {
      final banners =
          await supabaseClient.from('banners').select(); //profile(name)
      return banners.map((banner) => BannerModel.fromMap(banner)).toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
