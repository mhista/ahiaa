import 'package:flutter_bloc/flutter_bloc.dart';

class BannerCubit extends Cubit<int> {
  BannerCubit() : super(0);

  void updateIndex(int index) {
    emit(index);
  }
}
