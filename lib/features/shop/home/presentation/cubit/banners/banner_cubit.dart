import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../utils/constants/image_strings.dart';

class BannerCubit extends Cubit<int> {
  BannerCubit() : super(0);
  final images = [PImages.p1, PImages.p2, PImages.p3];

  void updateIndex(int index) {
    emit(index);
  }
}
