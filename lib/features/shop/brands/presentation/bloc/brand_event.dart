part of 'brand_bloc.dart';

@immutable
sealed class BrandEvent {}

final class BrandsGetAll extends BrandEvent {}

final class BrandUpload extends BrandEvent {
  final String id;
  final String name;
  final String image;
  final bool? isFeatured;
  final int? productsCount;

  BrandUpload({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    required this.productsCount,
  });
}
