part of 'brand_bloc.dart';

@immutable
abstract class BrandState {}

class BrandInitial extends BrandState {}

class BrandLoading extends BrandState {}

class BrandUploadSuccess extends BrandState {}

class BrandFailure extends BrandState {}

class BrandsFetchSuccess extends BrandState {}
