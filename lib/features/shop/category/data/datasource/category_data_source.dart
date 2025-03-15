import 'package:ahiaa/core/cubits/imagePicker/image_picker.dart';
import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/core/services/storage/storage/storage_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../utils/exceptions/subabase/server_exceptions.dart';
import '../models/category_model.dart';

abstract interface class CategoryDataSource {
  Future<List<CategoryModel>> getAllCategories();
  Future<List<CategoryModel>> getSubCategories(String categoryId);
  Future<CategoryModel> uploadCategory(CategoryModel categorymodel);
  Future<String> uploadImage(CategoryModel categorymodel);
}

class CategoryDataSourceImpl implements CategoryDataSource {
  final SupabaseClient _supabaseClient;

  CategoryDataSourceImpl({required SupabaseClient supabaseClient})
    : _supabaseClient = supabaseClient;
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final categories = await _supabaseClient.from('category').select();
      return categories.map((e) => CategoryModel.fromMap(e)).toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories = await _supabaseClient
          .from('category')
          .select()
          .eq('parent_id', categoryId);
      return subCategories.map((e) => CategoryModel.fromMap(e)).toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadImage(CategoryModel categorymodel) async {
    try {
      final image = serviceLocator<ImageCubit>().state;
      final imageUrl = await serviceLocator<StorageCubit>()
          .uploadImageToSupabase(
            image: image.first,
            path: categorymodel.id,
            bucketId: 'categories',
          );
      return imageUrl;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CategoryModel> uploadCategory(CategoryModel categorymodel) async {
    try {
      final categoryModel =
          await _supabaseClient
              .from('categories')
              .insert(categorymodel.toMap())
              .select();
      return CategoryModel.fromMap(categoryModel.first);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
