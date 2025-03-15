import 'package:ahiaa/core/cubits/imagePicker/image_picker.dart';
import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/core/services/storage/storage/storage_cubit.dart';
import 'package:ahiaa/features/shop/brands/domain/entities/brands.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../utils/exceptions/subabase/server_exceptions.dart';
import '../models/brandmodel.dart';

abstract interface class BrandDataSource {
  Future<List<BrandModel>> getAllBrands();
  Future<BrandModel> uploadBrand(BrandModel brands);
  Future<String> uploadBrandImage(BrandModel brand);
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
  Future<BrandModel> uploadBrand(BrandModel brands) async {
    try {
      final brand =
          await _supabaseClient.from('brands').insert(brands.toMap()).select();

      return BrandModel.fromMap(brand.first);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadBrandImage(BrandModel brand) async {
    try {
      final image = serviceLocator<ImageCubit>().state;

      final imageUrl = await serviceLocator<StorageCubit>()
          .uploadImageToSupabase(
            image: image.first,
            path: brand.id,
            bucketId: 'brands',
          );
      return imageUrl;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
