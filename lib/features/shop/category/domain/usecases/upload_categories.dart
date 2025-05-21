import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../utils/exceptions/exceptions.dart';
import '../entities/category.dart';
import '../repository/category_repository.dart';

class UploadCategories implements UseCase<Category, CategoryParams> {
  final CategoryRepository _categoryRepo;

  UploadCategories({required CategoryRepository categoryRepo})
    : _categoryRepo = categoryRepo;

  @override
  Future<Either<Failure, Category>> call(CategoryParams params) async {
    return await _categoryRepo.uploadCategory(
      id: params.id,
      name: params.name,
      image: params.image,
      isFeatured: params.isFeatured,
      parentId: params.parentId,
      productCounts: params.productCounts,
    );
  }
}

class CategoryParams {
  final int? id;
  final String name;
  String image;
  final String? parentId;
  final bool isFeatured;
  final int productCounts;
  CategoryParams({
    this.id,
    required this.name,
    required this.image,
    this.parentId,
    required this.isFeatured,
    required this.productCounts,
  });
}
