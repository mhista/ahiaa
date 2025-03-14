import 'dart:async';

import 'package:ahiaa/features/shop/banner/domain/usecases/getAllBanners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final GetAllBanners _getAllBanners;

  BannerBloc({required GetAllBanners getAllBanners})
    : _getAllBanners = getAllBanners,
      super(BannerInitial());

  @override
  Stream<BannerState> mapEventToState(BannerEvent event) async* {
    // TODO: implement mapEventToState
  }
}
