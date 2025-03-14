import 'dart:async';

import 'package:ahiaa/features/shop/brands/domain/usecases/get_all_brands.dart';
import 'package:ahiaa/features/shop/brands/domain/usecases/upload_brands.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final UploadBrands _uploadBrands;
  final GetAllBrands _getAllBrands;

  BrandBloc({
    required UploadBrands uploadBrands,
    required GetAllBrands getAllBrands,
  }) : _uploadBrands = uploadBrands,
       _getAllBrands = getAllBrands,
       super(BrandInitial());

  @override
  Stream<BrandState> mapEventToState(BrandEvent event) async* {
    // TODO: implement mapEventToState
  }
}
