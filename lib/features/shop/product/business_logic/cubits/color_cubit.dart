import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorPickerCubit extends Cubit<List<Color?>> {
  ColorPickerCubit() : super([]);

  Future<void> addColor(Color color) async {
    emit([...state, color]);

    // return [...state];
  }

  void emptyCubit() => emit([]);
}
