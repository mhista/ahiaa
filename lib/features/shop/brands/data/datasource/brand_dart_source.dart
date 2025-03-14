import 'package:ahiaa/features/shop/brands/domain/entities/brands.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../utils/exceptions/subabase/server_exceptions.dart';
import '../models/brandmodel.dart';

abstract interface class BrandDataSource {
  Future<List<BrandModel>> getAllBrands();
  Future<void> uploadData(BrandModel brands);
}

class BrandDataSourceImpl implements BrandDataSource {
  final SupabaseClient _supabaseClient;

  BrandDataSourceImpl({required SupabaseClient supabaseClient})
    : _supabaseClient = supabaseClient;
  @override
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final brands =
          await _supabaseClient.from('brands').select(); //profile(name)
      return brands.map((brand) => BrandModel.fromMap(brand)).toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> uploadData(BrandModel brands) {
    // TODO: implement uploadData
    throw UnimplementedError();
  }
}
