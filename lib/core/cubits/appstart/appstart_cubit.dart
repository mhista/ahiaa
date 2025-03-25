import 'package:ahiaa/core/routes/route_names.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'appstart_state.dart';

class AppStartCubit extends Cubit<AppStartState> {
  AppStartCubit() : super(AppStartInitial());

  /// Checks app launch state and emits the navigation path
  Future<void> checkAppStart() async {
    final prefs = await SharedPreferences.getInstance();

    final bool isFirstLaunch = prefs.getBool('firstLaunch') ?? true;
    final bool rememberMe = prefs.getBool('rememberMe') ?? false;

    if (isFirstLaunch) {
      await prefs.setBool('firstLaunch', false); // Mark as not first launch
      emit(AppStartNavigate(RouteNames.onBoardinig));
    } else if (rememberMe) {
      emit(AppStartNavigate(RouteNames.home));
    } else {
      emit(AppStartNavigate(RouteNames.sigin));
    }
  }
}
