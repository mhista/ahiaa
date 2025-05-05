import 'package:equatable/equatable.dart';
import '../domain/entities/category.dart';
import 'package:collection/collection.dart'; // For ListEquality

class CategoryService {
  List<Category> _parentCategories = [];
  List<Category> _subCategories = [];

  List<Category> get parentCategories => _parentCategories;
  List<Category> get subCategories => _subCategories;

  // Update parent categories and emit only if changed
  void updateParentCategories(List<Category> parentCategories) {
    _parentCategories = parentCategories;
  }

  // Update subcategories and emit only if changed
  void updateSubCategories(List<Category> subCategories) {
    _subCategories = subCategories;
  }

  // Clear all categories
  void clearAll() {
    _parentCategories = [];
    _subCategories = [];
  }
}
