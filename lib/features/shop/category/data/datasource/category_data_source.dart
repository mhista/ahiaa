import 'package:ahiaa/core/cubits/imagePicker/image_picker.dart';
import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/core/services/storage/storage/storage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../utils/exceptions/subabase/server_exceptions.dart';
import '../models/category_model.dart';

abstract interface class CategoryDataSource {
  Future<List<CategoryModel>> getAllCategories();
  Future<List<CategoryModel>> getParentCategories();

  Future<List<CategoryModel>> getSubCategories(int categoryId);
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
    } on ServerException catch (e) {
      throw ServerException(e.toString());
    } on StorageException catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<CategoryModel>> getSubCategories(int categoryId) async {
    try {
      debugPrint('fetching subcategories for category ID: $categoryId');
      final subCategories = await _supabaseClient
          .from('category')
          .select()
          .eq('parent_id', categoryId.toString());
      debugPrint(subCategories.toString());
      return subCategories.map((e) => CategoryModel.fromMap(e)).toList();
    } catch (e) {
      debugPrint(e.toString());

      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadImage(CategoryModel categorymodel) async {
    try {
      if (categorymodel.image != '') {
        final image = await serviceLocator<StorageCubit>()
            .getImageDataFromAssets(categorymodel.image);
        final imageUrl = await serviceLocator<StorageCubit>().uploadImageData(
          image: image,
          path: 'category/${categorymodel.name}_${categorymodel.id.toString()}',
          bucketId: 'category',
        );
        return imageUrl;
      }
      return '';
      // final image = serviceLocator<ImageCubit>().state;
      // final imageUrl = await serviceLocator<StorageCubit>()
      //     .uploadImageToSupabase(
      //       image: image.first,
      //       path: categorymodel.id,
      //       bucketId: 'categories',
      //     );
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CategoryModel> uploadCategory(CategoryModel categorymodel) async {
    try {
      debugPrint(categorymodel.toString());

      final categoryModel = await _supabaseClient
          .from('category')
          .insert(categorymodel.toMap())
          .select('*');

      return CategoryModel.fromMap(categoryModel.first);
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<CategoryModel>> getParentCategories() async {
    try {
      final subCategories = await _supabaseClient
          .from('category')
          .select()
          // .not('parent_id', 'is', null) // checks for NOT NULL
          .eq('parent_id', '') // checks for NOT EMPTY
          .neq('image', '');
      return subCategories.map((e) => CategoryModel.fromMap(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException(e.toString());
    }
  }
}
