import '../../../../core/entities/product.dart';

class ProductServices {
  List<Products> _products = [];
  List<Products> _featuredProducts = [];
  List<Products> _brandProducts = [];
  List<Products> _storeProducts = [];
  List<Products> _categoryProducts = [];
  List<Products> _favProducts = [];
  List<Products> _recommendedProducts = [];

  List<Products> get products => _products;
  List<Products> get featuredProducts => _featuredProducts;
  List<Products> get brandProducts => _brandProducts;
  List<Products> get storeProducts => _storeProducts;
  List<Products> get categoryProducts => _categoryProducts;
  List<Products> get favProducts => _favProducts;
  List<Products> get recommendedProducts => _recommendedProducts;

  // Update products and emit only if changed
  void updateProducts(List<Products> products) {
    _products = products;
  }

  // Update featured products and emit only if changed
  void updateFeaturedProducts(List<Products> featuredProducts) {
    _featuredProducts = featuredProducts;
  }

  // Update brand products and emit only if changed
  void updateBrandProducts(List<Products> brandProducts) {
    _brandProducts = brandProducts;
  }

  // Update store products and emit only if changed
  void updateStoreProducts(List<Products> storeProducts) {
    _storeProducts = storeProducts;
  }

  // Update category products and emit only if changed
  void updateCategoryProducts(List<Products> categoryProducts) {
    _categoryProducts = categoryProducts;
  }

  // Update favorite products and emit only if changed
  void updateFavProducts(List<Products> favProducts) {
    _favProducts = favProducts;
  }

  // Update recommended products and emit only if changed
  void updateRecommendedProducts(List<Products> recommendedProducts) {
    _recommendedProducts = recommendedProducts;
  }

  // Clear all products
  void clearAll() {
    _products = [];
    _featuredProducts = [];
    _brandProducts = [];
    _storeProducts = [];
    _categoryProducts = [];
    _favProducts = [];
    _recommendedProducts = [];
  }
}
