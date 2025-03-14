import 'package:flutter_bloc/flutter_bloc.dart';

class ExpandCubit extends Cubit<bool> {
  ExpandCubit() : super(false);

  void makeTrue(state) {
    emit(state);
  }
}

class StopStartScroll extends Cubit<bool> {
  StopStartScroll() : super(false);

  void makeTrue(state) {
    emit(state);
  }
}
