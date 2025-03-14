import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageCubit extends Cubit<List<File>> {
  ImageCubit() : super([]);

  Future<List<File>> pickImage() async {
    final xfile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
      imageQuality: 70,
    );

    if (xfile != null) {
      final image = File(xfile.path);
      emit([...state, image]);
    }
    return [...state];
  }

  void emptyCubit() => emit([]);
}
